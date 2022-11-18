<!-- 
	작성자: 전우진
	냠냠친구 글수정 update문
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
			
			Connection conn = null;
			PreparedStatement stmt = null;
			
			Date nowTime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sf.format(nowTime);
			
		    // writePost로 부터 넘버값 받아서 update하기
			String num = (String) session.getAttribute("NUM");
 			session.setAttribute("NUM", num);
			
			String title = request.getParameter("_title");
			String nickname = request.getParameter("_nickName");
			String type = request.getParameter("_type");
			String time = request.getParameter("_time");
			String gender = request.getParameter("_gender");
			String person = request.getParameter("_person");
			String alcohol = request.getParameter("_alcohol");
			String arrival = request.getParameter("_arrival");
			String context = request.getParameter("_context");
			
			if( !title.equals("") && !time.equals("") && !person.equals("") && !gender.equals("") && !type.equals("") && !alcohol.equals("") && !arrival.equals("") && !context.equals("")) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver"); 
					conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
					stmt = conn.prepareStatement("update meal set nickname = '" + nickname + "', title = '" + title +  "', promisetime = '" + time + "', count = '" + person + "', sex = '" + gender + "', category = '" + type + "', drink = '" + alcohol + "', dest = '" + arrival + "', main = '" + context + "', writetime = '" + date + "'where number ='" + num + "'");
					
					stmt.executeUpdate();
					
					out.println("<div class=background><div id=popup>"+ "글이 수정되었습니다." 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
					
					stmt.close();
					conn.close();

					response.sendRedirect("Meal_writePost.jsp");
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
%>	
</body>
</html>