<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="조별게시판" />
</c:import>
</head>

<body>
  <div class="wrapepr">
  <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
      <section class="content">

        <h2 class="title_cws"style="text-align: center">
		<a href="/teamBoardList.do">조별프로젝트 게시판</a></h2>
        <br><br><br><br>
        <div class="tabs_cws">
					<ul  class="projectNo_active_cws">
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1">1 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2">2 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3">3 차</a></li>
					</ul>
				</div>
				<br> <br>

				<div class="subtabs_cws">
					<br>
					<p style="margin-left: 30px;">조 추가/삭제</p>
					<button type="button" onclick="doAdd();"
					style="width: 20px; height: 20px; margin-left: 40px;">+</button>
					
					<button type="button" onclick="doRemove();"
					style="width: 20px; height: 20px;">-</button>
					
					<div class="a_cws">
<!-- 					<form class="teamNo_active_cws"  -->
<%-- 						  action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?teamNo=${teamNo}"> --%>
						<ul id="teamtabs_cws">
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=1">1조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=2">2조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=3">3조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=4">4조</a></li>
						</ul>
<!-- 					</form> -->
					</div>
				</div>



      </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    <div class="background_cws">
    </div>
    <div class="writepopup_cws">
      <form action="${pageContext.request.contextPath}/team/teamBoardList.do">
        <button class="close_cws" style="width:50px; height:50px; 
      background-color: white; opacity: .9; border: none">
      </button>
      </form>
      <br>
      <h1 style="text-align: center">글등록페이지</h1>
      <br>
     <form method='post' action='${pageContext.request.contextPath}/team/teamBoardWrite.do'>
<%--       <input type="hidden" name="projectNo" value="${projectNo}"> --%>
      <input type="hidden" name="userNo" value="${userNo}">
      
      <div>
        <select name="projectNo">
          <option value="1" selected>1차</option>
          <option value="2">2차</option>
          <option value="3">3차</option>
        </select>
      </div>
      
      <div>
        <select name="teamNo">
          <option value="1" selected>1조</option>
          <option value="2">2조</option>
          <option value="3">3조</option>
          <option value="4">4조</option>
          <option value="0">공지</option>
        </select>
      </div>
      <div class="titleboard_cws">
        <input type="text" name="teamBoardTitle" placeholder="제목을 입력하세요" 
        style="width: 100%; border: hidden">
        <br>
        <br>
        <div class="writecontent_cws">
          <textarea name="teamBoardContent" onclick="this.value=''" 
          style="width: 100%; height: 100%; 
          font-size: 16px; text-align: left; 
          padding: 5px; resize: none">내용을 입력하세요.</textarea>
        </div>
        <br>
<!--         <input type="file" style="cursor: pointer; width:180px; float: left; margin-left: -120px" onchange="previewImage(this,'View_area')"> -->
<!--         <input type="image" src="" style="margin-left: 20px;"> -->
        <br>
        <button class="submitbutton_cws" type="submit">등록</button>
      </div>
     </form>
    </div>




  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>

</html>