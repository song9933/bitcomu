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
            <div class="w3-container w3-card w3-white w3-round" id="dc_radio_vote">
                <h3><공지><익명>26일 회식 참가가능여부</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <div class="w3-panel w3-blue" >
                        <h5>26일 회식 참가가능여부</h5>
                        <p>투표 결과는 익명처리됩니다.</p>
                        <p>참여 미참여 여부를 선택해주세요.</p>
                        <br>
                </div>
                <br>
                <header class="w3-card w3-light-grey dc_expire">마감까지 : 1일 23시간 45분 13초..</header>
                <!-- 라디오 버튼 -->
                <div class="w3-container w3-card w3-white">
                    <form action="/action_page.php">
                      <h3>투표하기</h3>
                      <p>
                      <input class="w3-radio" type="radio" name="option" value="1">
                      <label>참여</label></p>
                      <p>
                      <input class="w3-radio" type="radio" name="option" value="2">
                      <label>미참여</label></p>
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