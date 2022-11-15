<!-- 
	작성자: 김지웅
	loginFrame으로부터 데이터를 받고 로그인을 검증하는 페이지
 -->
<%@ page import="encrytion.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("_id");
			String pwd = request.getParameter("_pwd");
			
			if( id == null ) id="";
			if( pwd == null ) pwd="";
			
			SHA256 sha256 = new SHA256();
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String sql;
				boolean idCheck = false, pwdCheck = false;
				
				if( !id.equals("") && !pwd.equals("")) {
					
					String encPwd = sha256.enc256(pwd); // 입력한 패스워드 SHA256으로 암호화
					out.println("입력받은 비밀번호 암호화처리: " + encPwd);
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
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
			               	String password = rs.getString(1); //DB에 받아온 패스워드
							if(password.equals(encPwd)){
								pwdCheck = true;
							}
			            }
						
						if(pwdCheck) {
							
							sql = "select nickname from member where id='" + id + "'";
							rs = stmt.executeQuery(sql);
							String nickname = null;
							
							while(rs.next()){
				               	nickname = rs.getString(1);
							}
							
							session.setAttribute("ID", id);
							session.setAttribute("NICK", nickname);
							response.sendRedirect("../MainPage.jsp");
						} else{
							request.setAttribute("_res", "비밀번호 불일치");
							pageContext.forward("loginFrame.jsp");
						}
					} else {
							request.setAttribute("_res", "아이디 불일치");
							pageContext.forward("loginFrame.jsp");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>