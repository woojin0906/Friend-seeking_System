<!-- 
	작성자: 김지웅
	회원가입하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<input name="_name" id="_name" type="text" placeholder="이름">
					<input name="_tel" id="_tel" type="text" placeholder="전화번호">
					<select name="_sex" id="_sex">
						<option value="none">성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
					<img id="personImg" src="image/person.png">
					<img id="keyImg" src="image/key.png">
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
			String name = request.getParameter("_name");
			String sex = request.getParameter("_sex");
			String tel = request.getParameter("_tel");
			
			if( id == null ) id=null;
			if( pwd == null ) pwd=null;
			if( name == null ) name=null;
			if (sex == null ) sex=null; 
			if( tel == null ) tel=null;
			
			out.println(id);
			out.println(pwd);
			out.println(name);
			out.println(sex);
			out.println(tel);
			
			if( id != null && pwd != null && name != null && sex != null && tel != null){
				out.println("DB로 쏜다");
			
			}
		%>
	</body>
</html>