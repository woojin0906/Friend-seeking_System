<!-- 
	작성자: 김지웅
	회원가입하는 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
					checkMsg = "모든 입력값을 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				else if (idval.length < 4 || idval.length > 16){
					checkMsg = "아이디는 4~16자 사이로 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				else if (pwdval.length < 8 || pwdval.length > 20){
					checkMsg = "비밀번호는 8~20자 사이로 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				else if (nickval.length > 8){
					checkMsg = "닉네임은 8자 이하로 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				else if (nameval.length > 6){
					checkMsg = "이름은 6자 이하로 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
				
				else if (telval.length > 13){
					checkMsg = "전화번호는 13자 이하로 입력해주세요.";
					checkState = false;
					
					$('body').append("<div class=background><div id=popup>"+ checkMsg 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
				}
					
				if(checkState){
					$("#_dataForm").submit();
				}
			});
			
		</script>
		<div class="signupArea">
			<div id="left">
				<p>회원가입</p>
				<form id="_dataForm" action="signUp.jsp" method="post">
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
					<img id="personImg" src="image/person.png">
					<img id="keyImg" src="image/key.png">
					<img id="nickname" src="image/nicknameImg.png">
					<img id="nameImg" src="image/nameImg.png">
					<img id="sexImg" src="image/sexImg.png">
					<img id="telImg" src="image/telImg.png">
					<button id="signupBtn" type="button">회원가입</button>
				</form>
				<button id="cancelBtn" type="button" onclick="location.href='loginFrame.jsp'">취소</button>
			</div>
			<div id="right">
				<img id="logo" src="image/signUpLogo.png">
			</div>
		</div>
		
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("_id");
			String pwd = request.getParameter("_pwd");
			String nickname = request.getParameter("_nickname");
			String name = request.getParameter("_name");
			String sex = request.getParameter("_sex");
			String tel = request.getParameter("_tel");
			
			if( id == null ) id="";
			if( pwd == null ) pwd="";
			if( nickname == null) nickname="";
			if( name == null ) name="";
			if (sex == null ) sex=""; 
			if( tel == null ) tel="";
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				boolean infoState = true, infoState2 = true;
				String infoMsg;
				String sql;
				
				if( !id.equals("") && !pwd.equals("") && !nickname.equals("") && 
						!name.equals("") && !sex.equals("") && !tel.equals("")){
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					
					sql = "select id from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
		               	String user = rs.getString(1);
						if(user.equals(id)){
							infoState = false;
							break;
						}
		            }
					
					sql = "select nickname from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()){
		               	String nick = rs.getString(1);
						if(nick.equals(nickname)){
							infoState2 = false;
							break;
						}
		            }
					
					if(infoState && infoState2) {
						sql = "insert into member values('" 
						+ id + "','" +  pwd + "','" + name + "','" + sex + "','" + tel
						+ "','" + nickname + "')";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.executeUpdate();
						out.println("<div class=background><div id=popup>"+ "회원가입이 완료되었습니다." 
						+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
					}
					else {
						if(infoState == false && infoState2 == false){
							out.println("<div class=background><div id=popup>"+ "이미 사용중인 아이디와 닉네임입니다." 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
						}
						else if(infoState == false){
							out.println("<div class=background><div id=popup>"+ "이미 사용중인 아이디입니다." 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
						}
						else if(infoState2 == false){ 
							out.println("<div class=background><div id=popup>"+ "이미 사용중인 닉네임입니다." 
							+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
						}
					}
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>