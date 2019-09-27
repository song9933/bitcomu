<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="비밀번호찾기" />
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
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-search" aria-hidden="true"; style="color: #ffa500"></i> 비밀번호 찾기</span></p>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td> <input type="text"
                          name="name" class="input_box_sj box_join_sj" placeholder="가입시의 아이디 입력"> * 회원가입 시의 아이디를 입력해 주세요. </td>
                      </tr>
                        <tr>
                              <td>이메일</td>
                              <td>  <input type="text"
                            name="email1" class="input_box_sj box_join_sj">@
                            <input type="text"
                     		name="email2" class="input_box_sj box_join_sj"><button type="button" class="button_box_sj">전송</button></td>
                              </tr>
                        <tr>
                          <td>인증번호</td>
                          <td> <input type="password"
                            name="password" class="input_box_sj box_default_sj" placeholder="이메일에서 받은 인증번호를 입력해 주세요."> </td>
                        </tr>
                        <tr>
                          <td>변경할 비밀번호</td>
                          <td> <input type="password"
                            name="password" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요. </td>
                        </tr>
                        <tr>
                          <td>변경할 비밀번호 확인</td>
                          <td> <input type="password"
                            name="passwordRetry" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호 확인"> * 비밀번호가 일치합니다.</td>
                        </tr>

                  </table>
                  <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">비밀번호수정</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
  </form>
	<%@include file="/jsp/include/footer.jsp" %>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

