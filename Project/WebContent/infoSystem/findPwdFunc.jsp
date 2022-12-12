<!-- 
	작성자: 김지웅
	findPwd으로부터 데이터를 받고 로그인을 검증하는 페이지
 -->
<%@ page import="encrytion.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find password</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("_id");
			String name = request.getParameter("_name");
			String tel = request.getParameter("_tel");
			
			if( id == null ) id="";
			if( name == null ) name="";
			if( tel == null ) tel="";
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				String sql;
				boolean idCheck = false;
				
				if( !id.equals("") && !name.equals("") && !tel.equals("")) {
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
						sql = "select name,phone from member where id='" + id + "'";
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
			               	String getName = rs.getString(1);
			               	String getPhone = rs.getString(2);
							if(getName.equals(name)){
								if(getPhone.equals(tel)){
									
									SHA256 sha256 = new SHA256();
									String endpw = sha256.enc256(id);
									
									sql = "update member set password='" + endpw + "' where id='" + id + "'";
									pstmt = conn.prepareStatement(sql);
									pstmt.executeUpdate();
									
									request.setAttribute("_res", "성공");
									pageContext.forward("findPwd.jsp");
								} else {
									request.setAttribute("_res", "정보 불일치");
									pageContext.forward("findPwd.jsp");
								}
							} else {
								request.setAttribute("_res", "정보 불일치");
								pageContext.forward("findPwd.jsp");
							}
			            }
					} else {
							request.setAttribute("_res", "아이디 불일치");
							pageContext.forward("findPwd.jsp");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>