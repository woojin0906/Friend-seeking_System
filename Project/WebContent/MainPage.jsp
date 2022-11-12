<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/mainPageStyle.css">
    <script src="script/header.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	
    <title>Document</title>
</head>
<body>
    <header class="header">
        <a href="MainPage.jsp"><img class ="logoimg"src="image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
        String nick_getData = (String) session.getAttribute("NICK");
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nick_getData%>님 환영합니다.
 	            <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/profile.jsp'"><span>Mypage</span></button>
 	            <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/logout.jsp'"><span>LogOut</span></button>
 	        </div>
		<!-- 로그인 안 했을 때 -->
        <% } else { %>
 	        <div class="btnright">
 	        	
 	            <button id="loginBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/loginFrame.jsp'"><span>Log In</span></button>
 	            <button id="sognUpBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/signUp.jsp'"><span>Sign Up</span></button>
 	        </div>
       	<% } %>
    </header>
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
                    <li><a href="PostMain.jsp">전체 글 보기</a></li>
                    <li><a href="BB/BB_friend.jsp"><img src="image/car.png">  붕붕친구</a></li>
                    <li><a href="NN/NN_friend.jsp"><img src="image/eat.png">  냠냠친구</a></li>
                    <li><a href="YG/YG_friend.jsp"><img src="image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>

    <div id="content">
        <div class="container">
            <div class="row">
                <div class="photo-slider">
                    <img src="https://4.bp.blogspot.com/-FYsWBy3Vyko/Vihu37d2rBI/AAAAAAAAAAU/iv_78Cy-cic/s1600/d30256.jpg" alt="" class="photo-slider-img">
                    <img src="http://times-bignews.com/UploadFiles/201508/images/20150804143239.jpg" alt="" class="photo-slider-img">
                    <img src="https://67.media.tumblr.com/f297ec85158c7767b52d8443513b5675/tumblr_nkasx4XoCN1u92dlto1_500.jpg" alt="" class="photo-slider-img">
                    <img src="http://down.qnwz.cn/uploads/allimg/140603/1-1406031521295E.jpg" alt="" class="photo-slider-img">
                </div>
                <div class="photo-controls">
                    <div class="photo-pagination">
                        <div class="photo-page active"><span></span></div>
                        <div class="photo-page"><span></span></div>
                        <div class="photo-page"><span></span></div>
                        <div class="photo-page"><span></span></div>
                        <div class="photo-page"><span></span></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 게시글 보기 -->
        <hr>
        <div id="wrap">
            <div class="simple-view">
                <a class="astyle" href="BB/BB_friend.jsp"><p><img src="image/car.png"> 붕붕 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
	                try {
	    				Connection conn = null;
	    				Statement stmt = null;
	    				ResultSet rs = null;
	    				String sql;
	    				
	   					Class.forName("com.mysql.cj.jdbc.Driver");
	   					String url = "jdbc:mysql://localhost:3306/friend";
	   					conn  = DriverManager.getConnection(url, "friends", "2022server");
	   					
	   					sql = "select category, title, number from traffic order by number desc limit 10";
	   					stmt = conn.createStatement();
	   					rs = stmt.executeQuery(sql);
	   					
	   					out.println("<table border=0>");
	   					while(rs.next()){
	   		               	String category = rs.getString(1);
	   		               	String title = rs.getString(2);
	   		               	String number = rs.getString(3);
	   		               	out.println("<tr onClick=location.href='BB/Traffic_writePost.jsp?id="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
	   		            }
	   					out.println("</table>");
	    					
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
                %>
            </div>
            <div class="simple-view">
                <a class="astyle" href="NN/NN_friend.jsp"><p><img src="image/eat.png"> 냠냠 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
	                try {
	    				Connection conn = null;
	    				Statement stmt = null;
	    				ResultSet rs = null;
	    				String sql;
	    				
	   					Class.forName("com.mysql.cj.jdbc.Driver");
	   					String url = "jdbc:mysql://localhost:3306/friend";
	   					conn  = DriverManager.getConnection(url, "friends", "2022server");
	   					
	   					sql = "select category, title, number from meal order by number desc limit 10";
	   					stmt = conn.createStatement();
	   					rs = stmt.executeQuery(sql);
	   					
	   					out.println("<table border=0>");
	   					while(rs.next()){
	   		               	String category = rs.getString(1);
	   		               	String title = rs.getString(2);
	   		               	String number = rs.getString(3);
	   		               	out.println("<tr onClick=location.href='NN/Meal_writePost.jsp?id="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
	   		            }
	   					out.println("</table>");
	    					
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
                %>
            </div>
            <div class="simple-view">
                <a class="astyle" href="YG_friend.jsp"><p><img src="image/studying.png"> 열공 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
                try {
    				Connection conn = null;
    				Statement stmt = null;
    				ResultSet rs = null;
    				String sql;
    				
   					Class.forName("com.mysql.cj.jdbc.Driver");
   					String url = "jdbc:mysql://localhost:3306/friend";
   					conn  = DriverManager.getConnection(url, "friends", "2022server");
   					
   					sql = "select category, title, number from study order by number desc limit 10";
   					stmt = conn.createStatement();
   					rs = stmt.executeQuery(sql);
   					
   					out.println("<table border=0>");
   					while(rs.next()){
   		               	String category = rs.getString(1);
   		               	String title = rs.getString(2);
   		               	String number = rs.getString(3);
   		               	out.println("<tr onClick=location.href='YG/Study_writePost.jsp?id="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
   		            }
   					out.println("</table>");
    					
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
                %>
            </div>
        </div>
    </div>
    
    
</body>
</html>