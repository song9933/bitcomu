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
        <form id="dc_form_write" class="w3-panel w3-card-4" action="/action_page.php">
          <h3>새 투표 등록하기</h3>

          <p><input class="w3-input" type="text" placeholder="투표제목"></p>
          <br>
          <p><input type="text" name="expired" id="dc_Datepicker" placeholder="마감일 선택" value="마감일선택"></p>
          <br>
          <p><textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.."></textarea></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>
          <p><input class="w3-input" type="text" placeholder="항목을 입력하세요"></p>
          <br>

          <i class="fa fa-plus-square" aria-hidden="true"></i>
          <i class="fa fa-minus-square" aria-hidden="true"></i>

          <p>
            <input class="w3-check" type="checkbox">
            <label>중복투표허용</label></p>
          <p>
            <input class="w3-check" type="checkbox">
            <label>익명투표허용</label></p>
          <br>
          <p><button type="submit" class="w3-btn w3-blue">등록하기</button></p>
          <br>
        </form>
    </div>
    </section>
  </div>
  <!-- //width = 1280px 인 컨텐츠영역 끝-->

  <%@include file="/jsp/include/footer.jsp" %>




  </div>
  <script>
    // $(document).ready(alert());
    $(function () {
      $("#dc_Datepicker").datepicker({
        showOn: "both",
        changeMonth: true,
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true,
        currentText: '오늘 날짜',
        closeText: '닫기',
        dateFormat: "yymmdd",
        changeMonth: true,
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
      });
    });

    $(function () {
      $('.timepicker').timepicker();
    });

  </script>
</body>

</html>