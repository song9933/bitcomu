<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 조별 게시판 </title>
  <link rel="stylesheet" href="css/team_cws.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/w3.css">

  <script src="js/jquery-3.3.1.min.js"></script>
</head>

<body>
  <div class="wrapepr">
    <!-- 헤더 -->
    <div class="w1280">
      <header class="clearboth">
        <h1><a href="/index.html"><img src="img/logo.png" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="/notice.html">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="/board_talk.html">자유게시판</a></li>
              <li><a href="/board_team.html">조별게시판</a></li>
              <li><a href="/board_study.html">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="/qna.html">질문답변</a></li>
          <li><a href="/vote.html">투표</a></li>
          <li><a href="/onlineclass.html">온라인강의</a></li>
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
      <section class="content">

        <h2 class="title_cws" style="text-align: center"><a href="board_team.html"> 조별프로젝트 게시판 </a></h2>
        <br>
        <br>
        <br>
        <br>
        <div class="tabs_cws">
          <ul>
            <li class="active"><a href="#">1 차</a></li>
            <li><a href="#">2 차</a></li>
            <li><a href="#">3 차</a></li>
            <li><a href="#">4 차</a></li>
          </ul>
        </div>
        <br>
        <br>

        <div class="subtabs_cws">
            <br>
            <div class="a">
          <ul>
              <li><a href="#">1조</a></li>
              <li><a href="#">2조</a></li>
              <li class="active"><a href="#">3조</a></li>
              <li><a href="#">4조</a></li>
          </ul>
            </div>
        </div>


        <div class="boardtitle_cws">
          <h2>1조의 진행상황</h2>
        </div>
        <!-- <br> -->
        <!-- <br> -->
        <br>
        <br>
        <form action="board_team_write.html">
          <button class="writebutton_cws">글등록</button>
        </form>
        <br>
        <br>

        <br>
        <br>
        <div class="board_cws">
          <input type="image" src="../../resources/images/top_ar.png"
            style="border:1px solid gray; width: 100px; height: 100px; float: right;">
          <ul>
            <li><a href=""> ▶ 글 내용.. </a></li>
          </ul>
          <br>
          <progress value="20" max="100"></progress>
          <h5>진행률: 20%</h5>
        </div>

        <div>&nbsp;</div>




      </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    <div class="background_cws">
    </div>
    <div class="updatepopup_cws">
      <form action="board_team.html">
        <button class="close_cws" style="width:50px; height:50px; 
      background-color: white; opacity: .9; border: none">
      </button>
      </form>
      <br>
      <h1 style="text-align: center">수정페이지</h1>
      <br>
      <div>
        <select>
          <option selected>말머리선택</option>
          <option>1조</option>
          <option>2조</option>
          <option>3조</option>
          <option>4조</option>
          <option>공지</option>
        </select>
      </div>
      <div class="updatetitleboard_cws">
        <input type="text" placeholder="작성된 글 제목" 
        style="width: 100%; border: hidden">
        <br>
        <br>
        <div class="writecontent_cws">
          <textarea onclick="this.value=''" 
          style="width: 100%; height: 100%; 
          font-size: 16px; text-align: left; 
          padding: 5px; resize: none">
            작성된 글 내용</textarea>
        </div>
        <br>
        <div class="alreadyfile_cws">
          <a>첨부된 파일 &emsp;<input type="text" style="border: none" value="aaa.css">
            <br>
          &emsp;&emsp;&emsp;&emsp;&emsp; 
          &emsp;<input type="text" style="border: none" value="ac8.html"></a>
        </div>
        <div class="alreadyimage_cws">
          <a>첨부된 이미지 &emsp;<input type="image"></a>
        </div>
        <br>
        <input type="file" name="작성된 파일" style="cursor: pointer; width:180px; float: left; margin-left: -120px"
          onchange="previewImage(this,'View_area')" >
        <input type="image" src="" style="margin-left: 20px;">
        <br>
        <button class="updatesubmit_cws">수정완료</button>
      </div>
    </div>
  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>

</html>