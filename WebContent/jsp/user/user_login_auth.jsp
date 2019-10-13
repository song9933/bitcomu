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
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">

          
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-lock" aria-hidden="true" style="color: #ffa500;"></i>로그인이 필요합니다.</span></p>
                  <div class="board_box_sj box_detail_sj">
                      <i class="fa fa-lock fa-5x" aria-hidden="true" style="color: red; text-align: center"></i>
                  </div>
                  <div class="board_box_sj box_detail_sj font_size_sj">
                        <strong>로그인이 필요합니다.</strong><br/><br/>
                        로그인 후 게시판 이용이 가능합니다.
                    </div>

                    <div class="board_box_sj box_detail_sj">
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

