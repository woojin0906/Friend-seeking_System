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
			
				request.setCharacterEncoding("UTF-8");
	
				String nick = (String) session.getAttribute("NICK");		// 게시판에서 NICK, ID 받아오기
				String numb = (String) session.getAttribute("NUM");
				String number = request.getParameter("_number");
				int num =  Integer.parseInt(numb);
				String id = request.getParameter("_id");
				String name = request.getParameter("_name");
				String sex = request.getParameter("_sex");
				String phone = request.getParameter("_phone");
				System.out.println("사용자 닉 : " + nick);				
		
				if( name == null ) name="";
				if( sex == null ) sex="";
				if( phone == null ) phone="";
				
				try {
					Connection conn = null;
					Statement sstmt = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
					String sql;
					boolean infoState = true;
					
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
				//e.printStackTrace();
				request.setAttribute("_res", "중복 참여");
				pageContext.forward("BB/Traffic_participateUser.jsp");
			}
		%>
</body>
</html>