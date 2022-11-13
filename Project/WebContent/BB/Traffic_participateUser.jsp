<!-- 
	작성자: 전우진
	붕붕친구 사용자 확인 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="script/header.js" type="text/javascript"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/user.css">
<title>참여자 정보 확인</title>
</head>
<body>
		<script>
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
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
<div id="user">
	<h1>참여자 정보 확인</h1>
<form action="Traffic_participateUser.jsp" method="post">
	<table border=1>

	<%
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			String id = (String) session.getAttribute("ID");
			session.setAttribute("ID", id);
			String number = request.getParameter("number");
			session.setAttribute("NUM", number);
			
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member where id = '" + id + "'");
			
			while(rs.next()) {
				%>
				<tr><input type="hidden" name="_number" value="<%=number %>">
					<input type="hidden" name="_id" value="<%=id %>">
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
	<button id="btn" type="button">참여하기</button>
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
			try {
				request.setCharacterEncoding("UTF-8");
				
				Connection conn = null;
				PreparedStatement stmt = null;
				String sql;
					
				String number = request.getParameter("_number");
				String id = request.getParameter("_id");
				String name = request.getParameter("_name");
				String sex = request.getParameter("_sex");
				String phone = request.getParameter("_phone");
				
				if( name == null ) name="";
				if( sex == null ) sex="";
				if( phone == null ) phone="";
				
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					sql = "insert into trafficParticipate (number, id, name, sex, phone) values ('" + "48" + "', '" + id + "', '" + name + "', '" + sex + "', '" + phone + "')";
					stmt = conn.prepareStatement(sql);
					
					stmt.executeUpdate();
					
					out.println("<div class=background><div id=popup>"+ "참여되었습니다." 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
					
					stmt.close();
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
</body>
</html>