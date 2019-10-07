<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="조별게시판" />
</c:import>
<style>
#team_comment_cws {
	margin-left: 15px;
	width: 90%;
	box-sizing: border-box;
	position: relative;
 	transition: 1s;
	overflow: hidden;
}

.hidden {
	height: 0px;
	opacity: 0;
}

.show {
	height: auto;
	opacity: 1;
}

.updatebutton_cws {
	background: none;
	border: none;
	color: #75a5d6;
	width: 90px;
	height: 30px;
	font-size: 20px;
	margin-top: -35px;
	float: right;
	cursor: pointer;
}

#cmt_menu_cws {
	width: 300px;
}

#cmt_menu_cws > td {
	border: 1px solid black;
}

</style>
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">

				<h2 class="title_cws" style="text-align: center">
					<a href="/teamBoardList.do"> 조별프로젝트 게시판 </a>
				</h2>
				<br> <br> <br> <br>
				<div class="tabs_cws">
					<ul class="projectNo_active_cws">
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1">1차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2">2차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3">3차</a></li>
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
					<h2>1조의 진행상황</h2>
				</div>
				<!-- <br> -->
				<!-- <br> -->
				<br> <br>
				<form action="/team/teamBoardWrite.do">
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
								style="font-size: 40px"> ${t.teamBoardTitle} </a></li>
							<br>
							<li>
								<h6 style="margin: 0 auto">작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${t.teamBoardRegDt}" />
								</h6>
							</li>
						</c:forEach>
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
			<form
				action="${pageContext.request.contextPath}/team/teamBoardList.do">
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
					<h3 style="word-break:break-all;">제목 : ${teamBoard.teamBoardTitle}</h3>
					<br>
					<h3>작성자 : ${teamBoard.userId}</h3>
					<h4 style="float: right; margin-top: -20px; margin-right: 80px;">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${teamBoard.teamBoardRegDt}" />
					</h4>
					<br>
					<h3>글내용: ${teamBoard.teamBoardContent}</h3>
				<br> <br> <br> <br> <br> <br> <br><br> <br> <br>
			</div>

			<button class="viewcomment_cws" onclick="viewComment()">댓글보기</button>
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardUpdateform.do">
				<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}"/>
				<button class="updatebutton_cws">수정</button>
			</form>
			<br> <br> 
<!-- 			<br> -->


			<form method="post" action="${pageContext.request.contextPath}/team/teamCommentWrite.do">
				<p>▶
				<input type="text" name="cmtContent" placeholder="댓글을 입력하세요" style="width: 450px;">
				<input type="hidden"name="teamBoardNo" value="${teamBoard.teamBoardNo}">
				<input type="hidden" name="userNo" value="${userNo}">
				<button>등록</button>
				</p>
			</form>
			<br>
			<div id="team_comment_cws">
<!-- 				<div> -->
<!-- 					<table style="width: 100%"> -->
<!-- 						<tr id="cmt_menu_cws"> -->
<!-- 							<td width="15%">작성자</td> -->
<!-- 							<td width="70%">내용</td> -->
<!-- 							<td>작성일</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->
				<form method="post" action="teamCommentUpdate.do">
					<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}" />
					<input type="hidden" name="cmtNo" value="${param.cmtNo}" />	
					<c:forEach var="t" items="${teamCmt}">
					<div style="border: 1px solid black; padding: 5px; height: 40px;">
						<ul>
						<c:choose>
							<c:when test="${param.cmtNo eq t.cmtNo}">
								<li style="float: left;">${t.userId}</li>
								<li style="float: left; margin-left:30px;">
									<input type="text" name="cmtContent" value="${t.cmtContent}"/>
								</li>
								<li>
									<a href="teamBoardDetail.do?teamBoardNo=${t.boardPostNo}" style="float: right;">취소</a>
									<input type="submit" style="float: right;" value="수정" />
								</li>
							</c:when>
								<c:otherwise>
									<li style="width: 15%;">${t.userId}</li>
									<li style="width: 70%">${t.cmtContent}</li>
									<li
										style="float: right; position: relative; margin-top: -25px">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${t.cmtRegDt}" />
									</li>
									<li style="float: right; position: relative;"><c:if
											test="${sessionScope.user.userNo eq t.userNo}">
											<a onclick="viewComment()" href="${pageContext.request.contextPath}/team/teamBoardDetail.do?cmtNo=${t.cmtNo}&teamBoardNo=${t.boardPostNo}">수정</a>
											<a href="${pageContext.request.contextPath}/team/teamCommentDelete.do?cmtNo=${t.cmtNo}&teamBoardNo=${t.boardPostNo}">삭제</a>
										</c:if></li>

								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- <h3 style="float: right; margin-top: -27px; margin-right: 8px;">x</h3> -->
				</c:forEach>
				</form>
			</div>
		</div>

		<div>
			<form action="/team/teamBoardDetail.do?cmtNo=${cmtNo}&teamBoardNo=${teamBoardNo}">
				<button class="movetop_cws"
					style="width: 60px; height: 60px; background-color: #a5a5a5; opacity: .7; border: none">
					<br> <br> <br> <br>
					<h3 style="color: #ffffffe5">맨 위로</h3>
				</button>
			</form>

		</div>	
	</div>
	<script>
		// $(document).ready(alert());
// 		let accordion = document.querySelector(".viewcomment_cws");
// 		accordion.addEventListener('click', function viewComment() {
		document.querySelector("#team_comment_cws").className = "hidden";
		function viewComment() {
				let commentEle = document.querySelector("#team_comment_cws");
				commentEle.classList.toggle("hidden");
				commentEle.classList.toggle("show");
		}
		// 		});
	</script>
</body>

</html>