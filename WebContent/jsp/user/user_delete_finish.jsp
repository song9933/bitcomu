<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="탈퇴완료" />
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
        
        <li class="sj selected">회원 탈퇴</li>
      </ul>
    </div>   
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="#">
      <div class="w1280">
          <section class="content">

          
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-trash" aria-hidden="true"; style="color: #ffa500;"></i>탈퇴완료</span></p>
                

                  <div class="board_box_sj box_detail_sj">
                      <i class="fa fa-check fa-5x" aria-hidden="true" style="color: red; text-align: center"></i>
                  </div>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <div class="board_box_sj box_detail_sj font_size_sj">
                  <c:choose>
                  	<c:when test="${result eq 1}">
                        회원탈퇴가 완료되었습니다.
                  	</c:when>
                  	<c:otherwise>
                  		회원정보가 일치하지 않아 회원탈퇴가 취소되었습니다.
                  	</c:otherwise>
                  </c:choose>
                    </div>

                    <div class="board_box_sj box_detail_sj">
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">홈으로</button><span class="margin_sj"></span>
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

