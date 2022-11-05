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
		<script language="javascript">
			function test(){
				document.signUp.value="ㅎㅇ";
			}
		</script>
		<div class="loginArea">
			<div id="left">
				<img id="logo" src="image/loginLogo.png">
			</div>
			<div id="right">
				<p>계정이 없으세요?</p>
				<button id="signUp" type="button" onclick="location='signUp.jsp'">만들기</button>
				<input id="_id" type="text">
				<input id="_pwd" type="password">
				<img id="personImg" src="image/person.png">
				<img id="keyImg" src="image/key.png">
				<input id="loginBtn" type="submit" value="로그인">
				<button id="lostPwd" type="button" onclick="location='findPwd.jsp'">비밀번호를 잊으셨나요?</button>
			</div>
		</div>
	</body>
</html>