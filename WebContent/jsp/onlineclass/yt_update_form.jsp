<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="온라인강의 업로드"/>
</c:import>
</head>
<body>
   <div class="wrapepr upload_form">
	<c:import url="/jsp/include/header.jsp" />
    <!-- 컨텐트 비주얼 -->
    <div class="visual">
      <div class="visual">
        <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
      </div>
    </div>
    <!-- 컨텐트 비주얼 끝-->
    <div>
      <!-- width = 1280px 인 컨텐츠영역-->
      <div class="w1280">
          <section class="content new_form clearboth">
            <h2>강의 수정 <span></h2>
            <form action="update.do" method="post">
           	  <input type="hidden" name="ytNo" value="${ oncls.ytNo }"/>
              <div>
                <table>
                  <tr>
                    <th>제목</th>
                    <td>
                      <input type="text" name="yt_title" value="${ oncls.ytTitle }">
                    </td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td>
                      <textarea name="yt_detail" cols="160" rows="10" style="resize: none">${ oncls.ytContent }</textarea>
                    </td>
                  </tr>
                  <tr>
                    <th>영상주소</th>
                    <td>
                      <input type="text" name="yt_addr" value="${ oncls.ytAddr }" readonly> 
                    </td>
                  </tr>
                  <tr>
                    <th>분류</th>
                    <td>
                    <input type="text" name="yt_subject" value="${ subject }" readonly/>
<%-- 
                      <select name="yt_sel" class="yt_sel">
                        <option>과목선택</option>
                        <c:forEach var="subject" items="${ sList }">
                        	<option value="${ subject.ytSubject }">${ subject.ytSubject }</option>
                        </c:forEach>
                        <option>직접입력</option>
                      </select>
	                  <input type="text" name="inp_yt_sel" placeholder="과목 입력" disabled>
<!-- 				  <input type="text" name="inp_yt_sel" placeholder="과목 입력"> -->
--%>                    </td>
                  </tr>
                </table>
              </div>
              <ul class="btn_btm clearboth">
                <li>
                  <a href="#">등록<button></button></a>
                </li>
                <li><a href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${ subject }'>이전</a></li>
              </ul>
            </form>
          </section>
      </div>
      <!-- //width = 1280px 인 컨텐츠영역 끝-->
  </div>

<c:import url="/jsp/include/footer.jsp" />
    </div>
  <script>
    $(document).ready(function() {

    });
  </script>
</body>
</html>

