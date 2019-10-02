<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>        
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="스터디게시판 | 수정" />
</c:import>
</head>
<body>
   <div class="wrapper sWrapMo">
    <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
            <form method="post" action="<c:url value="/study/studyupdate.do"/>">
            <div class="container">
            <input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
                <div class="section">
                    <h2>분야</h2>
                    <div class="checks"> 
                    <input type="radio" id="srf1" name="studyRecruitField"  value="자바" /><label for="srf1">자바 </label>                  	 
                    <input type="radio" id="srf2" name="studyRecruitField"  value="자바스크립트" /><label for="srf2">자바스크립트 </label>                  	 
                    <input type="radio" id="srf3" name="studyRecruitField"  value="데이터베이스" /><label for="srf3">데이터베이스 </label>                  	 
                    <input type="radio" id="srf4" name="studyRecruitField"  value="알고리즘" /><label for="srf4">알고리즘 </label>                  	 
                    <input type="radio" id="srf5" name="studyRecruitField"  value="jsp/서블릿" /><label for="srf5">jsp/서블릿 </label>                  	 
                    <input type="radio" id="srf6" name="studyRecruitField"  value="jQuery" /><label for="srf6">jQuery </label>                  	 
                    <input type="radio" id="srf7" name="studyRecruitField"  value="Spring" /><label for="srf7">Spring </label>                  	 
                    <input type="radio" id="srf8" name="studyRecruitField"  value="기타" /><label for="srf8">기타</label>                  	 
                    </div>
                </div>
                <div class="section">
                    <h2>지역</h2>
                    <input type="text"  name="studyLoc" value="<c:out value="${study.studyLoc}"/>">
                </div>
                <div class="section">
                    <h2>모집 인원</h2>
                  <div class="checks">
                    <input type="radio" id="srm1" name="studyRecruitMem" value="1" /><label for="srm1">2~5명</label>
                    <input type="radio" id="srm2" name="studyRecruitMem" value="2" /><label for="srm2">6~9명</label>
                    <input type="radio" id="srm3" name="studyRecruitMem" value="3" /><label for="srm3">10~ 명</label>
                    <input type="radio" id="srm4" name="studyRecruitMem" value="4" /><label for="srm4">제한없음</label>
                  </div>
                </div>
                <div class="section">
                    <h2>모집 여부</h2>
                  <div class="enabled">
                    <input type="radio" id="sre1" name="studyRecruitEnabled" value="Y" checked="checked" /><label for="sre1">모집중</label>
                    <input type="radio" id="sre2" name="studyRecruitEnabled" value="N" /><label for="sre2">마감</label>
                  </div>  
                </div>                
               
              <p class="title">
                  <input type="text"  name="studyPostTitle" value="<c:out value="${study.studyPostTitle}"/>">
              </p>
              <p class="text">
                  <textarea name="studyPostContent"><c:out value="${study.studyPostContent}"/></textarea>
  
              </p>
              <div class="submit">
                  <input type="submit" value="수정">
              </div>
          
            </div>
             </form>
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
