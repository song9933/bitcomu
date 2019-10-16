<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<%
int yt_no1 = 0;
%>    
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
                <p><a href="/bitcomu/notice/noticeList.do"><i class="fa fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;공지사항</a></p>
                <ul>
                	<c:forEach var="i" items="${noticeList}" begin="0" end="6" step="1" >
                		<li class="notice-list-main"><a href="/bitcomu/notice_detail.do?postNo=${i.postNo}&pageNo=1"><span>●</span>${i.title}</a> </li>
                	</c:forEach>
                </ul>
              </div>
              <div>
                <p><a href="/bitcomu/talk/talkList.do"><i class="fa fa-commenting-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;자유게시판</a></p>
                <ul>
                <c:forEach var="i" items="${talkList}" begin="0" end="6" step="1" >
                		<li class="talk-list-main"><a href="/bitcomu/talk/talk_detail.do?postNo=${i.postNo}&pageNo=1"><span>●</span>${i.title}</a><em> [${i.cmtCnt}]</em> </li>
                </c:forEach>
                </ul>
              </div>
              <div class="vote-list-main-div">
                  <p><a href="/bitcomu/vote/votelist.do"><i class="fa fa-sticky-note" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;투표게시판</a></p>
                  <ul>
                  	  <c:forEach var="i" items="${voteList}" begin="0" end="6" step="1" >
                  	  	<li class="vote-list-main"><a href="/bitcomu/vote/votedetail.do?voteNo=${i.voteNo}"><span>●</span>${i.voteTitle}</a><em>[${i.voteInCnt}]</em></li>
                  	  </c:forEach>
                  </ul>
              </div>
            </div>

            <div class="stdboard_box mt100" >
    		<c:forEach items="${studyList}" var="studyList" >
    		<div class="box mainStd" id="stdBox${studyList.studyPostNo}" data-num="${studyList.studyPostNo}">
                <a class="item">
                	<p class="completed" id="completed" >${studyList.studyRecruitEnabled}</p>
              		<p class="sub">${studyList.studyRecruitField}</p>
					<span><h2 style="font-size: 30px; margin: 9px 0;">${studyList.studyPostTitle}</h2></span>
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
      <div class="online_cls w1280 mt100 clearboth">
        <h4>온라인 강의</h4>
        <!-- 전체과목 리스트 div -->
		<div class="subj_container clearboth">
			<div class="subjWrap clearboth">
			<c:choose>
				<c:when test="${empty oclsList }">
					<h2> 등록된 과목이 없습니다 </h2>
				</c:when>
				<c:otherwise>
					<c:forEach var="subject" items="${ oclsList }" begin="0" end="3" step="1">
						<div class="ifrBox" onclick="location.href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${ subject.ytSubject }'">
							<div class="imgBox"><img src="https://img.youtube.com/vi/${ subject.ytAddrMod }/0.jpg"></div>
							<span><%= ++yt_no1 %></span>
							<div class="ifrInfo"><h5>${ subject.ytSubject }</h5></div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="btn_r clearboth" onclick="location.href='${pageContext.request.contextPath}/onlineclass/onlineclsMain.do'">
          <p id="btnYtMore">더보기</p>
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
	
//	let stdBox = document.getElementById("stdBox");
	let arrStdBox = document.getElementsByClassName("mainStd");
	for(let i = 0; i<arrStdBox.length; i++){
		
	  arrStdBox[i].addEventListener('click', e => {
		  
		  location.href = '/bitcomu/study/studydetail.do?studyPostNo='+ arrStdBox[i].getAttribute("data-num");
	  })

	}
	/* 온라인강의 섹션 */
	
	/* 온라인강의 섹션 END */
  </script>
</body>
</html>

