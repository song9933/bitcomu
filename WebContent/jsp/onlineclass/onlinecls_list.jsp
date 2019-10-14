<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<%
int yt_no1 = 0;
int yt_no2 = 0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="온라인강의:: ${ subject }" />
</c:import>
</head>
<body>
   <div class="wrapepr online_cls">
<c:import url="/jsp/include/header.jsp" />
    <!-- 컨텐트 비주얼 -->
    <div class="visual">
		<img src="${pageContext.request.contextPath}/resources/images/002(3).jpg">
      <div class="dot_bg"></div>
      <div class="imgbox">
		<img src="${pageContext.request.contextPath}/resources/images/002(3).jpg" />
      </div>
      <div class="detailbox">
        <h2>JAVA 기초 배우기</h2>
        <ul>
          <li>손병찬 강사님</li>
          <li>총 31강</li>
          <li>2019년도 제작</li>
        </ul>
        <p>
            객체 지향 언어인 C++ 언어의 객체 지향적인 장점을 살리면서 분산 환경을 지원하는 JAVA를 공부할 수 있습니다.
        </p>
        <p>
            객체지향프로그래밍 언어로서 C/C++에 비해 간략하고 쉬우며 네트워크 기능의 구현이 용이하기 때문에, 인터넷 환경에서 가장 활발히 사용되는 프로그래밍 언어입니다.
        </p>
      </div>
    </div>
    <!-- 컨텐트 비주얼 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content video clearboth">
          <ul class="tab clearboth">
            <li>전체강의</li>
            <li class="on">강의회차정보</li>
          </ul>
          <!-- 전체과목 리스트 div -->
          <div class="hidden subj_container clearboth">
            <div class="subjWrap clearboth">
            <c:choose>
            	<c:when test="${empty sList }">
	            	<h2> 등록된 과목이 없습니다 </h2>
            	</c:when>
            	<c:otherwise>
            	<c:forEach var="subject" items="${ sList }">
            		<div class="ifrBox" onclick="location.href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${ subject.ytSubject }'">
	                  <div class="imgBox">
	                      <img src="https://img.youtube.com/vi/${ subject.ytAddr }/0.jpg">
	                  </div>
	                  <span><%= ++yt_no1 %></span>
	                  <div class="ifrInfo">
	                    <h5>${ subject.ytSubject }</h5>
	                  </div>
	              </div>
            	</c:forEach>
            	</c:otherwise>
            </c:choose>
            </div>
          </div>
          <!-- 현재 선택한 과목 강의리스트 div -->
          <div class="vid_container clearboth">
          	<div class="divTitle clearboth">
				<p> ${ subject }</p>
				<div class="searchBox">
					<select id="oncls_selType">
						<option value="title" selected>제목</option>
						<option value="content">내용</option>
						<option value="subject">과목</option>
						<option value="titleContent">제목+내용</option>
					</select>
					<button type="button" id="btnSearch"><i class="fa fa-search" aria-hidden="true"></i></button>
					<input type="text" id="keyword" value="${ search.searchWord }" placeholder="검색어를 입력하세요"/>
				</div>				
			</div>
              <div class="ifrWrap clearboth">
                <!--  <iframe src="https://www.youtube.com/embed/KR9nyo8hAdI?playsinline=0&fs=1&rel=0" frameborder="0" allowfullscreen ></iframe> -->
                <c:choose>
                	<c:when test="${ empty list }">
                		<h2>등록된 강의가 없습니다 </h2>
                	</c:when>
                	<c:otherwise>
                	<c:forEach var="ocls" items="${ list }">
 						<div class="ifrBox" onclick="location.href='${pageContext.request.contextPath}/onlineclass/p.do?no=${ ocls.ytNo }&subj=${ocls.ytSubject }'">
<!-- 						<div class="ifrBox"> -->
							<iframe src="https://www.youtube.com/embed/${ ocls.ytAddr }" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
							<span><%= ++yt_no2 %></span>
							<div class="ifrInfo">
								<h5>${ ocls.ytTitle }</h5>
								<p>강의시간 36:24</p>
							</div>
						</div>
                	</c:forEach>
                	</c:otherwise>
                </c:choose>
              </div>
          </div>
          <c:if test="${sessionScope.user.userGrade eq 3}"> 
	          <div class="btn_r">
	            <a href="${ pageContext.request.contextPath }/onlineclass/ytwriteform.do?subj=${subject}">강의 등록하기 </a>
	          </div>
          </c:if>
			<ul class="pagination nams">
				<c:if test="${pr.count != 0}">
					<c:if test="${pr.prev}">
						<li>
							<a href="onlineclsList.do?subj=${subject}&pageNo=${pr.beginPage -1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
						<li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="onlineclsList.do?subj=${subject}&pageNo=${i}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i}</a></li>
					</c:forEach>
					<c:if test="${pr.next}">
						<li>
							<a href="onlineclsList.do?subj=${subject}&pageNo=${pr.endPage + 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</c:if>
			</ul>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

<c:import url="/jsp/include/footer.jsp"/>
  </div>
  <script>
  // 검색을 한번이라도했다면 선택한 옵션으로 초기화한다.
// onclick="location.href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${subject}&pageNo=${pr.beginPage -1}&searchType=${search.searchType}&searchWord=${search.searchWord}'"
  let srchBtn = document.querySelector('#btnSearch');
  let paramUrl = "${pageContext.request.contextPath}";
  let paramSubj = "${ subject }";
  let paramPageNo = "${pr.beginPage -1}";
  let optVal = document.querySelectorAll("#oncls_selType > option");
  for (let i = 0; i < optVal.length; i++) {
	  if(optVal[i].value == '${search.searchType}')
		  optVal[i].selected = true;
  }
  
  srchBtn.addEventListener('click', (e) => {
	  let selEle = document.getElementById('oncls_selType');
	  let inpEle = document.getElementById('keyword');
	  let inpVal = inpEle.value
	  let selVal = selEle.value;
/* 	  for (let i = 0; i < optEle.length; i++) {
	      if (optEle[i].hasAttribute('selected')) {
			selVal = optEle[i].value;
	      }		  
	  } */
	  alert(paramSubj);
	  alert(paramPageNo);
	  alert(inpVal);
	  alert(selVal);
	  srchBtn.setAttribute('onclick', "location.href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj="+ paramSubj +"&searchType="+ selVal +"&searchWord="+ inpVal +"'");
	  srchBtn.click();
  });
  
  
  /* 등록/수정/삭제 결과 alert창 */
  if ('${ resultC }' == 1) {
	  alert('등록되었습니다');
  }
  if ('${ resultU }' == 1) {
	  alert('수정되었습니다');
  }
  if ('${ resultD }' == 1) {
	  alert('삭제되었습니다');
  }
  /* -------------------- */
    $(document).ready(function(){
      $('.online_cls .tab li').on('click', function() {
        $(this).toggleClass('on');
        $(this).siblings().toggleClass('on');
      });
    });
    

  </script>
</body>
</html>