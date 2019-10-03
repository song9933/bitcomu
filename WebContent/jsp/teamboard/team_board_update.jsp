<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="조별게시판" />
</c:import>
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">

				<h2 class="title_cws" style="text-align: center">
					<a href="teamBoardList.do"> 조별프로젝트 게시판 </a>
				</h2>
				<br> <br> <br> <br>
				<div class="tabs_cws">
					<ul class="projectNo_active_cws">
						<li><a
							href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1">1차</a></li>
						<li><a
							href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2">2차</a></li>
						<li><a
							href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3">3차</a></li>
					</ul>
				</div>
				<br> <br>

				<div class="subtabs_cws">
					<br>
					<div class="a_cws">
						<!-- 					<form class="teamNo_active_cws"  -->
						<%-- 						  action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?teamNo=${teamNo}"> --%>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=1">1조</a></li>
							<li><a
								href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=2">2조</a></li>
							<li><a
								href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=3">3조</a></li>
							<li><a
								href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=4">4조</a></li>
						</ul>
						<!-- 					</form> -->
					</div>
				</div>


				<div class="boardtitle_cws">
					<h2 style="margin: 0 auto">${teamNo}조의진행상황</h2>
				</div>
				<br> <br>

				<form action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?projectNo=${projectNo}">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<input type="image"
						src="${pageContext.request.contextPath}/resources/images/top_ar.png"
						style="border: 1px solid gray; width: 100px; height: 130px; float: right;">
					<ul>
						<c:forEach var="t" items="${list}">
							<li><a
								href="${pageContext.request.contextPath}/team/teamBoardDetail.do?teamBoardNo=${t.teamBoardNo}"
								style="font-size: 40px"> ${t.teamBoardTitle}</a></li>
							<br>
							<li>
								<h6 style="margin: 0 auto">작성자: ${t.userId}</h6>
							</li>
							<li>
								<h6 style="margin: 0 auto">
									작성일:
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${t.teamBoardRegDt}" />
								</h6>
							</li>
							<br>
							<p>--------------------------------------------------------------------</p>
							<br>
						</c:forEach>
					</ul>
					<br>
					<progress value="20" max="100"></progress>
					<h5>진행률: 20%</h5>
					<br>
				</div>

				<div>&nbsp;</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br>

			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<!-- 푸터 -->
		<footer class="w1280">
			<p>Copyright &copy; 비트캠프 All rights reserved.</p>
		</footer>
		<!--// 푸터 끝-->
		<div class="background_cws"></div>
		<div class="updatepopup_cws">
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do">
				<button class="close_cws"
					style="width: 50px; height: 50px; background-color: white; opacity: .9; border: none">
				</button>
			</form>
			<br>
			<h1 style="text-align: center">수정페이지</h1>
			<br>
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardUpdate.do">
				<div>
					<select name="projectNo" id="projectNo">
						<option value="1">1차</option>
						<option value="2">2차</option>
						<option value="3">3차</option>
					</select>
				</div>

				<div>
					<select name="teamNo" id="teamNo">
						<option value="1">1조</option>
						<option value="2">2조</option>
						<option value="3">3조</option>
						<option value="4">4조</option>
						<option value="0">공지</option>
					</select>
				</div>
				<div class="updatetitleboard_cws">
				<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}">
					<input type="text" name="teamBoardTitle" value="${teamBoard.teamBoardTitle}"
							 placeholder="${teamBoard.teamBoardTitle}"
						style="width: 100%; border: hidden"> <br> <br>
					<div class="writecontent_cws">
						<textarea name="teamBoardContent"
							style="width: 100%; height: 100%; font-size: 16px; text-align: left; padding: 5px; resize: none">
						${teamBoard.teamBoardContent}</textarea>
					</div>
					<br>
					<div class="alreadyfile_cws">
						<a>첨부된 파일 &emsp;<input type="text" style="border: none"
							value="aaa.css"> <br>
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="text"
							style="border: none" value="ac8.html"></a>
					</div>
					<div class="alreadyimage_cws">
						<a>첨부된 이미지 &emsp;<input type="image"></a>
					</div>
					<br> <input type="file" name="작성된 파일"
						style="cursor: pointer; width: 180px; float: left; margin-left: -120px"
						onchange="previewImage(this,'View_area')"> <input
						type="image" src="" style="margin-left: 20px;"> <br>
					<button class="updatesubmit_cws">수정완료</button>
				</div>
			</form>
		</div>

	</div>
	<script>
		// $(document).ready(alert());
		// 작성된 글의 프로젝트 번호 보여주기
		let proNo = document.querySelectorAll("#projectNo > option");
		for (let i = 0; i < proNo.length; i++) {
			if (proNo[i].value == `${teamBoard.projectNo}`)
				proNo[i].selected = true;
		}

		// 작성된 글의 팀 번호 보여주기
		let teamNo = document.querySelectorAll("#teamNo > option");
		for (let i = 0; i < teamNo.length; i++) {
			if (teamNo[i].value == `${teamBoard.teamNo}`)
				teamNo[i].selected = true;
		}
	</script>
</body>

</html>