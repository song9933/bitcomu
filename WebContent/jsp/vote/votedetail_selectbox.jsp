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
            <div class="w3-container w3-card w3-white w3-round" id="dc_selectbox_vote">
                <h3><공지><익명>반장 선출 투표</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <div class="w3-panel w3-blue" >
                        <h5>반장 선출 투표</h5>
                        <p>투표 결과는 익명처리됩니다.</p>
                        <p>뽑고싶은 사람 이름을 선택하세요.</p>
                        <br>
                </div>
                
                <!-- 셀렉트박스 -->
                <div class="w3-container w3-card w3-white">
                    <form action="/action_page.php">
                      <h3>투표하기</h3>
                    
                      <select class="w3-select" name="option">
                        <option value="" disabled selected>선택해 주세요..</option>
                        <option value="1">유승재</option>
                        <option value="2">박남수</option>
                        <option value="3">임진산</option>
                        <option value="4">최우석</option>
                        <option value="5">오동훈</option>
                        <option value="6">신용환</option>
                      </select>
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