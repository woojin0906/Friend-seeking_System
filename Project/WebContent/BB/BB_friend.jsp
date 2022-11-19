<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>붕붕친구</title>
		
		<link href="../css/BB_friend.css?ver=1" rel="stylesheet" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	</head>
	<body>
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
                    <li><a href="../BB/BB_friend2.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="../NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
    </header>
    
    <section>
    	<div id="board">
    		<div class="wrap">
	    		<div class="title">
	    			<strong>붕붕친구</strong>
	    			<p>가나다라마바사아자차카타파하하하하하</p>
	    		</div>
	    		<div class="list_wrap">
	                <div class="list">
	                    <div class="top">
		                        <div class="num">번호</div>
		                        <div class="title">제목</div>
		                        <div class="writer">글쓴이</div>
		                        <div class="date">작성일</div>
		                        <div class="count">조회</div>
	                    </div>
<!-- 	                    <div> -->
<!-- 	                        <div class="num">5</div> -->
<!-- 	                        <div class="title"><a href="#">글 제목이 들어감</a></div> -->
<!-- 	                        <div class="writer">아무개</div> -->
<!-- 	                        <div class="date">2022.08.21</div> -->
<!-- 	                        <div class="count">33</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div> -->
<!-- 	                        <div class="num">5</div> -->
<!-- 	                        <div class="title"><a href="#">글 제목이 들어감</a></div> -->
<!-- 	                        <div class="writer">아무개</div> -->
<!-- 	                        <div class="date">2022.08.21</div> -->
<!-- 	                        <div class="count">33</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div> -->
<!-- 	                        <div class="num">5</div> -->
<!-- 	                        <div class="title"><a href="#">글 제목이 들어감</a></div> -->
<!-- 	                        <div class="writer">아무개</div> -->
<!-- 	                        <div class="date">2022.08.21</div> -->
<!-- 	                        <div class="count">33</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div> -->
<!-- 	                        <div class="num">5</div> -->
<!-- 	                        <div class="title"><a href="#">글 제목이 들어감</a></div> -->
<!-- 	                        <div class="writer">아무개</div> -->
<!-- 	                        <div class="date">2022.08.21</div> -->
<!-- 	                        <div class="count">33</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div> -->
<!-- 	                        <div class="num">5</div> -->
<!-- 	                        <div class="title"><a href="#">글 제목이 들어감</a></div> -->
<!-- 	                        <div class="writer">아무개</div> -->
<!-- 	                        <div class="date">2022.08.21</div> -->
<!-- 	                        <div class="count">33</div> -->
<!-- 	                    </div> -->
	                    <div>
	                        <div class="num">5</div>
	                        <div class="title"><a href="#">글 제목이 들어감</a></div>
	                        <div class="writer">아무개</div>
	                        <div class="date">2022.08.21</div>
	                        <div class="count">33</div>
	                    </div>
	                    <div>
	                        <div class="num">4</div>
	                        <div class="title"><a href="#">글 제목이 들어감</a></div>
	                        <div class="writer">아무개</div>
	                        <div class="date">2022.08.21</div>
	                        <div class="count">33</div>
	                    </div>
	                    <div>
	                        <div class="num">3</div>
	                        <div class="title"><a href="#">글 제목이 들어감</a></div>
	                        <div class="writer">아무개</div>
	                        <div class="date">2022.08.21</div>
	                        <div class="count">33</div>
	                    </div>
	                    <div>
	                        <div class="num">2</div>
	                        <div class="title"><a href="#">글 제목이 들어감</a></div>
	                        <div class="writer">아무개</div>
	                        <div class="date">2022.08.21</div>
	                        <div class="count">33</div>
	                    </div>
	                    <div>
	                        <div class="num">1</div>
	                        <div class="title"><a href="view.html">글 제목이 들어감</a></div>
	                        <div class="writer">아무개</div>
	                        <div class="date">2022.08.21</div>
	                        <div class="count">33</div>
	                    </div>
                	</div>
                <div class="page">
                    <a href="#" class="bt first"><<</a>
                    <a href="#" class="bt prev"><</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="bt next">></a>
                    <a href="#" class="bt last">>></a>
                </div>
                <div class="bt_wrap">
                    <a href="Traffic_writingFrame.jsp" class="on">등록</a>
                </div>
    		</div>
    	</div>
    </section>
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
    
	</body>
</html>