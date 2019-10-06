<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="아이디찾기" />
</c:import> 

</head>
<body>
   <div class="wrapepr email_wrap">
    <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userIdFind.do">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-search" aria-hidden="true"; style="color: #ffa500"></i> 아이디 찾기</span></p>
                  <table class="type02_sj">
                        <tr>
                          <td>가입된 전화번호</td>
                          <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                            <c:forEach var="phoneNum" items="${mobileList}">
                            	<option value="${phoneNum.codeName}">${phoneNum.codeName}</option>
                        	</c:forEach>
                            </select>-
                            <input type="text"
                            name="userphone2" class="input_box_sj box_phone_sj">-
                            <input type="text"
                            name="userphone3" class="input_box_sj box_phone_sj">
                          </td>
                        </tr>
                        <tr>
                            <td>가입된 이메일</td>
                          <td> <input type="text"
                            name="email1" class="input_box_sj box_join_sj">@
                            <input type="text"
                     		name="email2" class="input_box_sj box_join_sj"></td>
                        </tr>
                        <tr>
                            <td>가입된 이름</td>
                            <td> <input type="text"
                                name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요">
                        </tr>
                  </table>
                  <div class="board_box_sj box_detail_sj">
                    <button type="submit" class="button_box_sj box_email_sj">아이디찾기</button><span class="margin_sj"></span>
                    <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                  </div>
              </div>
          </section>
      </div> 
      
  </form>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <!-- width= 100%인 컨텐츠 영역-->
    <div class="video">
      <div class="w1280 mt100">

      </div>

    </div>
    <%@include file="/jsp/include/footer.jsp" %>
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

