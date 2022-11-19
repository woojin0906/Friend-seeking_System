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
			
 			// hidden으로 숨겨진 number값을 받아와 해당하는 넘버값의 글 수정하기
 			String number = (String) session.getAttribute("NUM");
 			session.setAttribute("NUM", number);	
 			if(number == null) number = "";

 			String title = request.getParameter("_title");
			String nickname = request.getParameter("_nickname");
			String type = request.getParameter("_type");
			String time = request.getParameter("_time");
			String gender = request.getParameter("_gender");
			String person = request.getParameter("_person");
			String arrival = request.getParameter("_arrival");
			String context = request.getParameter("_context");
			String alcohol = request.getParameter("_alcohol");

			if( !title.equals("") && !time.equals("") && !person.equals("") && !gender.equals("") && !type.equals("") && !alcohol.equals("") && !arrival.equals("") && !context.equals("")) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver"); 
					conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
					
					// 게시판에서 글보기로 넘어온 경우 넘버와 닉이 공백이 아님
					if(!number.equals("") && !nickname.equals("")) {
						stmt = conn.prepareStatement("update meal set nickname = '" + nickname + "', title = '" + title +  "', promisetime = '" + time + "', count = '" + person + "', sex = '" + gender + "', category = '" + type + "', drink = '" + alcohol + "', dest = '" + arrival + "', main = '" + context + "', writetime = '" + date + "'where number ='" + number + "'");
					}
					
					// 게시판에서 글 작성 후 글보기로 넘어온 경우 넘버가 없으므로 닉이 공백이 아님
					else if(!nickname.equals("")){
						stmt = conn.prepareStatement("update meal set nickname = '" + nickname + "', title = '" + title +  "', promisetime = '" + time + "', count = '" + person + "', sex = '" + gender + "', category = '" + type + "', drink = '" + alcohol + "', dest = '" + arrival + "', main = '" + context + "', writetime = '" + date + "'where nickname ='" + nickname + "'order by number desc limit 1");
					
					}
					
					
					stmt.executeUpdate();
					
					response.sendRedirect("Meal_writePost.jsp");
					
					stmt.close();
					conn.close();

				} catch(Exception e) {
					e.printStackTrace();
				}
			}
%>	
</body>
</html>