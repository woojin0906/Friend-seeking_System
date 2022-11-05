<!-- 
	작성자: 김지웅
	비밀번호 찾는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find password</title>
		
		<link href="css/findPwd.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<div class="findArea">
			<p>비밀번호 찾기</p>
			<input id="_id" type="text" placeholder="아이디">
			<input id="_name" type="text" placeholder="이름">
			<input id="_tel" type="text" placeholder="전화번호">
			<img id="personImg" src="image/person.png">
			<img id="nameImg" src="image/nameImg.png">
			<img id="telImg" src="image/telImg.png">
			<button id="findBtn" type="button">찾기</button>
			<button id="cancelBtn" type="button" onclick="history.back()">취소</button>
		</div>
		<img id="kid" src="image/moveKid.png">
		<img id="kid2" src="image/kid.png">
	</body>
</html>