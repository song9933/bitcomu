<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원가입" />
</c:import> 
</head>
<body>
   <div class="wrapepr email_wrap">
    <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <div class="board_box_sj sub_top_sj">
        <span class="inline_sub_top_sj"><i class="fa fa-check-square-o" aria-hidden="true">약관동의</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-envelope" aria-hidden="true">이메일 인증</i></span>
        <span class="inline_sub_top_sj selected"><i class="fa fa-user-plus" aria-hidden="true">개인정보입력</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-lock" aria-hidden="true">가입완료</i></span>
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userJoin.do">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-user-plus" aria-hidden="true" style="color: #ffa500;"></i> 회원가입</span></p>
                
                  <br/>
                  <strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i> 기본정보 입력</strong>
                  <br/>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td><input type="text"
                          name="id" class="input_box_sj box_join_sj" placeholder="아이디를 입력하세요.">
                          <button type="button" class="button_box_sj">중복확인</button>
                        </td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td><input type="text"
                          name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요.">
                      </tr>
                      <tr>
                        <td>비밀번호</td>
                        <td> <input type="password"
                          name="password" class="input_box_sj box_join_sj" placeholder="비밀번호를 입력하세요"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요.</td>
                      </tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td> <input type="password"
                          name="passwordRetry" class="input_box_sj box_join_sj" placeholder="비밀번호를 확인"> * 비밀번호가 일치합니다.</td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                        	<c:forEach var="phoneNum" items="${mobileList}">
                            <option value="${phoneNum}">${phoneNum}</option>
                        	</c:forEach>
                          </select>-
                          <input type="text"
                          name="userphone2" class="input_box_sj box_phone_sj">-
                          <input type="text"
                          name="userphone3" class="input_box_sj box_phone_sj">
                        </td>
                      </tr>
                      <tr>
                          <td>이메일</td>
                          <td> <input type="text"
                            name="email1" class="input_box_sj box_join_sj">@
                            <input type="text"
                     name="email2" class="input_box_sj box_join_sj">
                        </tr>
                      <tr>
                        <td>생년월일</td>  
                        <td>
                            <input type="date"
                            name="birth" class="input_box_sj box_join_sj" >
                        </td>
                      </tr>
                </table>
                <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">회원가입</button><span class="margin_sj"></span>
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

