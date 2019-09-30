<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="조별게시판" />
</c:import>
<style>
.projectNo_active_cws {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #0f5399;
	/* margin-top: -4px;
	padding-top: 10px; */
}
.teamNo_active_cws {
    border-color: #cccccca6;
	color: #0f5399;
    margin-top: 40px;
	margin-bottom: 40px;
	transform: scale(1.2);
	transition-duration: 0.3s;
    transition-timing-function: linear;
}
div.a_cws {
	border-top: 5px solid #0f5399;
	border-bottom: 5px solid #0f5399;
	padding: 10px;
 	padding-top: 60px; 
	padding-bottom: 70px;
	width: 120px;
	position: absolute;
}
.board_cws {
	border: 1px solid lightgray;
	width: 700px;
	font-size: 20px;
	padding: 20px;
	float: left;
	margin-left: 290px;
	border-radius: 15px;

}
.boardtitle_cws {
	width: 1000px;
	float: left; 
	padding: 20px;
	/* border: 1px solid lightgray; */
	margin: 0 auto;
	margin-left: 150px;
}
</style>
</head>

<body>
	<div class="wrapepr">
	<c:import url="/jsp/include/header.jsp"/>
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">

				<h2 class="title_cws" style="text-align: center">
					<a href="teamBoardList.do"> 조별프로젝트 게시판 </a>
				</h2>
				<br> <br> <br> <br>
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
					<div class="a_cws">
<!-- 					<form class="teamNo_active_cws"  -->
<%-- 						  action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?teamNo=${teamNo}"> --%>
						<ul>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=1">1조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=2">2조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=3">3조</a></li>
							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=4">4조</a></li>
						</ul>
<!-- 					</form> -->
					</div>
				</div>


				<div class="boardtitle_cws">
					<h2 style="margin: 0 auto">${teamNo}조의 진행상황</h2>
				</div>
				<br> <br>
				
				<form action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?projectNo=${projectNo}">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<input type="image" src="${pageContext.request.contextPath}/resources/images/top_ar.png"
						style="border: 1px solid gray; width: 100px; height: 130px; float: right;">
					<ul>
						<c:forEach var="t" items="${list}">
						<li>
							<a href="${pageContext.request.contextPath}/team/teamBoardDetail.do?teamBoardNo=${t.teamBoardNo}"
							style="font-size: 40px"> ${t.teamBoardTitle}</a></li>
						<br>
						<li>
							<h6 style="margin: 0 auto">작성자: ${t.userId}</h6>
						</li>
						<li>
							<h6 style="margin: 0 auto">작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${t.teamBoardRegDt}" /></h6>
						</li>
						</c:forEach>
					</ul>
					<br>
					<progress value="20" max="100"></progress>
					<h5>진행률: 20%</h5>
				</div>

				<div>&nbsp;</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br>

				<div>
					<form action="${pageContext.request.contextPath}/team/teamBoardList.do">
						<button class="movetop_cws"
							style="width: 60px; height: 60px; background-color: white; opacity: .9; border: none">
							<br> <br> <br> <br>
							<h3 style="color: #9c9b9b">맨 위로</h3>
						</button>
					</form>
				</div>


			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<!-- 푸터 -->
		<footer class="w1280">
			<p>Copyright &copy; 비트캠프 All rights reserved.</p>
		</footer>
		<!--// 푸터 끝-->



	</div>
	<script>
		// $(document).ready(alert());
	</script>
</body>

</html>