<!-- 
	작성자: 김지웅
	로그인 정보를 입력받고 유효성 검사 및 loginCheck로 데이터 전송하는 페이지
 -->

<!-- 페이지가 너무 무거워지는 것 같아 필요 요소만 import -->
<%@ page import="java.security.PublicKey"%>
<%@ page import="java.security.spec.RSAPublicKeySpec"%>
<%@ page import="java.security.PrivateKey"%>
<%@ page import="java.security.KeyFactory"%>
<%@ page import="java.security.KeyPair"%>
<%@ page import="java.security.KeyPairGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	
		<script src="//code.jquery.com/jquery-3.5.1.js"></script>
		<script type="text/javascript" src="../script/rsa.js"></script>
		<script type="text/javascript" src="../script/jsbn.js"></script>
		<script type="text/javascript" src="../script/prng4.js"></script>
		<script type="text/javascript" src="../script/rng.js"></script>
		
		<link href="../css/loginStyle.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
	<%	
			request.setCharacterEncoding("UTF-8");
		
			// 공개키와 개인키 생성
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");  //암호 알고리즘 RSA로 지정
			generator.initialize(2048); // 키 사이즈가 부족하지 않게 넉넉하게 줌
			
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();

			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			
			// 세션에 개인키 저장, 복호화하는 곳에서 가져가서 복호화에 사용함
			session.setAttribute("privateKey", privateKey);
			
			String res = (String) request.getAttribute("_res");
			if (res == null) res = "";
			
			if (res.equals("비밀번호 불일치")) { 
				out.println("<div class=background><div id=popup>"+ "비밀번호가 일치하지 않습니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			}
			
			else if (res.equals("아이디 불일치")) {
				out.println("<div class=background><div id=popup>"+ "아이디가 없거나 일치하지 않습니다." 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
			} 
		%>
		
		<script type="text/javascript">
			$(document).on("click", "#closeBtn", function(e) {
				let val = $('#popup').text();
				$('.background').remove();
			});
			
			$(document).on("click", "#loginBtn", function(){
				let idval = $('#_id').val();
				let pwdval = $('#_pwd').val();
				
				let checkMsg;
				let checkState = true;
			
				if (idval == "" || pwdval == ""){
					checkMsg = "모든 입력값을 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				if (checkState) {
					let rsaPublicKeyModulus = "<%=publicKeyModulus%>";
			    	let rsaPublicKeyExponent = "<%=publicKeyExponent%>";
			    	
			    	let rsa = new RSAKey();
				    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
				    
				    let cipherID = rsa.encrypt(idval);
				    let cipherPW = rsa.encrypt(pwdval);
				    
					$("#_RSAID").attr("value", cipherID);
					$("#_RSAPW").attr("value", cipherPW);
					
					$("#_loginData").submit();
				}
			});
		</script>
		<div class="loginArea">
			<div id="left">
				<img id="logo" src="../image/loginLogo.png">
			</div>
			<div id="right">
				<p>계정이 없으세요?</p>
				<button id="signUp" type="button" onclick="location.href='signUp.jsp'">만들기</button>
				<input name="_id" id="_id" type="text" placeholder="아이디">
				<input name="_pwd" id="_pwd" type="password" placeholder="비밀번호">
				<Form id="_loginData" action="loginCheck.jsp" method="post">
					<input type="hidden" name="_RSAID" id="_RSAID" value="" />
					<input type="hidden" name="_RSAPW" id="_RSAPW" value="" />
				</Form>
				<img id="personImg" src="../image/person.png">
				<img id="keyImg" src="../image/key.png">
				<button id="loginBtn" type="button">로그인</button>
				<button id="lostPwd" type="button" onclick="location.href='findPwd.jsp'">비밀번호를 잊으셨나요?</button>
			</div>
		</div>
	</body>
</html>