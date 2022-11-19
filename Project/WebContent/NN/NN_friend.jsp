<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.lang.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냠냠친구</title>
		
		<link href="../css/friend.css?ver=1" rel="stylesheet" type="text/css">
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
	        String nick_getData = (String) session.getAttribute("NICK");

	        String val = request.getParameter("_index");
			if( val == null ) val = "1";
	        
	        int index = Integer.parseInt(val);
	        
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
                    <li><a href="../BB/BB_friend.jsp?_index=1"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="../NN/NN_friend.jsp?_index=1"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp?_index=1"><img src="../image/studying.png">  열공친구</a></li>                        
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
	    			<strong>냠냠친구</strong>
	    			<p>같이 먹자 친구야!</p>
	    		</div>
	    		<div class="list_wrap">
	                <div class="list">
	                    <div class="top">
		                        <div class="num">번호</div>
		                        <div class="title">제목</div>
		                        <div class="writer">글쓴이</div>
		                        <div class="date">작성일</div>
		                        <div class="category">분류</div>
	                    </div>
	                    <%	// 각 게시판 게시글 읽어오는 부분
	                    	Class.forName("com.mysql.cj.jdbc.Driver");
            				Connection conn = DriverManager.getConnection(
            						"jdbc:mysql://localhost/friend", "friends", "2022server");
            				Statement stmt = conn.createStatement();
            				ResultSet rs = stmt.executeQuery(
            						"select number, title, nickname, writetime, category from meal order by number desc limit " + (index-1)*10 + ",10");
            				
            				while(rs.next()){
            					String number = rs.getString(1);
            					String title = rs.getString(2);
            					String nickname = rs.getString(3);
            					String writetime = rs.getString(4).substring(0, 10);
            					String category = rs.getString(5);
            					
            					out.println("<div><div class=num>"+number+"</div><div class=title><a href=Meal_writePost.jsp?number="
            							+number+">"+title+"</a></div><div class=writer>"+nickname+"</div><div class=date>"
            							+writetime+"</div><div class=category>"+category+"</div></div>");
            				}
            				rs.close();
            				stmt.close();
            				conn.close();
	                    %>
                	</div>
                <div class="page">
                    <%
	                    Class.forName("com.mysql.cj.jdbc.Driver");
	    				Connection conn2 = DriverManager.getConnection(
	    						"jdbc:mysql://localhost/friend", "friends", "2022server");
	    				Statement stmt2 = conn2.createStatement();
	    				ResultSet rs2 = stmt2.executeQuery("select count(number) from meal");
                    	int max = 0, temp = 1;
                    	
                    	while(rs2.next()){
                    		max = rs2.getInt(1);
                    		
	                    	while(max > 0){
	                    		out.println("<a href=NN_friend.jsp?_index="+temp+" class=num>"+temp+"</a>");
	                    		temp++;
	                    		max -= 10;
	                    	}
                    	}
                    	rs.close();
        				stmt.close();
        				conn.close();
                    %>
                </div>
                <div class="bt_wrap">
	                <%
	                	if(session.getAttribute("ID") != null)
                    		out.println("<a href=Meal_writingFrame.jsp class=on>등록</a>");
                    %>
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