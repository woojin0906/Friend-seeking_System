<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index_style.css">
    <script src="script/header.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
</head>
<body>
    <header class="header">
        <a href="#"><img class ="logoimg"src="image/logo_header.png"></a>
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
                <a class="astyle" href="#"><p><img src="image/car.png">  붕붕 친구 게시판</p></a>
                <hr class="hrstyle">
                <!-- 글 제목 받아오기 -->
            </div>
            <div class="simple-view">
                <a class="astyle" href="#"><p><img src="image/eat.png">  냠냠 친구 게시판</p></a>
                <hr class="hrstyle">
                <!-- 글 제목 받아이고 -->
            </div>
            <div class="simple-view">
                <a class="astyle" href="#"><p><img src="image/studying.png">  열공 친구 게시판</p></a>
                <hr class="hrstyle">
                <!-- 글 제목 받아오기 -->
            </div>
        </div>
    </div>
    
    
</body>
</html>