<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>

		<link href="css/loginStyle.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<div class="loginArea">
			<div id="left">
				<img id="logo" src="image/loginLogo.png">
			</div>
			<div id="right">
				<p>계정이 없으세요?</p>
				<button id="signUp" type="button" onclick="location='signUp.jsp'">만들기</button>
				<input id="_id" type="text" placeholder="아이디">
				<input id="_pwd" type="password" placeholder="비밀번호">
				<img id="personImg" src="image/person.png">
				<img id="keyImg" src="image/key.png">
				<button id="loginBtn" type="button">로그인</button>
				<button id="lostPwd" type="button" onclick="location='findPwd.jsp'">비밀번호를 잊으셨나요?</button>
			</div>
		</div>
	</body>
</html>