<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<%
int yt_no = 0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="온라인강의" />
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
            <li class="on">전체강의</li>
            <li class="hidden">강의회차정보</li>
          </ul>
          <!-- 전체과목 리스트 div -->
          <div class="subj_container clearboth">
            <div class="subjWrap clearboth">
            <c:choose>
            	<c:when test="${empty sList }">
	            	<h2> 등록된 과목이 없습니다 </h2>
            	</c:when>
            	<c:otherwise>
            	<c:forEach var="subject" items="${ sList }">
            		<div class="ifrBox" onclick="location.href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${ subject.ytSubject }'">
	                  <div class="imgBox">
	                      <img src="https://img.youtube.com/vi/${ subject.ytAddrMod }/0.jpg">
	                  </div>
	                  <span><%= ++yt_no %></span>
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
          <div class="hidden vid_container clearboth">
              <div class="ifrWrap clearboth">
                <div class="ifrBox">
                    <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
                    <span>1</span>
                    <div class="ifrInfo">
                      <h5>Spring Framework 개요 및 특징</h5>
                      <p>강의시간 36:24</p>
                    </div>
                </div>
                <div class="ifrBox">
                    <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
                    <span>1</span>
                    <div class="ifrInfo">
                      <h5>Spring Framework 개요 및 특징</h5>
                      <p>강의시간 36:24</p>
                    </div>
                </div>
                <div class="ifrBox">
                  <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
                  <span>1</span>
                  <div class="ifrInfo">
                    <h5>Spring Framework 개요 및 특징</h5>
                    <p>강의시간 36:24</p>
                  </div>
                </div>
                <div class="ifrBox">
                  <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
                  <span>1</span>
                  <div class="ifrInfo clearboth">
                    <h5>Spring Framework 개요 및 특징</h5>
                    <p>강의시간 36:24</p>
                  </div>
                </div>
              </div>
          </div>
          <c:if test="${sessionScope.user.userGrade eq 3}"> 
	          <div class="btn_r">
	            <a href="${ pageContext.request.contextPath }/onlineclass/ytwriteform.do?subj=${subject}">강의 등록하기 </a>
	          </div>
          </c:if>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

<c:import url="/jsp/include/footer.jsp"/>
  </div>
  <script>
    $(document).ready(function(){
      $('.online_cls .tab li').on('click', function() {
        $(this).toggleClass('on');
        $(this).siblings().toggleClass('on');
      });
    });
    

  </script>
</body>
</html>