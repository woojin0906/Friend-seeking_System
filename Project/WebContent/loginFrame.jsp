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
				<input id="signUp" type="button" value="만들기">
				<img id="personImg" src="image/person.png">
				<img id="keyImg" src="image/key.png">
				<input id="_id" type="text">
				<input id="_pwd" type="password">
				<input id="loginBtn" type="submit" value="로그인">
			</div>
		</div>
	</body>
</html>