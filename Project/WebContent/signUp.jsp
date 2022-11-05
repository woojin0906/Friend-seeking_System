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
				<input id="_id" type="text" placeholder="아이디">
				<input id="_pwd" type="password" placeholder="비밀번호">
				<input id="_name" type="text" placeholder="이름">
				<input id="_tel" type="text" placeholder="전화번호">
				<select id="_sex">
					<option value="none">성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
				<img id="personImg" src="image/person.png">
				<img id="keyImg" src="image/key.png">
				<img id="nameImg" src="image/nameImg.png">
				<img id="sexImg" src="image/sexImg.png">
				<img id="telImg" src="image/telImg.png">
				<button id="signupBtn" type="button">회원가입</button>
				<button id="cancelBtn" type="button" onclick="history.back()">취소</button>
			</div>
			<div id="right">
				<img id="logo" src="image/signUpLogo.png">
			</div>
		</div>
	</body>
</html>