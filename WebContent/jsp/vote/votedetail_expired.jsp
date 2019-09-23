<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 투표 </title>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/styledc.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/w3.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
  <script src="js/jquery-3.3.1.min.js"></script>

  <!-- // jQuery 기본 js파일 -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <!-- // jQuery UI 라이브러리 js파일 -->
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>

<body>
  <div class="wrapepr">
    <!-- 헤더 -->
    <div class="w1280">
      <header>
        <h1><a href="./index.html"><img src="img/logo.png" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="./notice.html">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="./board_talk.html">자유게시판</a></li>
              <li><a href="./board_team.html">조별게시판</a></li>
              <li><a href="./board_study.html">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="./qna.html">질문답변</a></li>
          <li><a href="./vote.html">투표</a></li>
          <li><a href="./onlineclass.html">온라인강의</a></li>
        </ul>
        <ul class="nav">
          <li><a href="#">로그인</a></li>
          <li><a href="#">회원가입</a></li>
        </ul>
      </header>
    </div>
    <!-- // 헤더 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
      <section class="content dc_section">
            <div class="w3-container w3-card w3-white w3-round" id="dc_expired_vote">
                <h3>회식 선호날짜 투표(종료) 결과보기</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <h4>종료된 투표입니다.</h4>
                <br>
                <div class="w3-panel w3-light-grey" >
                        <h5>회식 선호날짜 투표</h5>
                        <p>선호하는 날짜를 선택해주세요.</p>
                        <br>
                </div>
                
                <!-- 투표결과 -->
                <div class="w3-container w3-card w3-white">
                    <h5>투표 결과</h5>
                    <p>7월 26일</p>
                    <div class="w3-light-grey w3-round-xlarge w3-small">
                      <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:72%">72%</div>
                    </div>
                    <br>
                    <p>7월 19일</p>
                    <div class="w3-light-grey w3-round-xlarge w3-small">
                      <div class="w3-container w3-center w3-round-xlarge w3-light-blue" style="width:28%">
                        <div class="w3-center w3-text-white">28%</div>
                      </div>
                </div>
                <br>
                <h6>나의 선택 : </h6>
                <br>
                <p>7월 26일</p>
                <br>
               
                </div>


           
    </section>
  </div>
  <!-- //width = 1280px 인 컨텐츠영역 끝-->

  <!-- 푸터 -->
  <footer class="w1280">
    <p> Copyright &copy; 비트캠프 All rights reserved.</p>
  </footer>
  <!--// 푸터 끝-->




  </div>
  <script>
    // $(document).ready(alert());

  </script>
</body>

</html>