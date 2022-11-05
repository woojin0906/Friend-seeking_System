<!-- 
	작성자: 김지웅
	웹 서비스 접속시 가장 먼저 출력되는 페이지
	여러 애니메이션 효과 적용 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome</title>
		
 		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<link href="css/loadingStyle.css?ver=1" rel="stylesheet" type="text/css">
 		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
 		
	</head>
	<body id="mainBody">
 		<script>
			window.onload = setTimeout(function() {
				$('#moveKid').addClass('move_to_right');
				setTimeout(function() {
					$('#hiMsg').css({"visibility" : "visible"});
					$('#hiMsg').addClass('hi_everyone');
					setTimeout(function() {
						$('#info').css({"visibility" : "visible"});
						$('#info').addClass('up_info');
						setTimeout(function() {
							$('#hiMsg').css({"top" : "10%", "left" : "83%"});
							$('#moveKid').css({"top" : "29%", "left" : "64%"});
							$('#info').css({"top" : "-23%", "left" : "-12%"});
							$('#mainBody').addClass('move_gelatine');
						}, 1000);
					}, 1500);
				}, 3500);
			}, 1000);
		</script>
		
		<div class="bottomDiv">
			<div>
				<h2 id="info">친구 구할 땐?</h2>
				<img id="logoImg" src="image/logo.png">
				<img id="moveKid" src="image/moveKid.png">
				<img id="hiMsg" src="image/msg.png">
			</div>
		</div>
	</body>
</html>