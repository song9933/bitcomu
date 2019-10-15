<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>        
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
   <c:param name="msg" value="스터디게시판 | 수정" />
  </c:import>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>
   <div class="wrapper sWrapMo">
    <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
            <div class="container">
             <div class="top_box" style="display: inline-block">
          	<a href="<c:url value="/study/studyList.do"/>"
						class="floating comment" >목록</a>
			</div>
            <form name="uForm" method="post" action="<c:url value="/study/studyupdate.do"/>" onsubmit="return nullChk()">
            <input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
                <div class="section">
                    <h2>분야</h2>
                    <div class="checks"> 
                    <input type="radio" id="srf1" name="studyRecruitField" class="studyRecruitField"
                    		value="자바"/><label for="srf1">자바 </label>                  	 
                    
                    <input type="radio" id="srf2" name="studyRecruitField"  class="studyRecruitField"
                    		value="자바스크립트" /><label for="srf2">자바스크립트 </label>                  	 
                    
                    <input type="radio" id="srf3" name="studyRecruitField"  class="studyRecruitField"
                    		value="데이터베이스"  /><label for="srf3">데이터베이스 </label>                  	 
                    
                    <input type="radio" id="srf4" name="studyRecruitField"  class="studyRecruitField"
                    		value="알고리즘"  /><label for="srf4">알고리즘 </label>                  	 
                    
                    <input type="radio" id="srf5" name="studyRecruitField"  class="studyRecruitField"
                    		value="jsp/서블릿" /><label for="srf5">jsp/서블릿 </label>                  	 
                    
                    <input type="radio" id="srf6" name="studyRecruitField"  class="studyRecruitField"
                    		value="jQuery"  /><label for="srf6">jQuery </label>                  	 
                   
                    <input type="radio" id="srf7" name="studyRecruitField"  class="studyRecruitField"
                    		value="Spring"  /><label for="srf7">Spring </label>                  	 
                    
                    <input type="radio" id="srf8" name="studyRecruitField" class="studyRecruitField" 
                    		value="기타"  /><label for="srf8">기타</label>                  	 
                    </div>
                </div>
                <div class="section">
                    <h2>지역</h2>
                    <input type="text"  name="studyLoc" value="<c:out value="${study.studyLoc}"/>">
                </div>
                <div class="section">
                 <h2>모집 인원</h2>
                <p>
				  <!--
				  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
				    -->
					<span class="studyRecruitMemMin" name="studyRecruitMemMin">${study.studyRecruitMemMin}</span>명~
					<input type="hidden" name="studyRecruitMemMin" id="studyRecruitMemMin" />
					<span class="studyRecruitMemMax" name="studyRecruitMemMax">${study.studyRecruitMemMax}</span>명
					<input type="hidden" name="studyRecruitMemMax" id="studyRecruitMemMax"/>
				</p>
				<div id="slider-range"></div>     
                 <!-- 
                  <div class="checks">
                    <input type="radio" id="srm1" name="studyRecruitMem" value="1" /><label for="srm1">2~5명</label>
                    <input type="radio" id="srm2" name="studyRecruitMem" value="2" /><label for="srm2">6~9명</label>
                    <input type="radio" id="srm3" name="studyRecruitMem" value="3" /><label for="srm3">10~ 명</label>
                    <input type="radio" id="srm4" name="studyRecruitMem" value="4" /><label for="srm4">제한없음</label>
                  </div>
                  -->
                </div>
                <div class="section">
                    <h2>모집 여부</h2>
                  <div class="enabled">
                    <input type="radio" id="sre1" name="studyRecruitEnabled" value="Y" /><label for="sre1">모집중</label>
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
          
             </form>
            </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

 <%@include file="/jsp/include/footer.jsp" %>
    
    


  </div>
<script>

function nullChk(){
	 let f = document.uForm;

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
min.value='${study.studyRecruitMemMin}';
 let max = document.querySelector("#studyRecruitMemMax");
 max.value='${study.studyRecruitMemMax}';
 
$( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 2,
      max: 20,
      values: [ min.value, max.value ],
      slide: function( event, ui ) {
    	$(".studyRecruitMemMin").html(ui.values[0]);  
    	$(".studyRecruitMemMax").html(ui.values[1]);  
     	min.value = ui.values[0];
    	max.value = ui.values[1];
    
      }
    });

  } );
  
 	// 기존 분야 값 가져오기
  let ele = document.getElementsByClassName("studyRecruitField");
  for ( let i=0; i < ele.length ; i++){
	  if (ele[i].value == '${study.studyRecruitField}') {
		  ele[i].checked = true;
	  }
  }
  
  // 기존 모집여부 가져오기
  let ele2 = document.getElementsByName("studyRecruitEnabled");
  for ( let i = 0; i<ele2.length; i++){
	  if (ele2[i].value == '${study.studyRecruitEnabled}'){
		  ele2[i].checked = true;
	  }
  }

  
  </script>
</body>
</html>

