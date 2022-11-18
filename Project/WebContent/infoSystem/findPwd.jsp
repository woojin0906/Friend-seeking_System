<!-- 
	작성자: 김지웅
	정보를 입력받고 유효성 검사 및 findPwdFunc로 데이터 전송하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find password</title>
		
		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<link href="../css/findPwd.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
		<script>
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
				
				if(val == "비밀번호가 아이디로 변경되었습니다.확인")
					window.location.replace('loginFrame.jsp');
			});
			
			$(document).on("click", "#findBtn", function(){
				let idval = $('#_id').val();
				let nameval = $('#_name').val();
				let telval = $('#_tel').val();
				
				let checkMsg;
				let checkState = true;
			
				if (idval == "" || nameval == "" || telval == ""){
					checkMsg = "모든 입력값을 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				if (checkState)
					$("#_dataForm").submit();
			});
		</script>
		<div class="findArea">
			<p>비밀번호 찾기</p>
			<Form id="_dataForm" action="findPwdFunc.jsp" method="post">
				<input name="_id" id="_id" type="text" placeholder="아이디">
				<input name="_name" id="_name" type="text" placeholder="이름">
				<input name="_tel" id="_tel" type="text" placeholder="전화번호">
			</Form> 
			<img id="personImg" src="../image/person.png">
			<img id="nameImg" src="../image/nameImg.png">
			<img id="telImg" src="../image/telImg.png">
			<button id="findBtn" type="button">찾기</button>
			<button id="cancelBtn" type="button" onclick="history.back()">취소</button>
		</div>
		<img id="kid" src="../image/moveKid.png">
		<img id="kid2" src="../image/kid.png">
		<%
			request.setCharacterEncoding("UTF-8");
			
			String res = (String) request.getAttribute("_res");
			if (res == null) res = "";
			
			if (res.equals("성공")){
				out.println("<div class=background><div id=popup>"+ "비밀번호가 아이디로 변경되었습니다." 
				+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			} else if(res.equals("정보 불일치")){
				out.println("<div class=background><div id=popup>"+ "입력하신 정보가 일치하지 않습니다." 
				+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			} else if(res.equals("아이디 불일치")){
				out.println("<div class=background><div id=popup>"+ "아이디가 없거나 일치하지 않습니다." 
				+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
		%>
	</body>
</html>