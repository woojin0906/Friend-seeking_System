<!-- 
	작성자: 전우진
	열공친구 글작성 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="../script/header.js" type="text/javascript"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/writerStyle.css">
    <title>열공친구 글작성 홈페이지</title>
</head>
<body>
<script>
			
			// input에 데이터를 모두 입력했는지 검사하고,
			// 데이터 유효성 검사를 한 뒤 submit 하여 데이터 전송하는 function
			$(document).on("click", "#btn", function(){
				let titleval = $('#_title').val();
				let typeval = $('#_type').val();
				let genval = $('#_gender').val();
				let perval = $('#_person').val();
				let arrval = $('#_arrival').val();
				let conval = $('#_context').val();
				let timeval = $('#_time').val();
				
				let checkMsg;
				let checkState = true;
				
				if (titleval == "" || typeval == "" || genval == "" || perval == ""
						|| arrval == "" || conval == "" || timeval == ""){
					checkMsg = "모든 입력값을 입력해주세요.";
					checkState = false;
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				} 
				
				if(checkState == true)
					$("#form_1").submit();
				}
	);
			//가상으로 삽입한 팝업창을 닫는 function	
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
					
				if(val == "글이 등록되었습니다.확인"){
					
					window.location.href = "Study_writePost.jsp";
				}
			});
</script>

<%
	String nick = (String) session.getAttribute("NICK");
	session.setAttribute("NICK", nick);
	String id = (String) session.getAttribute("ID");				// 참여하기를 위해 ID 세션에 받아오기
	session.setAttribute("ID", id);				
%>

	
    <header class="header">
        <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
  
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nick%>님 환영합니다.
 	            <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/profile.jsp'"><span>Mypage</span></button>
 	            <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/logout.jsp'"><span>LogOut</span></button>
 	        </div>
		<!-- 로그인 안 했을 때 -->
        <% } else { %>
 	        <div class="btnright">
 	        	
 	            <button id="loginBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/loginFrame.jsp'"><span>Log In</span></button>
 	            <button id="sognUpBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/signUp.jsp'"><span>Sign Up</span></button>
 	        </div>
       	<% } %>
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
                    <li><a href="../PostMain.jsp">전체 글 보기</a></li>
                    <li><a href="BB_friend.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="../NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>

       
<div id="main_footer">
    <main>
        <div class="main">
            <div class="main_name">
                <h1>글작성</h1>
            </div>
            
        
        <form id="form_1" action="Study_writingFrame.jsp" method="post" >
            <table>
                <tr>
                    <th>제목</th>
                    <td><input id="_title" type="text" name="_title" size="120" maxlength="100" value=""/></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=nick %><input type="hidden" name="_nickname" value="<%=nick%>"></td> <!-- 여기에는 작성자 이름을 받아올 예정 -->        
                </tr>
         		<tr>
                    <th>종류</th>
                     <td>
                     	<input id="_type" type="radio" name="_type" value="자격증"/>자격증
                    	<input id="_type" type="radio" name="_type" value="토익"/>토익 
                        <input id="_type" type="radio" name="_type" value="코딩"/>코딩 
                        <input id="_type" type="radio" name="_type" value="전공"/>전공
                    </td>        
                </tr>
                <tr>
                    <th>시간</th>
                    <td><input id="_time" type="text" name="_time" size="50" maxlength="100" value="" /></td>        
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                    	<input id="_gender" type="radio" name="_gender" value="여자"/>여자 
                        <input id="_gender" type="radio" name="_gender" value="남자"/>남자
                        <input id="_gender" type="radio" name="_gender" value="상관없음"/>상관없음
                    </td>        
                </tr>
                <tr>
                    <th>인원</th>
                    <td><input id="_person" type="radio" name="_person" value="2명"/>2명 
                        <input id="_person" type="radio" name="_person" value="3명"/>3명
                        <input id="_person" type="radio" name="_person" value="4명"/>4명
                        <input id="_person" type="radio" name="_person" value="5명 이상"/>5명 이상
                        <input id="_person" type="radio" name="_person" value="상관없음"/>상관없음
                    </td>        
                </tr>
                <tr>
                    <th>도착지</th>
                    <td><input id="_arrival" type="text" name="_arrival" size="50" maxlength="100" value=""/></td>        
                </tr>
                <tr>
                    <th>기타 내용</th>
                    <td><textarea id="_context" name="_context" cols="122" rows="10"></textarea></td>        
                </tr>
                <tr>
                    <td colspan="2"><input id="btn" type="button" value="작성완료"></td>
                </tr>
            </table>    
            </form>
        </div>
    </main>

    <footer>
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
            	<li>구해줘! 프렌즈</li>
                <li>농협 123-123-123456</li>
                
            </ul>
        </div>

</footer>
</div>
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	PreparedStatement stmt = null;

	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = sf.format(nowTime);
	
	String title = request.getParameter("_title");
	String type = request.getParameter("_type");
	String time = request.getParameter("_time");
	String gender = request.getParameter("_gender");
	String person = request.getParameter("_person");
	String arrival = request.getParameter("_arrival");
	String context = request.getParameter("_context");
	
	if( title == null ) title="";
	if( type == null) type="";
	if( time == null) time="";
	if( gender == null) gender="";
	if( person == null) person="";
	if( arrival == null) arrival="";
	if( context == null) context="";
	
	if( !title.equals("") && !time.equals("") && !person.equals("") && !gender.equals("") && !type.equals("") && !arrival.equals("") && !context.equals("")) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
			
				stmt = conn.prepareStatement("insert into study (nickname, title, writetime, count, sex, dest, main, promisetime, category) values ('" +
						nick + "'," + "'" + title + "'," + "'" + date + "'," + "'" + person + "'," + "'" + gender + "'," + "'" + arrival + "'," + "'" + context + "'," + "'" + time + "'," + "'" + type + "')");
			
			stmt.executeUpdate();
			
			out.println("<div class=background><div id=popup>"+ "글이 등록되었습니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	}
		
		
	
%>
</body>

</html>