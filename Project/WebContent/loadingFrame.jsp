<!-- 
	작성자: 김지웅
	웹 서비스 접속시 가장 먼저 출력되는 페이지
	메인 로고가 fadein, fadeout 효과로 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="resize">
	<head>
 		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<meta charset="UTF-8">
		<link href="css/loadingStyle.css?ver=1" rel="stylesheet" type="text/css">
		<title>Welcome</title>
	</head>
	<body class="resize">
 		<script>
			window.onload = setTimeout(function() {
				$('#moveKid').addClass('move_to_right');
			}, 1000);
		</script>
		
		<div class="bottomDiv">
			<div>
				<img id="logoImg" src="image/logo.png">
				<img class="imgResize" id="moveKid" src="image/moveKid.png">
			</div>
		</div>
	</body>
</html>