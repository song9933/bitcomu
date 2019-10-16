<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko" style="overflow-x : scroll">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="스터디게시판" />
</c:import> 
<style>
	.selectType {
	display: inline-block;
    padding: 0 ;
    line-height: 36px;
    color: #a6a6a6;
    font-size: 14px;
    }
</style>
</head>
<body>
   <div class="wrapper sWrap">
   <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
          <div class="container">
            <div class="top_box">
            <c:if test="${!empty sessionScope.user.userNo}">
              <a class="write" href="<c:url value="/study/studywriteform.do" />"><i class="fa fa-pencil" aria-hidden="true"></i>글쓰기</a>
            </c:if>
              <div class="search">
               
                  <i class="fa fa-search" aria-hidden="true"></i>
                  <select id="selectType">
                  	<option value="" selected >분야</option>
                  	<option value="자바" >자바</option>
                  	<option value="자바스크립트" >자바스크립트</option>
                  	<option value="데이터베이스" >데이터베이스</option>
                  	<option value="알고리즘" 	>알고리즘</option>
                  	<option value="jsp/서블릿" >jsp/서블릿</option>
                  	<option value="jQuery" 	>jQuery</option>
                  	<option value="Spring" 	>Spring</option>
                  	<option value="기타" >기타</option>
                  </select>
                  <button type="button" class="submit" id="doSearchStudy"></button>
                  <input type="search" id="keyword" class="keyword" value="${searchWord}" placeholder="검색어를 입력해주세요">
              </div>
            </div>
              <div id="list"></div>
            
            </div>
          </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <%@include file="/jsp/include/footer.jsp" %>
  </div>
  <script>
	let searchType = '${searchType}';
	let searchWord = '${searchWord}';

  </script>
  
  <script src="<c:url value='/resources/js/study.js'/>"></script>
  
</body>
</html>

