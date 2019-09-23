<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
 <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원가입완료" />
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
        <span class="inline_sub_top_sj"><i class="fa fa-user-plus" aria-hidden="true">개인정보입력</i></span>
        <span class="inline_sub_top_sj selected"><i class="fa fa-lock" aria-hidden="true">가입완료</i></span>
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">

          
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-lock" aria-hidden="true" style="color: #ffa500;"></i>가입완료</span></p>
                  <div class="board_box_sj box_detail_sj">
                      <i class="fa fa-check fa-5x" aria-hidden="true" style="color: red; text-align: center"></i>
                  </div>
                  <div class="board_box_sj box_detail_sj font_size_sj">
                        <strong>축하합니다!</strong><br/><br/>
                        회원가입이 완료되었습니다.
                    </div>

                    <div class="board_box_sj box_detail_sj">
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/user/userLoginForm.do')"  class="button_box_sj box_email_sj">로그인</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">홈으로</button>
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

