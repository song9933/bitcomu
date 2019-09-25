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
            <div class="w3-container w3-card w3-white w3-round" id="dc_checkbox_vote">
                <h3><복수선택가능>희망하는 간식 설문</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <div class="w3-panel w3-blue" >
                        <h5>희망하는 간식 설문</h5>
                        <p>희망하는 간식을 골라주세요.</p>
                        <br>
                </div>
                <br>
                <header class="w3-card w3-light-grey dc_expire">마감까지 : 5일 23시간 45분 13초..</header>
                <!-- 라디오 버튼 -->
                <div class="w3-container w3-card w3-white">
                    <form action="/action_page.php">
                      <h3>투표하기</h3>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="1">
                      <label>오뜨</label></p>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="2">
                      <label>모닝롤</label></p>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="3">
                      <label>초코파이</label></p>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="4">
                      <label>화이트하임</label></p>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="5">
                      <label>누네띠네</label></p>
                      <p>
                      <input class="w3-check" type="checkbox" name="option" value="6">
                      <label>마가레트</label></p>
                      <p>
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