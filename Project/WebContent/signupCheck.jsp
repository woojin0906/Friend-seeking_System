<!-- 
	작성자: 김지웅
	회원 가입에 필요한 정보를 입력하고 유효성 검사 및 signupCheck로 데이터 전송하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign up</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("_id");
			String pwd = request.getParameter("_pwd");
			String nickname = request.getParameter("_nickname");
			String name = request.getParameter("_name");
			String sex = request.getParameter("_sex");
			String tel = request.getParameter("_tel");
			
			if( id == null ) id="";
			if( pwd == null ) pwd="";
			if( nickname == null) nickname="";
			if( name == null ) name="";
			if (sex == null ) sex=""; 
			if( tel == null ) tel="";
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				boolean infoState = true, infoState2 = true;
				String infoMsg;
				String sql;
				
				if( !id.equals("") && !pwd.equals("") && !nickname.equals("") && 
						!name.equals("") && !sex.equals("") && !tel.equals("")){
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					
					sql = "select id from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
		               	String user = rs.getString(1);
						if(user.equals(id)){
							infoState = false;
							break;
						}
		            }
					
					sql = "select nickname from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
		               	String nick = rs.getString(1);
						if(nick.equals(nickname)){
							infoState2 = false;
							break;
						}
		            }
					
					if(infoState && infoState2) {
						sql = "insert into member values('" 
						+ id + "','" +  pwd + "','" + name + "','" + sex + "','" + tel
						+ "','" + nickname + "')";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.executeUpdate();
						request.setAttribute("_res", "완료");
						pageContext.forward("signUp.jsp");
					}
					else {
						if(infoState == false && infoState2 == false){
							request.setAttribute("_res", "중복 아이디,닉네임");
							pageContext.forward("signUp.jsp");
						}
						else if(infoState == false){
							request.setAttribute("_res", "중복 아이디");
							pageContext.forward("signUp.jsp");
						}
						else if(infoState2 == false){ 
							request.setAttribute("_res", "중복 닉네임");
							pageContext.forward("signUp.jsp");
						}
					}
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>