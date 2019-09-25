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
					<a href="board_team.html"> 조별프로젝트 게시판 </a>
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
					<div class="a">
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
				<form action="board_team_write.html">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<input type="image" src="../../resources/images/top_ar.png"
						style="border: 1px solid gray; width: 100px; height: 100px; float: right;">
					<ul>
						<li><a href=""> ▶ 발사믹 진짜 다함 진짜로.. </a></li>
					</ul>
					<br>
					<progress value="20" max="100"></progress>
					<h5>진행률: 20%</h5>
				</div>

				<div>&nbsp;</div>

			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<!-- 푸터 -->
		<footer class="w1280">
			<p>Copyright &copy; 비트캠프 All rights reserved.</p>
		</footer>
		<!--// 푸터 끝-->
		<div class="background_cws"></div>
		<div class="detailpopup_cws">
			<form action="board_team.html">
				<button class="close_cws"
					style="width: 50px; height: 50px; background-color: white; opacity: .9; border: none">
				</button>
			</form>
			<br>
			<h1 style="text-align: center">상세보기</h1>
			<br>
			<div class="detailimage_cws">
				<input type="image" title="&emsp;글에 첨부된 이미지"
					style="width: 600px; height: 300px;">
			</div>
			<div class="detailcontent_cws">
				<h3>작성자</h3>
				<h4 style="float: right; margin-top: -20px; margin-right: 80px;">
					yyyy-MM-dd hh:mm</h4>
				<br>
				<h3>글내용</h3>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
			</div>

			<button class="viewcomment_cws">댓글보기(accordion)</button>
			<form method="post" action="board_team_update.html">
			<button class="updatebutton_cws">수정</button>
			</form>
			<br> <br> <br>
			<div class="team_comment_cws">
				<h3 style="padding: 5px;">첫번째 댓글&emsp;&emsp;&emsp;&emsp; 작성자
					(yyyy-MM-dd hh:mm:ss)</h3>
				<h3 style="float: right; margin-top: -27px; margin-right: 8px;">x</h3>
			</div>
			<div class="team_comment_cws">
				<h3 style="padding: 5px;">두번째 댓글&emsp;&emsp;&emsp;&emsp; 작성자
					(yyyy-MM-dd hh:mm:ss)</h3>
				<h3 style="float: right; margin-top: -27px; margin-right: 8px;">x</h3>
			</div>
		</div>

		<div>
			<form action="board_team_detail.html">
				<button class="movetop_cws"
					style="width: 60px; height: 60px; background-color: #a5a5a5; opacity: .7; border: none">
					<br> <br> <br> <br>
					<h3 style="color: #ffffffe5">맨 위로</h3>
				</button>
			</form>

		</div>
		<script>
			// $(document).ready(alert());
		</script>
</body>

</html>