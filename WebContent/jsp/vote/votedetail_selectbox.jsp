<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="투표글쓰기" />
</c:import>
</head>

<body>
  <div class="wrapepr">
   <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
      <section class="content dc_section">
            <div class="w3-container w3-card w3-white w3-round" id="dc_selectbox_vote">
                <h3><공지><익명>반장 선출 투표</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <div class="w3-panel w3-blue" >
                        <h5>반장 선출 투표</h5>
                        <p>투표 결과는 익명처리됩니다.</p>
                        <p>뽑고싶은 사람 이름을 선택하세요.</p>
                        <br>
                </div>
                <script>
                  
                </script>
                <!-- 셀렉트박스 -->
                <div class="w3-container w3-card w3-white">
                    <form action="/action_page.php">
                      <h3>투표하기</h3>
                    
                      <select class="w3-select" name="option">
                        <option value="" disabled selected>선택해 주세요..</option>
                        <option value="1">유승재</option>
                        <option value="2">박남수</option>
                        <option value="3">임진산</option>
                        <option value="4">최우석</option>
                        <option value="5">오동훈</option>
                        <option value="6">신용환</option>
                      </select>
                      <br>
                      <br>
                      <br>
                    </form>

                </div>
                <br>
                <p><button type="submit" class="w3-btn w3-green">투표하기</button></p>
               
                </div>


           
    </section>
  </div>
  <!-- //width = 1280px 인 컨텐츠영역 끝-->

 <%@include file="/jsp/include/footer.jsp" %>




  </div>
  <script>
    // $(document).ready(alert());

  </script>
</body>

</html>