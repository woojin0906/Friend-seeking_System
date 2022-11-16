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
  <div class="wrapper">
      
      <div class="icon arrow"><i class="fas fa-arrow-left"></i></div>
      <div class="icon dots"><i class="fas fa-ellipsis-v"></i></div>
      <div class="name">닉네임(아이디)이 들어감</div>
      <div class="about">간단한 자기소개(없어도됨)</div>
      <div class="buttons"><button onclick="location.href='#'">참여한 글</button></div>
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
</body>
</html>