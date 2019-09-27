<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>      
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="스터디게시판 | 상세" />
</c:import> 
</head>
<body>
   <div class="wrapper sWrapDetail">
      <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
          <div class="container">
            <div class="top_box">
                <a class="write" href="<c:url value="/study/studywriteform.do" />"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a>
            </div>
            <article>
              <p class="completed">${study.studyRecruitEnabled}</p>
              <h1>${study.studyPostTitle}</h1>
              <p class="info">
                <span><fmt:formatDate value="${study.studyRegDt}" pattern="yyyy-MM-dd HH:mm" /></span>
                <span class="viewcount">${study.studyViewCnt}</span>
                <span class="commentcount">2</span>
              </p>
              <div class="about">
                <h3>${study.studyLoc}</h3>
                <h3>${study.studyRecruitField}</h3>
                <h3>${study.studyRecruitMem}</h3>
              </div>
              <p class="text">${study.studyPostContent}</p>
            </article>
            <div class="bottom_box">
                <div style="margin-bottom : 10px">
                    <a href="#popup" class="floating comment">댓글 쓰기</a>
                    <div id="popup" class="layer">
                        <div class="box">
                          <textarea id="comment" cols="30" rows="10" placeholder="댓글을 입력해주세요"></textarea>
                          <a href="#" class="close">닫기</a>
                          <a href="#" class="close">등록</a>
                        </div>
                      </div>
                  </div>
                  <div>
                    <a href="#popupDel" class="floating delete">삭제</a>
                    <div id="popupDel" class=layer>
                      <div class="box">
                        <p class="text">삭제 하시겠습니까?</p>
                        <a href="#" class="close">닫기</a>
                        <a href="<c:url value="/study/studyDelete.do?studyPostNo=${study.studyPostNo}" />" class="delete">삭제</a>
                      </div>
                    </div>
                    <a href="<c:url value="/study/studyUpdate.do?studyPostNo=${study.studyPostNo}" />" class="floating modify">수정</a>
                  </div>
            </div>
            
            <div class="comments">
                <div class="item parent">
                    <p class="profile">홍길동</p>
                    <p class="text">참여하고싶어요~ 어디로 연락드리면되나요?</p>
                    <div class="info">
                      <p>09/18 00:39</p>
                      <a href="#popupMod">수정</a>
                      <div id="popupMod" class=layer>
                          <div class="box">
                            <textarea id="comment" cols="30" rows="10">참여하고싶어요~ 어디로 연락드리면되나요?</textarea>
                            <a href="#" class="close">닫기</a>
                            <a href="./board_detail_study.html" class="close">등록</a>
                          </div>                      
                        </div>
                      <a href="#popupDel">삭제</a>
                   
                </div>
                <div class="item child">
                    <p class="profile">글쓴이</p>
                    <p class="text">010.1234.5678 로 문자주세요 :)</p>
                </div>
            </div>
            <div class="comments">
                <div class="item parent">
                    <p class="profile">글쓴이</p>
                    <p class="text">아직 모집중입니다 댓글,문자 주세요!</p>
                    <p class="info">09/18 10:12</p>
                </div>
                <div class="item child">
                  <a href="#popup">대댓글을 입력해주세요</a>

                  <!-- <textarea id="commentChild" cols="30" rows="10" placeholder="대댓글을 입력해주세요"></textarea> -->
                </div>
            </div>
        
            

          </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <%@include file="/jsp/include/footer.jsp" %>
    
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

