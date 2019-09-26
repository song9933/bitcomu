<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- 헤더 -->
    <div class="w1280">
      <header>
        <h1><a href='<c:url value="/main.do" />'><img src="<c:url value="/resources/images/logo.png" />" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="<c:url value="/notice/noticeList.do" />">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="<c:url value="/talk/talkList.do" />">자유게시판</a></li>
              
              <li><a href="<c:url value="/team/teamBoardList.do" />">조별게시판</a></li>
              <li><a href="<c:url value="/study/studyList.do" />">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="<c:url value="/qna/qnaList.do" />">질문답변</a></li>
          <li><a href="<c:url value="/vote/votelist.do" />">투표</a></li>
          <li><a href="<c:url value="/onlineclass/onlineclsMain.do" />">온라인강의</a></li>
        </ul>
        <ul class="nav">
          <c:choose>
          	<c:when test="${empty sessionScope.user}">
		          <li><a href='<c:url value="/user/userLoginForm.do"/>'>로그인</a></li>
		          <li><a href="<c:url value="/user/userJoinTos.do"/>">회원가입</a></li>
          	</c:when>
          	<c:otherwise>
		          <li><a href="<c:url value="/user/userLogout.do"/>">로그아웃</a></li>
		          <li><a href="<c:url value="/user/userUpdateForm.do"/>">마이페이지</a></li>  	
          	</c:otherwise>
          </c:choose>
        </ul>
      </header>
    </div>
    <!-- // 헤더 끝-->