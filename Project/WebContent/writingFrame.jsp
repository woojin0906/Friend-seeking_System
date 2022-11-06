<!-- 
	작성자: 전우진
	글작성 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="script/header.js" type="text/javascript"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" media="screen" href="css/writerStyle.css">
    <title>글작성 홈페이지</title>
</head>
<body>
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
                    <li><a href="#">게시판 이름</a></li>                        <li><a href="#">게시판 이름</a></li>
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
    
<div id="main_footer">
    <main>
        <div class="main">
            <div class="main_name">
                <h1>글작성</h1>
            </div>
            
        
        <form action="writePost.jsp" method="get" >
            <table >
                <tr>
                    <th>제목</th>
                    <td><input id="text" type="text" name="_title" size="120" maxlength="100" value=""/></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input id="text" type="text" name="_name" size="50" maxlength="100" value=""/></td> <!-- 여기에는 작성자 이름을 받아올 예정 -->        
                </tr>
         
                <tr>
                    <th>시간</th>
                    <td><input id="text" type="text" name="_time" size="50" maxlength="100" value="" /></td>        
                </tr>
                <tr>
                    <th>성별</th>
                    <td><input id="gender" type="radio" name="_gender" value="여자"/>여자 
                        <input id="gender" type="radio" name="_gender" value="남자"/>남자
                        <input id="gender" type="radio" name="_gender" value="상관없음"/>상관없음
                    </td>        
                </tr>
                <tr>
                    <th>인원</th>
                    <td><input id="person" type="checkbox" name="_person" value="2명"/>2명 
                        <input id="person" type="checkbox" name="_person" value="3명"/>3명
                        <input id="person" type="checkbox" name="_person" value="4명"/>4명
                        <input id="person" type="checkbox" name="_person" value="5명 이상"/>5명 이상
                        <input id="person" type="checkbox" name="_person" value="상관없음"/>상관없음
                    </td>        
                </tr>
                <tr>
                    <th>출발지&도착지</th>
                    <td><input id="text" type="text" name="_place" size="50" maxlength="100" value=""/></td>        
                </tr>
                <tr>
                    <th>기타 내용</th>
                    <td><textarea id="context" name="_context" cols="122" rows="10"></textarea></td>        
                </tr>
                <tr>
                    <td colspan="2"><input id="btn" type="submit" value="작성완료"></td>
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