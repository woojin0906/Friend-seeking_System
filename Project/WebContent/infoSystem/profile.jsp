<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/profileview_css.css">
<script src="https://kit.fontawesome.com/7914cb2195.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
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
                    <li><a href="BB/BB_friend.jsp"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="NN/NN_friend.jsp"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="YG/YG_friend.jsp"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
</header>

  <div class="wrapper small">
      <div class="img-area">
        <div class="inner-area">
          <!-- 이미지가 들어가거나 삭제 -->
        </div>
      </div>
      <div class="name">닉네임(아이디)이 들어감</div>
      <div class="about">간단한 자기소개(없어도됨)</div>
      
      <div class="buttons">
        <button onclick="location.href='#'">내가 쓴 글</button>
        <button onclick="location.href='#'">참여한 글</button>
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