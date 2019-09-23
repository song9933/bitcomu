<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>비트캠프 커뮤니티 | 조별 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>

<body>
	<div class="wrapepr">
		<!-- 헤더 -->
		<div class="w1280">
			<header class="clearboth">
				<h1>
					<a href="/index.html"><img src="img/logo.png" alt="비트컴퓨터로고"></a>
				</h1>
				<ul class="gnb">
					<li><a href="/notice.html">공지</a></li>
					<li><a href="#">커뮤니티</a>
						<ul class="dep2">
							<li><a href="/board_talk.html">자유게시판</a></li>
							<li><a href="/board_team.html">조별게시판</a></li>
							<li><a href="/board_study.html">스터디게시판</a></li>
						</ul></li>
					<li><a href="/qna.html">질문답변</a></li>
					<li><a href="/vote.html">투표</a></li>
					<li><a href="/onlineclass.html">온라인강의</a></li>
				</ul>
				<ul class="nav">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</header>
		</div>
		<!-- // 헤더 끝-->
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