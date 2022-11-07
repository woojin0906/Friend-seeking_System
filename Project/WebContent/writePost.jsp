<!-- 
	작성자: 전우진
	글모음 + 참여자 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="css/writePostStyle.css">
 <title>글모음 홈페이지</title>
</head>
<body>
 <%
   // Connection conn = null;
	//Statement stmt = null;
	//ResultSet rs = null;
	
		//String nickName = request.getParameter("_nickName");

//	var lastData = localStorage.getItem('_nickName');

	
	//try {
	//	Class.forName("com.mysql.cj.jdbc.Driver"); 
	//	conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	//	stmt = conn.createStatement();
		//rs = stmt.executeQuery("select title, category, promisetime, sex, count, start, dest, main, writetime from traffic from traffic where nickname = '" + nickName + "'");
		
	//	while(rs.next()) {
			
	//		 	}

	//	rs.close();
	//	stmt.close();
	//	conn.close();

	//} catch(Exception e) {
	//	e.printStackTrace();
	//}

   %>

    <header class="header">
        <a href="#"><img class ="logoimg"src="image/logo_mod.png"></a>
        <div class="btnright">
            <button class="custom-btn btn-3"><span>Log In</span></button>
            <button class="custom-btn btn-3"><span>Sign Up</span></button>
        </div>
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
                    <li><a href="#">전체 글 보기</a></li>
                    <li><a href="#">붕붕</a></li>
                    <li><a href="#">게시판 이름</a></li>
                    <li><a href="#">게시판 이름</a></li>                        
                    <li><a href="#">게시판 이름</a></li>
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
         
<div id="main_footer">
 <main>
     <div class="main">
           
     <form action="writingChangeFrame.jsp" method="get" >
         <table id="_table_writerPage">
        
		
             <tr>
                 <th id="table_top"><h2>제목</h2></th>
                 <td id="table_top"><input type="hidden" name="_title" value=""/></td>
                 <td id="date">작성일자</td>
                 <td id="date_hidden"><input type="hidden" name="_date" value=""/></td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td id="hidden"><input type="hidden" name="_nickName" value=""/></td> <!-- 여기에는 작성자 이름을 받아올 예정 -->        
                 <td id="btn_writePost1">
                     <input id="btn" type="submit" value="수정하기">
                 </td>
                 <td id="btn_writePost2">
                 	<input id="btn_check" type="submit" value="참여하기"/>
                 </td>
             
             </tr>
      		 <tr>
                 <th>종류</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_type" value="" /></td>        
             </tr>
             <tr>
                 <th>시간</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_time" value="" /></td>        
             </tr>
             <tr>
                 <th>성별</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_gender" value=""/></td>        
             </tr>
             <tr>
                 <th>인원</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_person" value=""/></td>        
             </tr>
             <tr>
                 <th>출발지</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_depart" value=""/></td>        
             </tr>
             <tr>
                 <th>도착지</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_arrival" value=""/></td>        
             </tr>
             <tr>
                 <th>기타 내용</th>
                 <td id="context" colspan="3"><input type="hidden" name="_context" value=""/></td>        
             </tr>
             
     
         </table>    
         </form>
     <div class="table2">
         <form>
             <h2>참여자</h2>
             <table id="_talbe_participants">
                 <tr>
                     <th>이름</th>
                     <th>성별</th>
                     <th>전화번호</th>
                     <th>기타</th>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
                 <tr>
                     <td><input type="hidden" name="_name" value=""/></td>
                     <td><input type="hidden" name="_sex" value=""/></td>
                     <td><input type="hidden" name="_phone" value=""/></td>
                     <td><input type="hidden" name="_ex" value=""/></td>
                 </tr>
             </table>
         </form>
         </div>
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