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
            <div class="w3-container w3-card w3-white w3-round" id="dc_expired_vote">
                <h3>회식 선호날짜 투표(종료) 결과보기</h3>
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                <h4>종료된 투표입니다.</h4>
                <br>
                <div class="w3-panel w3-light-grey" >
                        <h5>회식 선호날짜 투표</h5>
                        <p>선호하는 날짜를 선택해주세요.</p>
                        <br>
                </div>
                
                <!-- 투표결과 -->
                <div class="w3-container w3-card w3-white">
                    <h5>투표 결과</h5>
                    <p>7월 26일</p>
                    <div class="w3-light-grey w3-round-xlarge w3-small">
                      <div class="w3-container w3-center w3-round-xlarge w3-blue" style="width:72%">72%</div>
                    </div>
                    <br>
                    <p>7월 19일</p>
                    <div class="w3-light-grey w3-round-xlarge w3-small">
                      <div class="w3-container w3-center w3-round-xlarge w3-light-blue" style="width:28%">
                        <div class="w3-center w3-text-white">28%</div>
                      </div>
                </div>
                <br>
                <h6>나의 선택 : </h6>
                <br>
                <p>7월 26일</p>
                <br>
               
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