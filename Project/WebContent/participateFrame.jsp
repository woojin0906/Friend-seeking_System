<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="css/writePostStyle.css">
 <title>참여자 홈페이지</title>
</head>
<body>
<div class="table2">
         <form action="participateFrame.jsp" method="get">
             <h2>참여자</h2>
             <table id="_talbe_participants">
                 <tr>	
                 	 <th>번호</th>
                 	 <th>글 번호</th>
                     <th>이름</th>
                     <th>성별</th>
                     <th>전화번호</th>
                 </tr>
      <%
	    Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String number = request.getParameter("_number");
		String nick = request.getParameter("_nickName");
		
		if(number == null) number = "";
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
		stmt = conn.createStatement();
		if(!number.equals("") && !nick.equals("")) {
		rs = stmt.executeQuery("select * from trafficParticipate where number = '" + number + "'");
		}
		else if(!nick.equals("")) {
		rs = stmt.executeQuery("select * from trafficParticipate where number = '" + number + "'order by number desc limit 1");
			
		}

		// 포인터 얻어와야함 -> rs.next()
		while(rs.next()) {
			
			String num = rs.getString("number");
			String name = rs.getString("name");
			String sex = rs.getString("sex");
			String phone = rs.getString("phone");
			
			out.println("<tr>");
			out.println("<td>" + num + "</td>");
			out.println("<td>" + number + "</td>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + sex + "</td>");
			out.println("<td>" + phone + "</td>");
			out.println("</tr>");
		}

		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
                 <input id="btn" type="button" value="참여하기">
             </table>
         </form>
         </div>
</body>
</html>