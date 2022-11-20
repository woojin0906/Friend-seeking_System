<!-- 
	작성자: 전우진
	붕붕친구 글수정 페이지
 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" import="java.sql.*" %>
 <%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="../script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="../css/writerStyle.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
 <title>글수정 홈페이지</title>
</head>
<body>

<script>
	//가상으로 삽입한 팝업창을 닫는 function	
	$(document).on("click", "#closeBtn", function(e) {
		let val = $('#popup').text();
		$('.background').remove();
	});
	
	// input에 데이터를 모두 입력했는지 검사하고,
	// 데이터 유효성 검사를 한 뒤 submit 하여 데이터 전송하는 function
	$(document).on("click", "#btn", function(){
		let titleval = $('#_title').val();
		let typeval = $('#_type').val();
		let genval = $('#_gender').val();
		let perval = $('#_person').val();
		let depval = $('#_depart').val();
		let arrval = $('#_arrival').val();
		let conval = $('#_context').val();
		let timeval = $('#_time').val();
		
		let checkMsg;
		let checkState = true;
		
		if (titleval == "" || typeval == "" || genval == "" || perval == ""
			|| depval == "" || arrval == "" || conval == "" || timeval == "") {

			checkMsg = "모든 입력값을 입력해주세요.";
			checkState = false;
			$('body').append("<div class=background><div id=popup>"+ checkMsg 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
		} 
		
 		if(checkState)
 			$("#form_1").submit();
		}
	);
</script>
<%

	request.setCharacterEncoding("UTF-8");

	String number = (String) session.getAttribute("NUM");
	String type = request.getParameter("_type");
	String gender = request.getParameter("_gender");
    String person = request.getParameter("_person");
    
   %>
       <header class="header">
        <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
        String id = (String) session.getAttribute("ID");		
    	session.setAttribute("ID", id);
        String nick_getData = (String) session.getAttribute("NICK");
        session.setAttribute("NICK", nick_getData);	
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nick_getData%>님 환영합니다.
 	            <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/profile.jsp'"><span>Mypage</span></button>
 	            <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/logout.jsp'"><span>LogOut</span></button>
 	        </div>
		<!-- 로그인 안 했을 때 -->
        <% } else { %>
 	        <div class="btnright">
 	        	
 	            <button id="loginBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/loginFrame.jsp'"><span>Log In</span></button>
 	            <button id="sognUpBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/signUp.jsp'"><span>Sign Up</span></button>
 	        </div>
       	<% } %>
       	<div id="boardside">
        <input type="checkbox" id="menuicon">
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="sidebar">
            <div class="cont">
                <ul>
                    <li><a href="BB_friend.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="../NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
    </header>
         
<div id="main_footer">
 <main>
     <div class="main">
         <div class="main_name">
             <h1>게시글</h1>
         </div>
         
     
     <form id="form_1" action="Traffic_updateCheck.jsp" method="post" >
         <table>
             <tr><input type="hidden" name="_number" value="<%=number %>"/>
                 <th>제목</th>
                 <td><input id="_title" type="text" name="_title" size="120" maxlength="100" value="<%=request.getParameter("_title") %>"/></td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td><input type="hidden" name="_nickname" value="<%=request.getParameter("_nickName") %>"/><%=request.getParameter("_nickName") %></td>       
             </tr>
      		 <tr>
                  <th>종류</th>
                  <td><input id="_type" type="radio" name="_type" value="택시" <% if("택시".equals(type)){%>checked<%}%>/>택시 
                        <input id="_type" type="radio" name="_type" value="카풀" <% if("카풀".equals(type)){%>checked<%}%>/>카풀
                  </td>        
             </tr>
             <tr>
                 <th>시간</th>
                 <td><input id="_time" type="text" name="_time" size="50" maxlength="100" value="<%=request.getParameter("_time") %>" /></td>        
             </tr>
             <tr>
                 <th>성별</th>
                 <td><input id="_gender" type="radio" name="_gender" value="여자" <% if("여자".equals(gender)){%>checked<%}%>/>여자 
                        <input id="_gender" type="radio" name="_gender" value="남자" <% if("남자".equals(gender)){%>checked<%}%>/>남자
                        <input id="_gender" type="radio" name="_gender" value="상관없음" <% if("상관없음".equals(gender)){%>checked<%}%>/>상관없음
                 </td>        
             </tr>
             <tr>
                 <th>인원</th>
                 <td><input id="_person" type="radio" name="_person" value="2명" <% if("2명".equals(person)){%>checked<%}%>/>2명 
                     <input id="_person" type="radio" name="_person" value="3명" <% if("3명".equals(person)){%>checked<%}%>/>3명
                     <input id="_person" type="radio" name="_person" value="4명" <% if("4명".equals(person)){%>checked<%}%>/>4명
                     <input id="_person" type="radio" name="_person" value="5명 이상" <% if("5명 이상".equals(person)){%>checked<%}%>/>5명 이상
                     <input id="_person" type="radio" name="_person" value="상관없음" <% if("상관없음".equals(person)){%>checked<%}%>/>상관없음
                        
                 </td>        
             </tr>
             <tr>
                  <th>출발지</th>
                  <td><input id="_depart" type="text" name="_depart" size="50" maxlength="100" value="<%=request.getParameter("_depart") %>"/></td>        
             </tr>
             <tr>
                   <th>도착지</th>
                   <td><input id="_arrival" type="text" name="_arrival" size="50" maxlength="100" value="<%=request.getParameter("_arrival") %>"/></td>        
             </tr>
             <tr>
                 <th>기타 내용</th>
                 <td><textarea id="_context" name="_context" cols="122" rows="10" value=""><%=request.getParameter("_context") %></textarea></td>        
             </tr>
             <tr>
                 <td colspan="2"><button id="btn" type="button">수정하기</button></td>
             </tr>
         </table>    
         </form>
     </div>
 </main>

 <footer>

     <nav id="bottom_menu">
         <ul>
             <li>구해줘! 프렌즈</li>
             <li>개인정보처리방침</li>
             <li>저작권 정보</li>
             <li>이용 안내</li>
         </ul>
     </nav>
     <div class="items">
         <h2 class="items_name">문의전화</h2>
         <ul>
             <li class="phone">123-1234</li>
             <li>10:00 - 18:00(Lunch 12:00 - 13:00)</li>
         </ul>
     </div>
     <div class="items">
         <h2 class="items_name">구해줘! 프렌즈</h2>
         <ul>
             <li>주소 : 인천광역시 남구 인하로 100</li>
             <li>전화 : 031-123-1234</li>
             <li>팩스 : 031-123-1234</li>
             <li>이메일 : 123-12-12345</li>
         </ul>
     </div>
     <div class="items">
         <h2 class="items_name">입금 정보</h2>
         <ul>
             <li>농협 123-123-123456</li>
             <li>구해줘! 프렌즈</li>
         </ul>
     </div>
</footer>
</div>
</body>
</html>