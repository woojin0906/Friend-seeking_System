<!-- 
	작성자: 전우진
	붕붕친구 사용자 확인 페이지user
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
	<link rel="stylesheet" type="text/css" media="screen" href="../css/user.css">
<title>참여자 정보 확인</title>
</head>
<body>
		<script>
			// 가상으로 삽입한 팝업창을 닫는 function	
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
			});
			
			/*$(document).on("click", "#btn", function(){
				$('body').append("<div class=background><div id=popup>"+ "참여되었습니다"
						+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				
				$("#form_1").submit();
			});*/
		</script>
 <header class="header">
        <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
  
        String id = (String) session.getAttribute("ID");
		String number = (String) session.getAttribute("NUM");
		String nick = request.getParameter("_nickName"); // 작성자 nick
		String nickName = (String) session.getAttribute("NICK"); // 현재 로그인된 nick
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nickName%>님 환영합니다.
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
<div id="user">
	<h1>참여자 정보 확인</h1>
<form id="form_1" action="../participateCheck.jsp" method="post">
	<table border=1>

	<%
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member where id = '" + id + "'");
			
			while(rs.next()) {
				%>
				<tr><input type="hidden" name="_number" value="<%=number %>">
					<input type="hidden" name="_id" value="<%=id %>">
					<input type="hidden" name="_nickName" value="<%=nick %>">
					<th>이름</th>
					<td><input id="text" type="hidden" name="_name" value="<%=rs.getString("name") %>"><%=rs.getString("name") %></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input id="text" type="hidden" name="_sex" value="<%=rs.getString("sex") %>"><%=rs.getString("sex") %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input id="text" type="hidden" name="_phone" value="<%=rs.getString("phone") %>"><%=rs.getString("phone") %></td>
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
	<button id="btn" type="submit">참여하기</button>
	</form>
		</div>
	
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
			
			String res = (String) request.getAttribute("_res");
			if (res == null) res = "";
			
			if (res.equals("중복 참여")){
				out.println("<div class=background><div id=popup>"+ "이미 참여했습니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			} 
			
		%>
</body>
</html>