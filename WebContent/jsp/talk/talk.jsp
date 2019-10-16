<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%--  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 공지 </title>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <script src="js/jquery-3.3.1.min.js"></script> --%>
 <%@ include file="/jsp/include/head.jsp"%>
</head>
<body>
   <div class="wrapepr">
     <!-- 헤더 -->
    <!-- <div class="w1280">
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
    </div> -->
    <!-- // 헤더 끝-->
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
         <section class="content ns_content">

            <h1 class="ns_Title">자유게시판</h1>



            <!-- <div class="ns_listlength">
              
                <select name="list">
                    <option value="10" selected>10개</option>
                    <option value="15">15개</option>
                    <option value="20">20개</option>
                    
                </select>씩 보기
            </div> -->
  
        <%--
            <div class="ns_table">
                <ul class="ns_TableListHead">
                    <li>
                        <span>번호</span>
                        <span>제목</span>
                        <span>작성자</span>
                        <span>작성일</span>
                        <span>조회수</span>
                    </li>
                    
                </ul>
                
                

                
                <ul class="ns_TableListBody">
                <c:forEach var="b" items="${notice}">
                  <li >
                      <span>${b.postNo}</span>
                      <span ><a href="<c:url value="/notice_detail.do?postNo=${b.postNo}&pageNo=${pr.pageNo}"/>">${b.title}</a></span>
                      <span>${b.userNo }</span>
                      <span><fmt:formatDate value="${b.regDt}" pattern="MM-dd hh:mm"/></span>
                      <span>${b.viewCnt}</span>
                  </li>
                </c:forEach>
                <c:if test="${empty notice}">
				<li >
					<span></span>
					<span colspan='4'>입력된 게시물이 없습니다.</span>
				</li>
			</c:if>
                </ul>
            </div>
        --%> 
      <%@ include file="/jsp/talk/talk_list.jsp" %>
  
  
          

        <c:if test="${pr.count > 10}">
        <ul class="pagination nams">
        <c:if test="${pr.count != 0}">
	  	<c:if test="${pr.prev}">
	    <li>
	      <a href="talkList.do?pageNo=${pr.beginPage -1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
	    	<li 
	    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
	    	><a href="talkList.do?pageNo=${i}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i}</a></li>
	    </c:forEach>
	  	<c:if test="${pr.next}">
	    <li>
	      <a href="talkList.do?pageNo=${pr.endPage + 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	    </c:if>
		</c:if>
		</ul>
		</c:if>
		
            <c:choose>
            <c:when test="${ not empty sessionScope.user.userNo }">
            <a class="ns_go_write" href="/bitcomu/jsp/talk/talk_write.jsp"> 
              <div> 
              	  글쓰기
              </div>
            </a>
            </c:when>
            <c:otherwise></c:otherwise>
            </c:choose>
            
            <div class="ns_search">
           <form method="post" action="/bitcomu/talk/talkList.do">
                search : 
                <select name="searchType">
                    <option value="titleContent" selected>제목 + 내용</option>
                    <option value="title" >제목</option>
                    <option value="content">내용</option>
                    <option value="user">글쓴이</option>
                </select>
                
                <input type="text" name="searchWord" >
		        <button type="submit" id="doSearch" >검색</button>
           </form>
            </div>
        </section>  
        
        
        
        
        
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <!-- <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer> -->
    <!--// 푸터 끝-->
    <%@ include file="../include/footer.jsp"%> 
    
    


  </div>
  <script>
  function doSearch() {
	
}

  </script>
</body>
</html>



