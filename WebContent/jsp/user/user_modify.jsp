<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원수정" />
</c:import> 

</head>
<body>
   <div class="wrapepr email_wrap">
     <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <div class="tab-box sj">
      <ul class="sj">
      <li class="sj selected">회원정보 수정</li>
      <li class="sj"><a href="${pageContext.request.contextPath}/user/userDeleteForm.do">회원 탈퇴</a></li>
      </ul>
    </div>    
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userUpdate.do">
      <input type="hidden" name="no" value="${sessionScope.user.userNo}">
      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-pencil-square-o" aria-hidden="true"; style="color: #ffa500;"></i>  회원정보 수정</span></p>
                
                  <br/>
                  <strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i> 수정정보 입력</strong>
                  <br/>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td><input type="text"
                          name="id" class="input_box_sj box_join_sj" disabled value="${sessionScope.user.userId}">
                         </td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td> <input type="text"
                          name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요" value="${sessionScope.user.userName}">
                      </tr>
                      <tr>
                        <td>비밀번호</td>
                        <td> <input type="password"
                          name="password" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호를 입력"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요.</td>
                      </tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td> <input type="password"
                          name="passwordRetry" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호를 확인"> * 비밀번호가 일치합니다.</td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                        	<c:forEach var="phoneNum" items="${mobileList}">
                            	<option value="${phoneNum}" <c:if test="${phoneNum eq phone[0]}"> selected </c:if>>${phoneNum}</option>
                        	</c:forEach>
                          </select>-
                          <input type="text"
                          name="userphone2" class="input_box_sj box_phone_sj" value="${phone[1]}">-
                          <input type="text"
                          name="userphone3" class="input_box_sj box_phone_sj" value="${phone[2]}">
                        </td>
                      </tr>
                      <tr>
                        <td>이메일</td>
                        <td> <input type="text"
                          name="email1" class="input_box_sj box_join_sj" disabled value="${email[0]}">@
                          <input type="text"
                          name="email2" class="input_box_sj box_join_sj" disabled value="${email[1]}">
                      </tr>
                      <tr>
                        <td>생년월일</td>  
                        <td>
                        <fmt:formatDate var="userBirth" value="${sessionScope.user.userBirth}" pattern="yyyy-MM-dd"/>
                            <input type="date"
                            name="birth" class="input_box_sj box_join_sj" value="${userBirth}">
                        </td>
                      </tr>  
                </table>
                <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">정보수정</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
  </form>


   <%@include file="/jsp/include/footer.jsp" %>
  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>