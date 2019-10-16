<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>        
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
  	<c:param name="msg" value="스터디게시판 | 글쓰기" />
  </c:import> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
</head>
<body>
   <div class="wrapper sWrapWrite">
      <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
          <div class="container">
          <div class="top_box" style="display: inline-block">
          	<a href="<c:url value="/study/studyList.do"/>" class="floating comment" >목록</a>
			</div>
          <form name="wForm" method="post" action="<c:url value="/study/studywrite.do"/>" onsubmit="return nullChk()">
              <div class="section">
                  <h2>분야</h2>
                  <div class="checks">
                    <input type="radio" id="srf1" name="studyRecruitField"  value="자바" 	   /><label for="srf1">자바 </label>                  	 
                    <input type="radio" id="srf2" name="studyRecruitField"  value="자바스크립트"  /><label for="srf2">자바스크립트 </label>                  	 
                    <input type="radio" id="srf3" name="studyRecruitField"  value="데이터베이스"  /><label for="srf3">데이터베이스 </label>                  	 
                    <input type="radio" id="srf4" name="studyRecruitField"  value="알고리즘" 		/><label for="srf4">알고리즘 </label>                  	 
                    <input type="radio" id="srf5" name="studyRecruitField"  value="jsp/서블릿" 	/><label for="srf5">jsp/서블릿 </label>                  	 
                    <input type="radio" id="srf6" name="studyRecruitField"  value="jQuery" 		/><label for="srf6">jQuery </label>                  	 
                    <input type="radio" id="srf7" name="studyRecruitField"  value="Spring" 		/><label for="srf7">Spring </label>                  	 
                    <input type="radio" id="srf8" name="studyRecruitField"  value="기타" 		/><label for="srf8">기타</label>                  	 
                  </div>
              </div>
              <div class="section">
                  <h2>지역</h2>
                  <input type="text"  name="studyLoc" placeholder="지역을 입력하세요">
              </div>
              <div class="section">
                  <h2>모집 인원</h2>
                <p>
				  <!--
				  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
				    -->
					<span class="studyRecruitMemMin" name="studyRecruitMemMin">5</span>명~
					<input type="hidden" name="studyRecruitMemMin" id="studyRecruitMemMin" />
					<span class="studyRecruitMemMax" name="studyRecruitMemMax">10</span>명
					<input type="hidden" name="studyRecruitMemMax" id="studyRecruitMemMax"/>
				</p>
				<div id="slider-range"></div>     
              </div>
              <div class="section">
                  <h2>모집 여부</h2>
                <div class="enabled">
                    <input type="radio" id="sre1" name="studyRecruitEnabled" value="Y" /><label for="sre1">모집중</label>
                    <input type="radio" id="sre2" name="studyRecruitEnabled" value="N" /><label for="sre2">마감</label>
                </div>  
              </div>
            <p class="title">
                <input type="text"  name="studyPostTitle" placeholder="제목을 입력하세요">
            </p>
            <p class="text">
                <textarea name="studyPostContent" placeholder="내용을 입력하세요"></textarea>
            </p>
            <div class="submit">
                <input type="submit" value="글쓰기">
            </div>
        	</form>
          </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
 	<%@include file="/jsp/include/footer.jsp" %>
  </div>
 <script>
 
 function nullChk(){
	 let f = document.wForm;

	 if (isEmpty(f.studyRecruitField, "모집분야를 선택하세요.")) return false;
	 if (isEmpty(f.studyLoc,"지역을 입력하세요.")) return false;
	 
	 if (isEmpty(f.studyRecruitEnabled,"모집여부를 선택하세요.")) return false;
	 if (isEmpty(f.studyPostTitle,"제목을 입력하세요.")) return false;
	 if (isEmpty(f.studyPostContent,"내용을 입력하세요.")) return false;	 	

	 return true;
 }
 
 function isEmpty(ele, msg){
	 if (ele.value == ""){
		 alert(msg);
		 console.log(msg);
		 return true;
	 }
	 return false;
 }
 
let min = document.querySelector("#studyRecruitMemMin");
min.value="5";
 let max = document.querySelector("#studyRecruitMemMax");
 max.value="10";
 
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 2,
      max: 20,
      values: [ 5, 10 ],
      slide: function( event, ui ) {
    	$(".studyRecruitMemMin").text(ui.values[0]);  
    	$(".studyRecruitMemMax").text(ui.values[1]);  
    	min.value = ui.values[0];
    	max.value = ui.values[1];
  
      }
    });
  
  } );
  
  </script>
</body>
</html>

