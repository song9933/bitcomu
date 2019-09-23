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
            <div class="w3-container w3-card w3-white w3-round" id="dc_radio_vote">
                <h3><공지><익명>26일 회식 참가가능여부</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <div class="w3-panel w3-blue" >
                        <h5>26일 회식 참가가능여부</h5>
                        <p>투표 결과는 익명처리됩니다.</p>
                        <p>참여 미참여 여부를 선택해주세요.</p>
                        <br>
                </div>
                <br>
                <header class="w3-card w3-light-grey dc_expire">마감까지 : 1일 23시간 45분 13초..</header>
                <!-- 라디오 버튼 -->
                <div class="w3-container w3-card w3-white">
                    <form action="/action_page.php">
                      <h3>투표하기</h3>
                      <p>
                      <input class="w3-radio" type="radio" name="option" value="1">
                      <label>참여</label></p>
                      <p>
                      <input class="w3-radio" type="radio" name="option" value="2">
                      <label>미참여</label></p>
                      <br>
                      <br>
                      <br>
                    </form>

                </div>
                <br>
                <p><button type="submit" class="w3-btn w3-green">투표하기</button></p>
               
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