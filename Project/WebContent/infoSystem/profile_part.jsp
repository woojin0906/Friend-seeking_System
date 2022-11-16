<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <header class="header">
        <a href="MainPage.jsp"><img class ="logoimg"src="image/logo_mod.png"></a>
        <div class="btnright">
        <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/profile.jsp'"><span>Mypage</span></button>
		<button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/logout.jsp'"><span>LogOut</span></button>
        </div>
	</header>
    <div class="wrapper">
      <div class="name">닉네임(아이디)이 들어감</div>
      <div class="buttons"><button>내가 쓴 글</button></div>
      <hr>
      <!-- 테이블 수정 -->
      <table>
        <thead>
        <tr>
            <th>Number</th>
            <th>Last Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Date of Birth</th>
        </tr>
        </thead>
        
        <tbody>
        <tr>
            <td>James</td>
            <td>Matman</td>
            <td>(713) 123-8965</td>
            <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
            <td>01/13/1979</td>
        </tr>
        <tr>
            <td>Johnny</td>
            <td>Smith</td>
            <td>(713) 584-9614</td>
            <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
            <td>06/09/1971</td>
        </tr>
        <tr>
            <td>Susan</td>
            <td>Johnson</td>
            <td>(713) 847-1124</td>
            <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
            <td>08/25/1965</td>
        </tr>
        <tr>
            <td>Tracy</td>
            <td>Richardson</td>
            <td>(713) 245-4821</td>
            <td><a href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
            <td>03/13/1980</td>
        </tr>
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