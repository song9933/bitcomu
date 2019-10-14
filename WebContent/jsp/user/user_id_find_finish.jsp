<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="아이디찾기완료" />
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
   
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-search" aria-hidden="true"; style="color: #ffa500"></i> 아이디 찾기</span></p>
				  <div class="board_box_sj box_detail_sj">
					  <c:choose>
					  	<c:when test="${empty userId}">
					  		가입된 정보의 회원이 없습니다.
					  	</c:when>
					  	<c:otherwise>
					  		가입된 회원님의 아이디는 ${userId} 입니다.
					  	</c:otherwise>
					  </c:choose>
				  </div>
                  <div class="board_box_sj box_detail_sj">
                    <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">홈으로</button>
                  </div>
              </div>
          </section>
      </div> 
      
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

