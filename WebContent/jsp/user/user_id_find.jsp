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
        <h1><a href="${pageContext.request.contextPath}/main.do"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="비트컴퓨터로고"></a></h1>
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
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-search" aria-hidden="true"; style="color: #ffa500"></i> 아이디 찾기</span></p>
                  <table class="type02_sj">
                        <tr>
                          <td>가입된 전화번호</td>
                          <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                              <option value="010" selected="selected">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="018">018</option>
                              <option value="019">019</option>
                            </select>-
                            <input type="text"
                            name="userphone2" class="input_box_sj box_phone_sj">-
                            <input type="text"
                            name="userphone3" class="input_box_sj box_phone_sj">
                          </td>
                        </tr>
                        <tr>
                            <td>가입된 이메일</td>
                            <td> <input type="text"
                                name="emailAuth" class="input_box_sj box_default_sj" placeholder="가입된 이메일 주소를 입력하세요"></td>
                        </tr>
                        <tr>
                            <td>가입된 이름</td>
                            <td> <input type="text"
                                name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요">
                        </tr>
                  </table>
                  <div class="board_box_sj box_detail_sj">
                    <button type="submit" class="button_box_sj box_email_sj">아이디찾기</button><span class="margin_sj"></span>
                    <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                  </div>
              </div>
          </section>
      </div> 
      
  </form>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <!-- width= 100%인 컨텐츠 영역-->
    <div class="video">
      <div class="w1280 mt100">

      </div>

    </div>
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

