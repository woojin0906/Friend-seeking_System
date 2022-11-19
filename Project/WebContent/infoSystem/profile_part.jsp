<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/profileview_css.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>
<%
	String nick = (String) session.getAttribute("NICK");
	String id = (String) session.getAttribute("ID");
%>
    <header class="header">
        <a href="MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
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
                    <li><a href="BB/BB_friend.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
	</header>
    <div class="wrapper center">
      <div class="name"><%=nick %></div>
      <div class="buttons"><button onclick="location.href='profile_write.jsp'">내가 쓴 글</button></div>
      <hr>
      <div class="click_btns">
		<button class="click-btn" id="btn-1" onClick="">붕붕친구</button>
		<button class="click-btn" id="btn-2">냠냠친구</button>
		<button class="click-btn" id="btn-3">열공친구</button></div>
      <!-- 테이블 수정 -->
      <table id="table_align">
        <thead>
        <tr>
            <th>Number</th>
            <!--<th>Last Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Date of Birth</th>-->
        </tr>
        </thead>
        
        <tbody>
               	  	<%
	request.setCharacterEncoding("UTF-8");
	try {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	String sql="select * from trafficParticipate where id = '" + id + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

	while(rs.next()) {

		%>

          <tr>
              <td><%=rs.getString("number") %></td>
  
          </tr>
          	      
		<%
	}
	
	rs.close();
	stmt.close();
	conn.close();

} catch(Exception e) {
	e.printStackTrace();
}

%>
        </tbody>
    </table>
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