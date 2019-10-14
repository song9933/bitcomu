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
					<c:if test="${sessionScope.user.userGrade eq 3}">
					<form method="post" name="sendForm" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}">
						<input type='hidden' id="codeValue" name="codeValue" value="${codeValue}">
						
						<p style="margin-left: 30px;">조 추가/삭제</p>
						<button type="button" onclick="doAdd();"
							style="width: 20px; height: 20px; margin-left: 40px;">+</button>
					
						<button type="button" onclick="doDel();"
							style="width: 20px; height: 20px;">-</button>
					 
<!-- 						<button type="submit">저장</button> -->
						<button type="button" onclick="sendTeam();">저장</button>
					</form>
					</c:if>
					
					<div class="a_cws">
<!-- 					<form class="teamNo_active_cws"  -->
<%-- 						   --%>
						<ul id="teamtabs_cws">
<%-- 							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=1">1조</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=3">3조</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=4">4조</a></li> --%>
						</ul>
<!-- 					</form> -->
					</div>
				</div>


				<div class="boardtitle_cws">
					<h2 style="margin: 0 auto">${teamNo}조의 진행상황</h2>
				</div>
				<br> <br>
				
				<form method="post" action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?projectNo=${projectNo}&teamNo=${teamNo}">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<br>
					<ul id="boardList_cws">
						<c:forEach var="t" items="${list}">
							<li><input type="image"
								src="${pageContext.request.contextPath}/resources/images/top_ar.png"
								style="border: 1px solid gray; width: 100px; height: 130px; float: right;">
							</li>
							<li style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a
								href="${pageContext.request.contextPath}/team/teamBoardDetail.do?teamBoardNo=${t.teamBoardNo}"
								style="font-size: 40px; "> ${t.teamBoardTitle}</a></li>
							<br>
							<li>
								<h6 style="margin: 0 auto">작성자: ${t.userId}</h6>
							</li>
							<li>
								<h6 style="margin: 0 auto">
									작성일:
									${t.teamBoardRegDt} />
								</h6>
							</li>
							<c:if test="${sessionScope.user.userNo eq t.userNo or sessionScope.user.userGrade eq 3}">
								<form method="post" action="${pageContext.request.contextPath}/team/teamBoardDelete.do">
									<input type="hidden" name="teamBoardNo" value="${t.teamBoardNo}"/>
									<button>X</button>
								</form>
							</c:if>
							<br>
							<br>
							<hr>
<!-- 							<p>----------------------------------------------------------------------------------------------------</p> -->
							<br>
						</c:forEach>
					</ul>
					<br>
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
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${teamBoard.projectNo}&teamNo=${teamBoard.teamNo}">
        		<button class="close_cws" style="width:50px; height:50px; 
      				background-color: white; opacity: .9; border: none">
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
					<h4 style="float: right; margin-top: -20px; margin-right: 80px;">
					${teamBoard.teamBoardRegDt}
					</h4>
					<br>
					<h3>작성자 : ${teamBoard.userId}</h3>
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
				<form method="post" action="teamCommentUpdate.do">
					<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}" />
					<input type="hidden" name="cmtNo" value="${param.cmtNo}" />	
<%-- 					<c:forEach var="t" items="${teamCmt}"> --%>
						<div id="commentList_cws" >
<!-- 						<h5>asdfasdfasd</h5> -->
						<!-- function makeCommentList(list) 생성부분 -->
						</div>
<%-- 					</c:forEach> --%>
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
// 	댓글 아코디언
		document.querySelector("#team_comment_cws").className = "hidden";
		function viewComment() {
				let commentEle = document.querySelector("#team_comment_cws");
				commentEle.classList.toggle("hidden");
				commentEle.classList.toggle("show");
		}
		
// 	댓글 ===========================================

//  댓글 목록 가져오는 Ajax
let teamBoardNo = ${teamBoard.teamBoardNo};
// let cmtNo = ${cmtNo};
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list = JSON.parse(xhr.responseText);
				makeCommentList(list);
			}
		}
	};
	xhr.open("GET", "teamBoardDetail_ajax.do?teamBoardNo=" + teamBoardNo, true);
	xhr.send();
}
commentListAjax();

function makeCommentList(list) {
	let commentList = document.getElementById("commentList_cws");
	let html = "<div>";
	for (let i = 0; i < list.length; i++) {
		let comment = list[i];
		console.log(comment);
				
		let cList = document.createElement("span");
		cList.innerHTML = "";
		if ('${sessionScope.user.userNo}' == comment.userNo || '${sessionScope.user.userGrade}' == 3){
			cList.innerHTML = 	
				`<a href="${pageContext.request.contextPath}/team/teamBoardDetail.do?cmtNo=${comment.cmtNo}&teamBoardNo=${comment.boardPostNo}">수정</a>
            	 <a href="${pageContext.request.contextPath}/team/teamCommentDelete.do?cmtNo=${comment.cmtNo}&teamBoardNo=${comment.boardPostNo}">삭제</a>
		`};
		html += `
			<ul style="border: 1px solid black;">
				<li style="width: 15%;">\${comment.userId}</li>
	            <li style="width: 70%">\${comment.cmtContent}</li>
	            <li
	                style="float: right; position: relative; margin-top: -45px;">
	                \${comment.cmtRegDt}
	            </li>
	            <li style="float: right; position: relative; margin-top: -25px;}">
	            \${cList.innerHTML}
	            </li>
			</ul>
	    	`;
	}
	html += "</div>";
	commentList.innerHTML = html;
}
	</script>
</body>

</html>