<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">

  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/style.css">
</head>

<body>

  <header class="header">
    <a href="index.jsp"><img class="logoimg" src="image/logo_header.png"></a>
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
                  <form method="get" action="writingFrame.jsp">
					<button type="submit">글작성</button>
				  </form>
                </div>
              </div>
              <div class="table-div">
                <table>
                  <thead>
                    <tr>
                      <th>작성자</th>
                      <th>제목</th>
                      <th>출발지</th>
                      <th>인원</th>
                      <th>성별</th>
                      <th>작성시간</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                    <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                                        <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>
                                        <tr>
                      <td>글작성자가 들어갑니다.</td>
                      <td>글 제목이 들어갑니다. 글제목이 들어갑니다.</td>
                      <td>출발지&amp;도착지가 들어갑니다.</td>
                      <td>인원수가 들어갑니다.</td>
                      <td>성별</td>
                      <td>작성일이 들어갑니다.</td>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      <footer class="list_footer">
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
      </footer>

      <div class="footer">
        <div class="service-menu">
          <ul>
            <li><a href="#">구해줘 프렌즈!</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">저작권 정보</a></li>
            <li><a href="#">이용 안내</a></li>
          </ul>
        </div>
        <p class="copy">문의전화
          123-1234
          10:00 - 18:00(Lunch 12:00 - 13:00)</p>
      </div>

    </div>
  </div>

</body>
</html>
