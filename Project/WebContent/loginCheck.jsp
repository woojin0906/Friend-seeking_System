<!-- 
	작성자: 김지웅
	loginFrame으로부터 데이터를 받고 로그인을 검증하는 페이지
 -->

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
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
			               	String password = rs.getString(1);
							if(password.equals(pwd)){
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
							response.sendRedirect("index.jsp");
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