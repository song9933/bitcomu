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
					<ul  class="projectNo_active_cws">
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1">1 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2">2 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3">3 차</a></li>
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
						<ul id="teamtabs_cws">
						
						</ul>
<!-- 					</form> -->
					</div>
				</div>


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
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${teamBoard.projectNo}&teamNo=${teamBoard.teamNo}">
        		<button class="close_cws" style="width:50px; height:50px; 
                    opacity: .9; border: none; font-size: 40px;">
      			</button>
      		</form>
			<br>
			<h1 style="text-align: center">수정페이지</h1>
			<br>
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardUpdate.do"
					onsubmit="return updateConfirm()">
				<div>
					<select name="projectNo" id="projectNo" style="margin-left: 28px">
						<option value="1">1차</option>
						<option value="2">2차</option>
						<option value="3">3차</option>
					</select>
					<select name="teamNo" id="teamNo">
					</select>
				</div>
				<div class="updatetitleboard_cws">
				<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}">
					<input type="text" name="teamBoardTitle" id="teamBoardTitle" value="${teamBoard.teamBoardTitle}"
						style="width: 100%; border: hidden"> <br> <br>
					<div class="writecontent_cws">
						<textarea name="teamBoardContent" id="teamBoardContent"
							style="width: 100%; height: 100%; font-size: 16px; text-align: left; padding: 5px; 
								resize: none">${teamBoard.teamBoardContent}</textarea>
					</div>
					<br>
<!-- 					<div class="alreadyfile_cws"> -->
<!-- 						<a>첨부된 파일 &emsp;<input type="text" style="border: none" -->
<!-- 							value="aaa.css"> <br> -->
<!-- 							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="text" -->
<!-- 							style="border: none" value="ac8.html"></a> -->
<!-- 					</div> -->
<!-- 					<div class="alreadyimage_cws"> -->
<!-- 						<a>첨부된 이미지 &emsp;<input type="image"></a> -->
<!-- 					</div> -->
<!-- 					<br> <input type="file" name="작성된 파일" -->
<!-- 						style="cursor: pointer; width: 180px; float: left; margin-left: -120px" -->
<!-- 						onchange="previewImage(this,'View_area')"> <input -->
<!-- 						type="image" src="" style="margin-left: 20px;"> <br> -->
					<button class="updatesubmit_cws">수정완료</button>
				</div>
			</form>
		</div>

	</div>
	<script>
		// $(document).ready(alert());
		function updateConfirm(){
  		if (document.querySelector("#teamBoardTitle").value.trim().length == 0){
  			alert("제목을 입력하세요");
  			return false;
  		}
  		if (document.querySelector("#teamBoardContent").value.trim().length == 0){
  			alert("내용을 입력하세요");
  			return false;
  		}
  		if (document.querySelector("#teamBoardTitle").value.length > 66){
  	  		alert("제목은 66자리를 초과할 수 없습니다.");
  	  		return false;
  	  	}
  	  	if (document.querySelector("#teamBoardContent").value.length > 666){
  	  		alert("내용은 666자리를 초과할 수 없습니다.");
  	  		return false;
  	  	}
  	}
		
		 // 조 갯수
		let teamTab = document.querySelector("#teamtabs_cws");
		let team = ${codeValue};
		for (let i = 1; i <= team; i++) {
			let liEle = document.createElement("li");
			let aEle = document.createElement("a");
			
			let txtNode = document.createTextNode(`\${i}조`);
			aEle.append(txtNode);
			liEle.append(aEle);
			liEle.setAttribute("id", `team\${i}`);
			teamTab.append(liEle);
		}
			
	  	// select박스에 추가/삭제한 팀 번호 보여주기
		let teamNo = document.querySelector("#teamNo");
		for (let i = 1; i <= team; i++) {
			let opEle = document.createElement("option");
			opEle.value = `\${i}`;
			let tNode = document.createTextNode(`\${i}조`);
			opEle.append(tNode);
			teamNo.append(opEle);
		}
		// 작성된 글의 프로젝트 번호 보여주기
		let proNo = document.querySelectorAll("#projectNo > option");
		for (let i = 0; i < proNo.length; i++) {
			if (proNo[i].value == `${teamBoard.projectNo}`)
				proNo[i].setAttribute("selected", true);
		}

		// 작성된 글의 팀 번호 보여주기
		let tNo = document.querySelectorAll("#teamNo > option");
		for (let i = 0; i < tNo.length; i++) {
			if (tNo[i].value == ${teamBoard.teamNo})
				tNo[i].setAttribute("selected", true);
	}
		
	</script>
	<script>
		let str = document.getElementById("teamBoardContent").value;
		str = replaceAll(str,'<br>',"\r\n");
		document.getElementById("teamBoardContent").innerHTML = str;
		
		function replaceAll(str, searchStr, replaceStr) {
		  return str.split(searchStr).join(replaceStr);
		}
	</script>
</body>

</html>