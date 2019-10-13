<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원탈퇴" />
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
            <li class="sj"><a href="${pageContext.request.contextPath}/user/userUpdateForm.do">회원정보 수정</a></li>
            <li class="sj selected">회원 탈퇴</li>
        </ul>
    </div>    
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userDelete.do">
    <input type="hidden" name="no" value="${sessionScope.user.userNo}">
      <div class="w1280">
          <section class="content">

          
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-trash" aria-hidden="true"; style="color: #ffa500;"></i> 회원탈퇴</span></p>
                
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <div class="board_box_sj box_detail_sj"><strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i>비밀번호를 입력해 주세요.</strong> <br/><br/>
                    <input type="password"
                    name="password" class="input_box_sj box_default_sj" style="margin:0 auto" placeholder="비밀번호를 입력하세요">
                
                </div>
                <div class="board_box_sj box_detail_sj font_size_sj">
                        탈퇴시에 작성한 게시글, 댓글, 좋아요, 파일 등의<br><br>  업로드 된 글은 전부삭제 됩니다.<br/><br/>
                        삭제하신 정보는 복구가 불가능합니다.<br/><br/>
                        동의 하신다면 탈퇴완료를 눌러주세요.<br/>
                </div>
                  <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">탈퇴완료</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">탈퇴취소</button>
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

