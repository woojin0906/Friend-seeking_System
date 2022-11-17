<!-- 
	작성자: 전우진
	participateCheck
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			try {
				request.setCharacterEncoding("UTF-8");
				
				Connection conn = null;
				PreparedStatement stmt = null;
				String sql;
				
				String numb = (String) session.getAttribute("NUM");
				String number = request.getParameter("_number");
				int num =  Integer.parseInt(numb);
				String id = request.getParameter("_id");
				String name = request.getParameter("_name");
				String sex = request.getParameter("_sex");
				String phone = request.getParameter("_phone");
				
				System.out.println(numb);
				if( name == null ) name="";
				if( sex == null ) sex="";
				if( phone == null ) phone="";
				
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					sql = "insert into trafficParticipate (id, number, name, sex, phone) values ('" + id + "', '" + num + "', '" + name + "', '" + sex + "', '" + phone + "')";
					stmt = conn.prepareStatement(sql);
					
					stmt.executeUpdate();
					
					response.sendRedirect("BB/Traffic_writePost.jsp");
					stmt.close();
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
</body>
</html>