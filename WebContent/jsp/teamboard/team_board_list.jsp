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

				<h2 class="title_cws" style="text-align: center">
					<a href="./team_board_list.do"> 조별프로젝트 게시판 </a>
				</h2>
				<br> <br> <br> <br>
				<div class="tabs_cws">
					<ul>
						<li class="active"><a href="#">1 차</a></li>
						<li><a href="#">2 차</a></li>
						<li><a href="#">3 차</a></li>
						<li><a href="#">4 차</a></li>
					</ul>
				</div>
				<br> <br>

				<div class="subtabs_cws">
					<br>
					<div class="a_cws">
						<ul>
							<li><a href="#">1조</a></li>
							<li><a href="#">2조</a></li>
							<li class="active"><a href="#">3조</a></li>
							<li><a href="#">4조</a></li>
						</ul>
					</div>
				</div>


				<div class="boardtitle_cws">
					<h2>1조의 진행상황</h2>
				</div>
				<!-- <br> -->
				<!-- <br> -->
				<br> <br>
				<form action="./team_board_write.do">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<input type="image" src="${pageContext.request.contextPath}/resources/images/top_ar.png"
						style="border: 1px solid gray; width: 100px; height: 100px; float: right;">
					<ul>
						<li><a href="./team_board_detail.do"> ▶ 글내용.. </a></li>
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
					<form action="board_team.html">
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