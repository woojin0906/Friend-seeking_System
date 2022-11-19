<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/profile_css.css">
<script src="https://kit.fontawesome.com/7914cb2195.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <header class="header">
    <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
    <div class="btnright">
    <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='profile.jsp'"><span>Mypage</span></button>
    <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='logout.jsp'"><span>LogOut</span></button>
    </div>
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
                    <li><a href="../BB/BB_friend.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="../NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
</header>

  <div class="wrapper small">
  	<div class="nameinfo">
	  	<div class="nameabout">
	  	<%
		String nick = (String) session.getAttribute("NICK");
            		System.out.println("테스트");
	request.setCharacterEncoding("UTF-8");
	try {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.cj.jdbc.Driver"); 
	conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from member where nickname = '" + nick + "'");
	
	while(rs.next()) {
		%>
	      <div class="name">닉네임 : <%=nick %></div>
	      <div class="about">이름 : <%=rs.getString("name") %></div>
	      <div class="about">성별 : <%=rs.getString("sex") %></div>
	      <div class="about">전화번호 : <%=rs.getString("phone") %></div>
	      
		<%
	}
	
	rs.close();
	stmt.close();
	conn.close();

} catch(Exception e) {
	e.printStackTrace();
}

%>
	    </div>
	    <div class="rightinfo">
	   		<div class="buttons smallbutton">
				<button onclick="location.href='infochange.jsp'">내 정보 수정</button>
	      	</div>
	    </div>
  	</div>
      
      <div class="center">
	      <div class="buttons">
	        <button onclick="location.href='profile_write.jsp'">내가 쓴 글</button>
	        <button onclick="location.href='profile_part.jsp'">참여한 글</button>
	      </div>
      </div>
  </div>
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