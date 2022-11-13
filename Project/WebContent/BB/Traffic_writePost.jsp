<!-- 
	작성자: 전우진
	붕붕친구 글모음 + 참여자 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="../script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="../css/writePostStyle.css">
 <title>글모음 홈페이지</title>
</head>
<body>
<%
	String number = request.getParameter("number"); 			// 게시판에서 글번호 받아오기
	session.setAttribute("NUM", number);						// 글 수정을 위해 글 번호 세션에 넘기기
	String nick = (String) session.getAttribute("NICK");		// 게시판에서 NICK, ID 받아오기
	String id = (String) session.getAttribute("ID");		
	session.setAttribute("ID", id);
%>
<script>
	$(document).on("click", "#btn", function(){
		let nickval = $('#_nickName').val();
		
		let checkMsg;
		let checkState = true;
	
		if (!nickval.equls(nick)){
			checkMsg = "수정할 권한이 없습니다.";
			checkState = false;
			
			$('body').append("<div class=background><div id=popup>"+ checkMsg 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
		}
		
		if (checkState)
			$("#_form_data").submit();
			window.location.href = "Traffic_writingFrame.jsp";
	});
</script>
    <header class="header">
        <a href="#"><img class ="logoimg"src="../image/logo_mod.png"></a>
        <div class="btnright">
            <button class="custom-btn btn-3"><span>Log In</span></button>
            <button class="custom-btn btn-3"><span>Sign Up</span></button>
        </div>
    </header>
    <div id="boardside">
        <input type="checkbox" id="menuicon">
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="sidebar">
            <div class="cont">
                <ul>
                    <li><a href="#">전체 글 보기</a></li>
                    <li><a href="#">붕붕</a></li>
                    <li><a href="#">게시판 이름</a></li>
                    <li><a href="#">게시판 이름</a></li>                        
                    <li><a href="#">게시판 이름</a></li>
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
         
<div id="main_footer">
 <main>
     <div class="main">
           
     <form id="form_data" action="Traffic_writingChangeFrame.jsp" method="get" >
         <table id="_table_writerPage">
        
	<%
	try {
		 	Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			session.setAttribute("ID", id);								// 참여하기를 위해 ID 세션에 넘기기
			session.setAttribute("NUM", number);						// 글 수정을 위해 글 번호 세션에 넘기기
			
			if(number == null) number = "";
			if(nick == null) nick = "";
			
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
		stmt = conn.createStatement();
		
		// 게시판에서 글 보기로 넘어올 때 넘버 값 사용
		if(!number.equals("")) {
			rs = stmt.executeQuery("select nickname, title, category, promisetime, sex, count, start, dest, main, writetime from traffic where number = '" + number);
		} 
		// 글 작성 후 바로 글 보기로 넘어갈 때 넘버 값을 모르기 때문에 사용자의 NICK을 사용
		if(!nick.equals("")) {
			rs = stmt.executeQuery("select nickname, title, category, promisetime, sex, count, start, dest, main, writetime from traffic where nickname = '" + nick + "'order by number desc limit 1");
		}

		while(rs.next()) {
			%>
			<input type="hidden" name="_number" value="<%=number %>"/> <!-- 글 수정 시 글 번호 필요 -->
             <tr>
                 <th id="table_top"><h2>제목</h2></th>
                 <td id="table_top"><input type="hidden" name="_title" value="<%=rs.getString("title") %>"/><%=rs.getString("title") %></td>
                 <td id="date">작성일자</td>
                 <td id="date_hidden"><input type="hidden" name="_date" value="<%=rs.getString("writetime") %>"/><%=rs.getString("writetime") %></td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td id="hidden" colspan="2"><input type="hidden" name="_nickName" value="<%=rs.getString("nickname") %>"/><%=rs.getString("nickname") %></td> <!-- 여기에는 작성자 이름을 받아올 예정 -->        
                 <td id="btn_writePost1"><button id="btn" type="submit" >수정하기</button></td>
             </tr>
      		 <tr>
                 <th>종류</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_type" value="<%=rs.getString("category") %>" /><%=rs.getString("category") %></td>        
             </tr>
             <tr>
                 <th>시간</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_time" value="<%=rs.getString("promisetime") %>" /><%=rs.getString("promisetime") %></td>        
             </tr>
             <tr>
                 <th>성별</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_gender" value="<%=rs.getString("sex") %>"/><%=rs.getString("sex") %></td>        
             </tr>
             <tr>
                 <th>인원</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_person" value="<%=rs.getString("count") %>"/><%=rs.getString("count") %></td>        
             </tr>
             <tr>
                 <th>출발지</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_depart" value="<%=rs.getString("start") %>"/><%=rs.getString("start") %></td>        
             </tr>
             <tr>
                 <th>도착지</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_arrival" value="<%=rs.getString("dest") %>"/><%=rs.getString("dest") %></td>        
             </tr>
             <tr>
                 <th>기타 내용</th>
                 <td id="context" colspan="3"><input type="hidden" name="_context" value="<%=rs.getString("main") %>"/><%=rs.getString("main") %></td>        
             </tr>
         </table>    
         </form>
      <%
		}
		rs.close();
		stmt.close();
		conn.close();

	} catch(Exception e) {
		e.printStackTrace();
	}
		%>
		
	  <div class="table2">
         <form>
             <h2>참여자</h2>
             <input id="btn_check" type="button" value="참여하기" onclick="location.href='Traffic_participateUser.jsp'"/>
             <table id="_talbe_participants">
                 <tr>
                     <th>이름</th>
                     <th>성별</th>
                     <th>전화번호</th>
                 </tr>
     <%
        try {
        	Connection conn = null;
      		Statement stmt = null;
      		ResultSet rs = null;

	   		if(number == null) number = "";
	    	if(nick == null) nick = "";
	    	
	        Class.forName("com.mysql.cj.jdbc.Driver"); 
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	        stmt = conn.createStatement();
         		
			if(!number.equals("")) {
				rs = stmt.executeQuery("select * from trafficParticipate where number = '" + number + "'");
			} 
			
			if(!nick.equals("")) {
				rs = stmt.executeQuery("select * from trafficParticipate where nickname = '" + nick + "'order by number desc limit 1");
			}
			
			while(rs.next()) {
      %> 	
                 <tr>
                     <td><input type="hidden" name="_name" value=""/><%=rs.getString("name") %></td>
                     <td><input type="hidden" name="_sex" value=""/><%=rs.getString("sex") %></td>
                     <td><input type="hidden" name="_phone" value=""/><%=rs.getString("phone") %></td>
                 </tr>
              
     <%		 	
		}
		rs.close();
		stmt.close();
		conn.close();

	} catch(Exception e) {
		e.printStackTrace();
	}

   %>
             </table>
         </form>
         </div> 
     </div>
 </main>

 <!-- <footer>

     <nav id="bottom_menu">
         <ul>
             <li>구해줘! 프렌즈</li>
             <li>개인정보처리방침</li>
             <li>저작권 정보</li>
             <li>이용 안내</li>
         </ul>
     </nav>
     <div class="items">
         <h2 class="items_name">문의전화</h2>
         <ul>
             <li class="phone">123-1234</li>
             <li>10:00 - 18:00(Lunch 12:00 - 13:00)</li>
         </ul>
     </div>
     <div class="items">
         <h2 class="items_name">구해줘! 프렌즈</h2>
         <ul>
             <li>주소 : 인천광역시 남구 인하로 100</li>
             <li>전화 : 031-123-1234</li>
             <li>팩스 : 031-123-1234</li>
             <li>이메일 : 123-12-12345</li>
         </ul>
     </div>
     <div class="items">
         <h2 class="items_name">입금 정보</h2>
         <ul>
             <li>농협 123-123-123456</li>
             <li>구해줘! 프렌즈</li>
         </ul>
     </div>

</footer>  -->
</div>
</body>
</html>