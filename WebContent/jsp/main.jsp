<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="메인" />
  </c:import> 
</head>
<body>
   <div class="wrapepr main_wrap">
    <c:import url="/jsp/include/header.jsp"/>

    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div> 
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content clearboth">
            <div class="board_box clearboth">
              <div>
                <p><i class="fa fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;공지사항</p>
                <ul>
                  <li><span>●</span>비트캠프 학생여러분 안녕하세요 ^^</li>
                  <li><span>●</span>와이파이비밀번호입니다.</li>
                  <li><span>●</span>지각현황입니다 </li>
                  <li><span>●</span>회식 관련공지입니다.</li>
                  <li><span>●</span>2차 프로젝트 일정확인해주세요.</li>
                  <li><span>●</span>컴퓨터에 불법 프로그램설치하지 마세요</li>
                  <li><span>●</span>과제 제출 하세요</li>
                </ul>
              </div>
              <div>
                <p><i class="fa fa-commenting-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;자유게시판</p>
                <ul>
                  <li><span>●</span>공리주의 - 끝나지않을이야기 <em>[12]</em></li>
                  <li><span>●</span>오늘 회사 난리남 <em>[12]</em></li>
                  <li><span>●</span>곤자가 런치박스 개꿀인데??! <em>[12]</em></li>
                  <li><span>●</span>예비군 멋지네진짜 <em>[12]</em></li>
                  <li><span>●</span>최태성 유튜브 쩐다 <em>[12]</em></li>
                  <!-- <li><span>●</span>고기 속여 팔다가 유튜버한테 걸림.jpg <em>[12]</em></li> -->
                  <li><span>●</span>오늘자 대기업 회의 <em>[12]</em></li>
                </ul>
              </div>
              <div>
                  <p><i class="fa fa-sticky-note" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;투표게시판</p>
                  <ul>
                      <li><span>●</span>희망하는간식 <em>[12]</em></li>
                      <li><span>●</span>반장을 뽑아주세요 <em>[12]</em></li>
                      <li><span>●</span>투표3 <em>[12]</em></li>
                      <li><span>●</span>회식 희망날짜 <em>[12]</em></li>
                  </ul>
              </div>
            </div>

            <div class="stdboard_box mt100" >
    		<c:forEach items="${studyList}" var="studyList" >
    		<div class="box" id="stdBox" data-num="${studyList.studyPostNo}">
                <a class="item">
                	<p class="completed" id="completed" >${studyList.studyRecruitEnabled}</p>
              		<p class="sub">${studyList.studyRecruitField}</p>
					<span><h2 style="font-size: 35px; margin: 9px 0;">${studyList.studyPostTitle}</h2></span>
					<p>
						<span style="margin : 0 5px 0 0">${studyList.studyRegDt}</span>
						
					</p>
                </a>
            </div>
    		</c:forEach>
              
              <div class="box more" id="boxMore" style="padding : 0">더 보기 <i class="fa fa-plus-circle" aria-hidden="true"></i>
              </div>
            </div>
            
            <div class="banner mt100">
              <div class="box"></div>
              <div class="box"></div>
              <div class="box"></div>
            </div>

        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <!-- width= 100%인 컨텐츠 영역-->
    <div class="video clearboth">
      <div class="w1280 mt100 clearboth">
        <h4>온라인 강의</h4>
        <div class="ifrWrap clearboth">
          <!--  <iframe src="https://www.youtube.com/embed/KR9nyo8hAdI?playsinline=0&fs=1&rel=0" frameborder="0" allowfullscreen ></iframe> -->
          <div class="ifrBox">
              <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
              <span>1</span>
              <div class="ifrInfo">
                <h5>Spring Framework 개요 및 특징</h5>
                <p>강의시간 36:24</p>
              </div>
          </div>
          <div class="ifrBox">
              <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
              <span>1</span>
              <div class="ifrInfo">
                <h5>Spring Framework 개요 및 특징</h5>
                <p>강의시간 36:24</p>
              </div>
          </div>
          <div class="ifrBox">
            <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
            <span>1</span>
            <div class="ifrInfo">
              <h5>Spring Framework 개요 및 특징</h5>
              <p>강의시간 36:24</p>
            </div>
          </div>
          <div class="ifrBox">
            <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
            <span>1</span>
            <div class="ifrInfo clearboth">
              <h5>Spring Framework 개요 및 특징</h5>
              <p>강의시간 36:24</p>
            </div>
          </div>
        </div>
        <div class="pagination clearboth">
          <p class="on">1</p>
          <p>2</p>
          <p>3</p>
          <p>4</p>
        </div>
    </div>
    </div>
   <%@include file="/jsp/include/footer.jsp" %>
    
    

    <div class="popbg">

    </div>
    <div class="popup">
      <h1>레이어팝업</h1>
    </div>
  </div>
  <script>
  
  // 메인)더보기 버튼으로 스터디게시판 이동
  let boxMore = document.getElementById("boxMore");
  boxMore.addEventListener('click', e => {
	  location.href='/bitcomu/study/studyList.do;';
  })
  
  // 메인) 스터디 게시판 글 모집여부 부분
   let ele = document.getElementsByClassName("completed");
	for (let i = 0; i<ele.length ; i++){
	
		if (ele[i].innerText == 'Y'){
			ele[i].innerText = '모집중';
			ele[i].style.background = '#7D9EF8';
			ele[i].style.color = 'white';
		} else if(ele[i].innerText != '모집중') {
			ele[i].innerText  = '마감';
		}
	}    

	// 메인) 스터디게시판 상세글 이동 
	let stdBox = document.getElementById("stdBox");
	  stdBox.addEventListener('click', e=> {
		  
		  location.href = '/bitcomu/study/studydetail.do?studyPostNo='+ stdBox.getAttribute("data-num");
	  })

	
  </script>
</body>
</html>

