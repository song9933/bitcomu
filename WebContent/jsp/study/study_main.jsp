<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="스터디게시판" />
</c:import> 
</head>
<body>
   <div class="wrapper sWrap">
   <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
          <div class="container">
            <div class="top_box">
              <a class="write" href="<c:url value="/study/studywriteform.do" />"><i class="fa fa-pencil" aria-hidden="true"></i>글쓰기</a>
              <div class="search">
                <form>
                  <i class="fa fa-search" aria-hidden="true"></i>
                  <button type="submit" class="submit"></button>
                  <input type="search" name="keyword" class="keyword" placeholder="검색어를 입력해주세요">
                </form>
              </div>
            </div>
            <div class="list">
              <c:if test="${empty list}">
              	<p>게시물이 없습니다.</p>
              </c:if>
              <!-- 반복돌려서 스터디게시판 전체 글 가져오기 -->
              <c:forEach var="std" items="${list}">
              	  <a class="item" href="<c:url value="/study/studydetail.do?studyPostNo=${std.studyPostNo}" />">
	                <p class="completed">${std.studyRecruitEnabled}</p>
	                <h2> ${std.studyPostTitle }</h2>
	                <p class="info">
	                  <span><fmt:formatDate value="${std.studyRegDt}" pattern="yyyy-MM-dd HH:mm" /></span>
	                  <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>${std.studyViewCnt }</span>
	                  <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
	                </p>
	              </a>
              
              </c:forEach>
              
              <!-- 
              
              <a class="item" href="./board_detail_study.html">
                <p class="completed">모집중</p>
                <h2> 자바 스터디 모집합니다 :)</h2>
                <p class="info">
                  <span>19/09/05 20:27</span>
                  <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>10</span>
                  <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
                </p>
              </a>
              <a class="item" href=#>
                  <p class="completed">모집중</p>
                  <h2> 자바 스터디 모집합니다 :)</h2>
                  <p class="info">
                    <span>19/09/05 20:27</span>
                    <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>10</span>
                    <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
                  </p>
              </a>
              <a class="item" href=#>
                  <p class="completed">모집중</p>
                  <h2> 자바 스터디 모집합니다 :)</h2>
                  <p class="info">
                    <span>19/09/05 20:27</span>
                    <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>10</span>
                    <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
                  </p>
              </a>
              <a class="item" href=#>
                  <p class="completed">모집중</p>
                  <h2> 자바 스터디 모집합니다 :)</h2>
                  <p class="info">
                    <span>19/09/05 20:27</span>
                    <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>10</span>
                    <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
                  </p>
              </a>
              <a class="item" href=#>
                  <p class="completed">모집중</p>
                  <h2> 자바 스터디 모집합니다 :)</h2>
                  <p class="info">
                    <span>19/09/05 20:27</span>
                    <span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>10</span>
                    <span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>2</span>
                  </p>
              </a> 
              -->
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

