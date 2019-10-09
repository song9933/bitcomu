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
				
				<form action="${pageContext.request.contextPath}/team/teamBoardWriteform.do?projectNo=${projectNo}">
					<button class="writebutton_cws">글등록</button>
				</form>
				<br> <br> <br> <br>
				<div class="board_cws">
					<progress value="20" max="100"></progress>
					<h5>진행률: 20%</h5>
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
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${t.teamBoardRegDt}" />
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
		
		// 조 추가 / 삭제
		let teamTab = document.querySelector("#teamtabs_cws");
		let team = ${codeValue};
		for (let i = 1; i <= team; i++) {
			let liEle = document.createElement("li");
			let aEle = document.createElement("a");
	
			aEle.href = `${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=\${i}`
			let txtNode = document.createTextNode(`\${i}조`);
			aEle.append(txtNode);
			liEle.append(aEle);
			liEle.setAttribute("id", `team\${i}`);
			teamTab.append(liEle);
		}

		function doAdd() {
			let liEle = document.createElement("li");
			let aEle = document.createElement("a");

			team++;
			aEle.href = `${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=\${team}`
			let txtNode = document.createTextNode(`\${team}조`);
			aEle.append(txtNode);
			liEle.append(aEle);
			liEle.setAttribute("id", `team\${team}`);
			teamTab.append(liEle);
		}

		function doDel() {
			console.log(`#team\${team}`);
			let delEle = document.querySelector(`#team\${team}`);
			console.log(delEle);
			delEle.remove();
			team--;

		}
		
		function sendTeam() {
			let inputEle = document.querySelector("#codeValue");
			inputEle.value = team;
			
			let form = document.sendForm;
		    form.submit();
		}

		// 리스트 형식
	</script>
</body>

</html>