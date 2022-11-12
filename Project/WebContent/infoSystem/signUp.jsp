<!-- 
	작성자: 김지웅
	signUp으로부터 데이터를 받고 회원가입을 검증하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign up</title>
	
		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<link href="css/signupStyle.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<script>
			// 가상으로 삽입한 팝업창을 닫는 function	
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
				
				if(val == "회원가입이 완료되었습니다.확인")
					window.location.replace('loginFrame.jsp');
			});
			
			function appendHtml(msg){
				$('body').append("<div class=background><div id=popup>"+ msg
						+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
			
			// input에 데이터를 모두 입력했는지 검사하고,
			// 데이터 유효성 검사를 한 뒤 submit 하여 데이터 전송하는 function
			$(document).on("click", "#signupBtn", function(){
				let idval = $('#_id').val();
				let pwdval = $('#_pwd').val();
				let nickval = $('#_nickname').val();
				let nameval = $('#_name').val();
				let telval = $('#_tel').val();
				let sexval = $('#_sex').val();
				
				let checkMsg;
				let checkState = true;
				
				if (idval == "" || pwdval == "" || nickval == "" 
						|| nameval == "" || telval == "" || sexval == ""){
					appendHtml("모든 입력값을 입력해주세요.");
					checkState = false;
				}
				
				else if (idval.length < 4 || idval.length > 16){
					appendHtml("아이디는 4~16자 사이로 입력해주세요.");
					checkState = false;
				}
				
				else if (pwdval.length < 8 || pwdval.length > 20){
					appendHtml("비밀번호는 8~20자 사이로 입력해주세요.");
					checkState = false;
				}
				
				else if (nickval.length > 8){
					appendHtml("닉네임은 8자 이하로 입력해주세요.");
					checkState = false;
				}
				
				else if (nameval.length > 6){
					appendHtml("이름은 6자 이하로 입력해주세요.");
					checkState = false;
				}
				
				else if (telval.length > 13){
					appendHtml("전화번호는 13자 이하로 입력해주세요.");
					checkState = false;
				}
					
				if(checkState){
					$("#_dataForm").submit();
				}
			});
			
		</script>
		<div class="signupArea">
			<div id="left">
				<p>회원가입</p>
				<form id="_dataForm" action="signupCheck.jsp" method="post">
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
				</form>
					<img id="personImg" src="image/person.png">
					<img id="keyImg" src="image/key.png">
					<img id="nickname" src="image/nicknameImg.png">
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
		
		<%
			request.setCharacterEncoding("UTF-8");
			
			String res = (String) request.getAttribute("_res");
			if (res == null) res = "";
			
			if (res.equals("중복 아이디,닉네임")){
				out.println("<div class=background><div id=popup>"+ "이미 사용중인 아이디와 닉네임입니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			} 
			else if (res.equals("중복 아이디")) {
				out.println("<div class=background><div id=popup>"+ "이미 사용중인 아이디입니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
			else if (res.equals("중복 닉네임")) {
				out.println("<div class=background><div id=popup>"+ "이미 사용중인 닉네임입니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
			else if (res.equals("완료")) {
				out.println("<div class=background><div id=popup>"+ "회원가입이 완료되었습니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
		%>
	</body>
</html>