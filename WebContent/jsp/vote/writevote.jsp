<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 투표 </title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
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
        <form id="dc_form_write" class="w3-panel w3-card-4" action="/action_page.php">
          <h3>새 투표 등록하기</h3>

          <p><input class="w3-input" type="text" placeholder="투표제목"></p>
          <br>
          <p><input type="text" name="expired" id="dc_Datepicker" placeholder="마감일 선택" value="마감일선택"></p>
          <br>
          <p><textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.."></textarea></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>

          <i class="fa fa-plus-square" aria-hidden="true"></i>
          <i class="fa fa-minus-square" aria-hidden="true"></i>

          <p>
            <input class="w3-check" type="checkbox">
            <label>중복투표허용</label></p>
          <p>
            <input class="w3-check" type="checkbox">
            <label>익명투표허용</label></p>
          <br>
          <p><button type="submit" class="w3-btn w3-blue">등록하기</button></p>
          <br>
        </form>
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
    $(function () {
      $("#dc_Datepicker").datepicker({
        showOn: "both",
        changeMonth: true,
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true,
        currentText: '오늘 날짜',
        closeText: '닫기',
        dateFormat: "yymmdd",
        changeMonth: true,
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
      });
    });

    $(function () {
      $('.timepicker').timepicker();
    });

  </script>
</body>

</html>