<!-- 
	작성자: 전우진
	붕붕친구 사용자 확인 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>참여자 정보 확인</h1>
	<script>
		$(document).on("click", "#closeBtn", function(e) {
			let val = $('#popup').text();
			$('.background').addClass('close');
				
			if(val == "참여되었습니다.확인"){
				
				window.location.href = "Traffic_writePost.jsp";
			}
		});
	</script>
	
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
					<td><input type="hidden" name="_name" value="<%=rs.getString("name") %>"><%=rs.getString("name") %></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="hidden" name="_sex" value="<%=rs.getString("sex") %>"><%=rs.getString("sex") %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="hidden" name="_phone" value="<%=rs.getString("phone") %>"><%=rs.getString("phone") %></td>
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
	<input id="btn" type="button" value="참여하기">
	</form>
	
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