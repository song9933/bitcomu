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
	<c:param name="msg" value="온라인강의::${ subject}" />
</c:import>
</head>
<body>
   <div class="wrapepr online_cls">
<c:import url="/jsp/include/header.jsp" />
    <!-- 컨텐트 비주얼 -->
    <div class="visual">
<%--       <img src="<c:url value="/resources/images/002(3).jpg" />" alt="온라인강의페이지비주얼"> --%>
		<img src="${pageContext.request.contextPath}/resources/images/002(3).jpg">
      <div class="dot_bg"></div>
      <div class="imgbox">
<%--         <img src="<c:url value="/resources/images/002(3).jpg" />" alt="자바"> --%>
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
          <div class="vid_container clearboth">
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
							<span><%= ++yt_no %></span>
							<div class="ifrInfo">
								<h5>${ ocls.ytTitle }</h5>
								<p>강의시간 36:24</p>
							</div>
						</div>
                	</c:forEach>
                	</c:otherwise>
                </c:choose>
                <!-- <div class="ifrBox">
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
                </div> -->
              </div>
          </div>
          <div class="btn_r">
            <a href="${ pageContext.request.contextPath }/onlineclass/ytwriteform.do?subj=${subject}">강의 등록하기 </a>
          </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

<c:import url="/jsp/include/footer.jsp"/>
    
    

    <!-- 팝업 -->
    <div class="popbg"></div>
    <div class="popup clearboth">
      <div class="pop_l">
        <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" width="100%" height="100%" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
      </div>
      <div class="pop_r">
          <div>
            <dl>
              <dt><i class="fa fa-user-circle" aria-hidden="true"></i></dt>
              <dd>iamteacher</dd>
            </dl>
          </div>
          <div>
            <p>
              #jsp #스프링프레임워크 #Servlet
            </p>
          </div>
          <div class="socialbox">
              <i class="fa fa-heart-o" aria-hidden="true"></i>
              <!-- <i class="fa fa-heart" aria-hidden="true"></i> -->
              <i class="fa fa-comment-o" aria-hidden="true"></i>
              <p>좋아요 44,444개</p>
              <p>2019.09.09</p>

          </div> 
          <div class="comment">
            <textarea style="resize: none" placeholder="댓글 달기..."></textarea>
          </div>

      </div>
    </div>
    <!-- //팝업 끝 -->
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