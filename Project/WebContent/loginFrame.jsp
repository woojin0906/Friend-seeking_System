<!-- 
	작성자: 김지웅
	로그인하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	
		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<link href="css/loginStyle.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<script>
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
			});
			
			$(document).on("click", "#loginBtn", function(){
				let idval = $('#_id').val();
				let pwdval = $('#_pwd').val();
				
				let checkMsg;
				let checkState = true;
				
				if (idval == "" || pwdval == ""){
					
					checkMsg = "모든 입력값을 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				if (checkState)
					$("#_loginData").submit();
			});
		</script>
		<div class="loginArea">
			<div id="left">
				<img id="logo" src="image/loginLogo.png">
			</div>
			<div id="right">
				<p>계정이 없으세요?</p>
				<button id="signUp" type="button" onclick="location.href='signUp.jsp'">만들기</button>
				<Form id="_loginData" action="loginFrame.jsp" method="post">
					<input name="_id" id="_id" type="text" placeholder="아이디">
					<input name="_pwd" id="_pwd" type="password" placeholder="비밀번호">
				</Form>
				<img id="personImg" src="image/person.png">
				<img id="keyImg" src="image/key.png">
				<button id="loginBtn" type="button">로그인</button>
				<button id="lostPwd" type="button" onclick="location.href='findPwd.jsp'">비밀번호를 잊으셨나요?</button>
			</div>
		</div>
		
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("_id");
			String pwd = request.getParameter("_pwd");
			
			if( id == null ) id="";
			if( pwd == null ) pwd="";
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String sql;
				boolean idCheck = false, pwdCheck = false;
				
				if( !id.equals("") && !pwd.equals("")) {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					
					sql = "select id from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
		               	String user = rs.getString(1);
						if(user.equals(id)){
							idCheck = true;
							break;
						}
		            }
					
					if(idCheck) {
						sql = "select password from member where id='" + id + "'";
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
			               	String password = rs.getString(1);
							if(password.equals(pwd)){
								pwdCheck = true;
							}
			            }
						
						if(pwdCheck) {
							
							sql = "select nickname from member where id='" + id + "'";
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							String nickname = null;
							
							while(rs.next()){
				               	nickname = rs.getString(1);
							}
							
							response.sendRedirect("index.jsp");
							session.setAttribute("ID", id);
							session.setAttribute("NICK", nickname);
						} else{
						out.println("<div class=background><div id=popup>"+ "비밀번호가 일치하지 않습니다." 
						+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
						}
					} else {
						out.println("<div class=background><div id=popup>"+ "아이디가 없거나 일치하지 않습니다." 
						+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>