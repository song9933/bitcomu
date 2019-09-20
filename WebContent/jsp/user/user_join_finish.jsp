<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 회원가입 </title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
   <div class="wrapepr email_wrap">
     <!-- 헤더 -->
    <div class="w1280">
      <header>
        <h1><a href="../index.html"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="../notice.html">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="../board_talk.html">자유게시판</a></li>
              <li><a href="../board_team.html">조별게시판</a></li>
              <li><a href="../board_study.html">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="../qna.html">질문답변</a></li>
          <li><a href="../vote.html">투표</a></li>
          <li><a href="../onlineclass.html">온라인강의</a></li>
        </ul>
        <ul class="nav">
          <li><a href="#">로그인</a></li>
          <li><a href="#">회원가입</a></li>
        </ul>
      </header>
    </div>
    <!-- // 헤더 끝-->
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <div class="board_box_sj sub_top_sj">
        <span class="inline_sub_top_sj"><i class="fa fa-check-square-o" aria-hidden="true">약관동의</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-envelope" aria-hidden="true">이메일 인증</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-user-plus" aria-hidden="true">개인정보입력</i></span>
        <span class="inline_sub_top_sj selected"><i class="fa fa-lock" aria-hidden="true">가입완료</i></span>
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">

          
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-lock" aria-hidden="true" style="color: #ffa500;"></i>가입완료</span></p>
                  <div class="board_box_sj box_detail_sj">
                      <i class="fa fa-check fa-5x" aria-hidden="true" style="color: red; text-align: center"></i>
                  </div>
                  <div class="board_box_sj box_detail_sj font_size_sj">
                        <strong>축하합니다!</strong><br/><br/>
                        회원가입이 완료되었습니다.
                    </div>

                    <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">로그인</button><span class="margin_sj"></span>
                  <button type="submit" class="button_box_sj box_email_sj">홈으로</button>
                </div>
              </div>
          </section>
      </div> 
  </form>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- width= 100%인 컨텐츠 영역-->
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

