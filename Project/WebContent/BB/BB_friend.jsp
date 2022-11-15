<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.Traffic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로딩
	String dbUrl = "jdbc:mysql://localhost:3306/friend?useUnicode=true&characterEncoding=utf8"; // 데이터베이스 정보
	String dbId = "friends"; // DB 아이디
	String dbPw = "2022server"; // DB 패스워드
	String id = (String) session.getAttribute("ID");		
	session.setAttribute("ID", id);
	String nick = (String) session.getAttribute("NICK");
	session.setAttribute("NICK", nick);						// 글 수정을 위해 글 번호 세션에 넘기기
%>
  <header class="header">
    <a href="#"><img class="logoimg" src="image/logo_mod.png"></a>
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

  <div id="wrap">
    <div id="header">
      <div class="container">
        <div class="top">
          <div class="logo">
          </div>
          <div class="title">
          </div>
        </div>
      </div>
    </div>

    <div id="wrap">
      <div id="contents">
        <div class="container sub_list">

          <div class="row">
            <div class="col-12">
              <div class="table-head">
                <div>
                  <span><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
                  <h2>붕붕친구 게시판</h2>
                  <div class="table-sub-n">n개의 글</div>
                </div>
                <div>
		<%if(session.getAttribute("ID") != null){%> <!--  비로그인시 숨기기 -->
                  <a href="Traffic_writingFrame.jsp" class="btn-7">글작성</a>
                </div>
              </div>
              <div class="table-div">
                <table>
                  <thead>
                    <tr>
                      <th>글 번호</th>
                      <th>작성자</th>
                      <th>제목</th> 
                      <th>종류</th> <!-- 카풀&택시 -->
                      <th>성별</th>
                      <th>인원</th> <!-- 2~5명 , 5명이상 , 상관없음 -->
                      <th>출발지</th> <!-- 출발장소 -->
                      <th>도착지</th> <!-- 도착장소 -->      
                      <th>시간</th> 
                      <th>기타</th> 
                      
                    </tr>
                  </thead>
                  <tbody>
                  <%
	              	Traffic traffic = null;
	              	try {
	              		String sql = "select * from traffic order by number desc"; // SQL 쿼리
	              		
	              		conn = DriverManager.getConnection(dbUrl, dbId, dbPw); // DB 연결
	              		pstmt = conn.prepareStatement(sql);
	              		rs = pstmt.executeQuery();
	              		
	              		while(rs.next()) {
	              			traffic = new Traffic();
	              			traffic.setNumber(rs.getInt("number"));
	              			traffic.setNickName(rs.getString("nickname"));
	              			traffic.setTitle(rs.getString("title"));
	              			traffic.setPromiseTime(rs.getString("promiseTime"));
	              			Date writeTime = rs.getDate("writeTime");
	              			traffic.setWriteTime(writeTime);
	              			traffic.setCount(rs.getString("count"));
	              			traffic.setSex(rs.getString("sex"));
	              			traffic.setStart(rs.getString("start"));
	              			traffic.setDest(rs.getString("dest"));
	              			traffic.setMain(rs.getString("main"));
	              			traffic.setCategory(rs.getString("category"));
                  %>
           					 <tr>
           					 	  <td><%= traffic.getNumber()%></td> <!-- 작성자 -->    
			                      <td><%= traffic.getNickName()%></td> <!-- 작성자 -->           					 
			                      <td><%= traffic.getTitle() %></td> <!-- 제목 -->
			                      <td><%= traffic.getCategory() %></td> <!-- 종류 -->
			                      <td><%= traffic.getSex() %></td> <!-- 성별 -->
			                      <td><%= traffic.getCount() %></td> <!-- 인원 -->
			                      <td><%= traffic.getStart() %></td> <!-- 출발지 -->
			                      <td><%= traffic.getDest() %></td> <!-- 도착지 -->
			                      <td><%= traffic.getPromiseTime() %></td> <!-- 시간 -->
			                      <td><%= traffic.getMain() %></td> <!-- 기타내용 -->
			                      
                    		</tr>
           			<%
	              		}
	              	} catch(Exception e) {
	              		e.printStackTrace();
	              	} finally {
	              		 // DB 자원 해제
	              		if(pstmt != null) { pstmt.close(); }
	              		if(conn != null) { conn.close(); }
	              	}
		}
                  %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="list_footer">
        <div class="footer_wrap" style="right: 0;">
          <div class="ppbt_area">
            <div class="ppbt_left">
              <script>
                $(function () {
                  $('input[name="daterange"]').daterangepicker({
                    opens: 'left',
                    locale: {
                      direction: 'ltr',
                      format: 'YYYY/MM/DD',
                      separator: ' - ',
                      applyLabel: '적용',
                      cancelLabel: '취소',
                      weekLabel: 'W',
                      customRangeLabel: '사용자 설정',
                      daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
                      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                      firstDay: moment.localeData().firstDayOfWeek()
                    }
                  }, function (start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                    $('#keyword').val("D");
                  });
                });
              </script>

            </div>
          </div>
        </div>
        <div class="ppbt_search">
          <form action="#" method="get" name="list_search"><input type="hidden" name="act" value="">
            <input type="hidden" name="vid" value="">
            <input type="hidden" name="mid" value="#">
            <input type="hidden" name="category" value="">
            <select name="search_target" class="ppbt">
              <option value="title_content">제목+내용</option>
              <option value="title">제목</option>
              <option value="content">내용</option>
              <option value="comment">댓글</option>
              <option value="nick_name">작성자</option>
            </select>
            <input class="ppip focused" type="text" name="search_keyword" value="" title="검색" placeholder="검색어를 입력하세요.">
            <button class="ppbt bt_mono" type="submit">검색</button>
          </form>
        </div>
        <div class="paging txt_en">
          <div class="paging_wrap">
            <a href="#">1</a><a href="#" class="page_num">2</a><a href="#" class="page_num">3</a><a href="#"
              class="page_num">4</a><a href="#" class="page_num">5</a><a href="#" class="page_num">6</a><a href="#"
              class="page_num">7</a><a href="#" class="page_num">8</a><a href="#" class="page_num">9</a><a href="#"
              class="page_num">10</a> ... <a class="bt_page bt_last" href="#" title="last page">끝 페이지</a>
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
            	<li>구해줘! 프렌즈</li>
                <li>농협 123-123-123456</li>
                
            </ul>
        </div>

</footer>

    </div>
  </div>

</body>
</html>
