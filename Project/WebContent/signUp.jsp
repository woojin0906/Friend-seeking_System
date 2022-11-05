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
				<button id="signUp" type="button" onclick="location='signUp.jsp'">만들기</button>
				<input id="_id" type="text" placeholder="아이디">
				<input id="_pwd" type="password" placeholder="비밀번호">
				<input id="_pwdCheck" type="password" placeholder="비밀번호 확인">
				
				<button id="signupBtn" type="button">회원가입</button>
				<button id="cancelBtn" type="button" onclick="history.back()">취소</button>
			</div>
			<div id="right">
				<img id="logo" src="image/loginLogo.png">
			</div>
		</div>
	</body>
</html>