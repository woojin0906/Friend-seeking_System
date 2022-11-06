<!-- 
	작성자: 김지웅
	회원가입하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign up</title>
	
		<link href="css/signupStyle.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<div class="signupArea">
			<div id="left">
				<p>회원가입</p>
				<form action="signUp.jsp" method="post">
					<input name="_id" id="_id" type="text" placeholder="아이디">
					<input name="_pwd" id="_pwd" type="password" placeholder="비밀번호">
					<input name="_nickname" id="_nickname" type="text" placeholder="닉네임">
					<input name="_name" id="_name" type="text" placeholder="이름">
					<input name="_tel" id="_tel" type="text" placeholder="전화번호">
					<select name="_sex" id="_sex">
						<option value="">성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
					<img id="personImg" src="image/person.png">
					<img id="keyImg" src="image/key.png">
					<img id="nickname" src="image/nicknameImg.png">
					<img id="nameImg" src="image/nameImg.png">
					<img id="sexImg" src="image/sexImg.png">
					<img id="telImg" src="image/telImg.png">
					<button id="signupBtn" type="submit">회원가입</button>
				</form>
				<button id="cancelBtn" type="button" onclick="history.back()">취소</button>
			</div>
			<div id="right">
				<img id="logo" src="image/signUpLogo.png">
			</div>
		</div>
		
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
			
			out.println(id);
			out.println(pwd);
			out.println(nickname);
			out.println(name);
			out.println(sex);
			out.println(tel);
			
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
					out.println("DB 전송");
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
						out.println("중복이 없음");
						sql = "insert into member values('" 
						+ id + "','" +  pwd + "','" + name + "','" + sex + "','" + tel
						+ "','" + nickname + "')";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.executeUpdate();
					}
					else {
						if(infoState == false && infoState2 == false){
							infoMsg = "이미 사용중인 아이디와 닉네임입니다.";
							out.println(infoMsg);
						}
						else if(infoState == false){
							infoMsg = "이미 사용중인 아이디입니다.";
							out.println(infoMsg);
						}
						else if(infoState2 == false){ 
							infoMsg = "이미 사용중인 닉네임입니다.";
							out.println(infoMsg);
						}
					}
				} else{
					infoMsg = "모든 값이 입력되지 않았습니다.";					
					out.println(infoMsg);
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>