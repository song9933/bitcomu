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
	margin-bottom: 30px;
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
<a href="#" id="teamList-scroll" style="display: none;"><span></span></a>
	<div class="wrapepr">
	<c:import url="/jsp/include/header.jsp"/>
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content clearboth">

				<h2 class="title_cws" style="text-align: center">
					<a href="teamBoardList.do"> 조별프로젝트 게시판 </a>
				</h2>
				<br> <br> <br> <br>
				<div class="tabs_cws">
					<ul  class="projectNo_active_cws">
						<li><a class="active" href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1&teamNo=1">1 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2&teamNo=1">2 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3&teamNo=1">3 차</a></li>
					</ul>
				</div>
				<br> 
				<br> 
				<h3 style="margin-left: 300px;">${projectNo}차 프로젝트&nbsp; > &nbsp;${teamNo}조</h3>
				<br>

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
<!-- 				<div class="board_cws"> -->
					<br>
					<div id="boardList_cws">
						<!-- ajax 활용한 list출력 -->
					</div>
				
<!-- 				<div> -->
<%-- 					<form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=${teamNo}"> --%>
<!-- 						<button class="movetop_cws" style="background-color: #f9f9f9; color: #a4a3a3;"> -->
<!-- 						<i class="fa fa-arrow-up fa-3x" aria-hidden="true"></i> -->
<!-- 							<br> <br>  -->
<!-- 							<h3 style="color: #a4a3a3">맨 위로</h3> -->
<!-- 						</button> -->
<!-- 					</form> -->
<!-- 				</div> -->
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
		
		// back to top
	   $(document).ready(function(){ 
	    $(window).scroll(function(){ 
	        if ($(this).scrollTop() > 100) { 
	            $('#teamList-scroll').fadeIn(); 
	        } else { 
	            $('#teamList-scroll').fadeOut(); 
	        } 
	    }); 
	    $('#teamList-scroll').click(function(){ 
	        $("html, body").animate({ scrollTop: 0 }, 600); 
	        return false; 
	    	}); 
		});
		
		// 추가 / 삭제된 조 사이드탭에 출력
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

		// 조 추가
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
		// 조 삭제
		function doDel() {
			let delEle = document.querySelector(`#team\${team}`);
			delEle.remove();
			team--;
			

		}
		// 변경된 조 저장
		function sendTeam() {
			let inputEle = document.querySelector("#codeValue");
			inputEle.value = team;
			
			let form = document.sendForm;
		    form.submit();
		}

// 		// 삭제시 컨펌
		
		function confirmDel(){
			let result = confirm("정말 삭제하시겠습니까?");
			if(result){
			    alert("삭제되었습니다");
			    return true;
			}else{
			    alert("취소되었습니다");
			    return false;
			}
		}
		
		// Ajax를 이용한 리스트 출력 및 infinity scroll
		
		let page = 1;
		function teamListAjax() {
			let xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = () => {
				
				if (xhr.readyState === 4) {
					
					if (xhr.status === 200) {
						let teamList = JSON.parse(xhr.responseText);
						if (teamList.length == 0) {
							page--;
						} else {
							makeTeamList(teamList)
						}
					}
				}
			};
			xhr.open("GET", "teamBoardList_ajax.do?projectNo=${projectNo}&teamNo=${teamNo}&pageNo=" + page, true);
			xhr.send();
		}
		teamListAjax();
		
		function makeTeamList(list) {
			let teamList = document.getElementById("boardList_cws");
			let html = "<div>";
			for (let i = 0; i < list.length; i++) {
				let tList = list[i];
				let a = document.createElement("span");
				a.innerHTML = "";
				
		 		if ('${sessionScope.user.userNo}' == tList.userNo || '${sessionScope.user.userGrade}' == 3){
		 			a.innerHTML = 
		 			`<form method="post" action="${pageContext.request.contextPath}/team/teamBoardDelete.do" />
		 			<button onclick="return confirmDel();" style="margin-top:-125px; cursor: pointer; float: right; background: none; border: none">
		 			<i class="fa fa-trash-o fa-2x" aria-hidden="true"></i>
		 			</button>
		 			<input type="hidden" name="teamBoardNo" value="\${tList.teamBoardNo}"/>
		 			<input type="hidden" name="projectNo" value="\${tList.projectNo}"/>
		 			<input type="hidden" name="teamNo" value="\${tList.teamNo}"/>
		 			</form>`
			 	};
			html += `<ul class="board_cws">
					<li style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; height: 35px; padding-top: 10px;">
					<a href="${pageContext.request.contextPath}/team/teamBoardDetail.do?teamBoardNo=\${tList.teamBoardNo}" style="font-size: 35px; ">
					\${tList.teamBoardTitle}</a></li>
			 		<br>
			 		<li><h6 style="margin: 0 auto">작성자: \${tList.userId}</h6></li>
			 		<li><h6 style="margin: 0 auto">작성일: \${tList.teamBoardRegDt}</h6></li>
			 		<li><h4 style="margin: 0 auto"><i class="fa fa-commenting-o" aria-hidden="true">  \${tList.cmtCount}개</i></h4></li>
			 		\${a.innerHTML}
			 		</ul>
			 		<br><br><br>
			 		
				`;
			}
			html += "</div>";
			teamList.innerHTML += html;
			
		}
		
		
		// infinity scroll
		$(window).on('scroll', function() {
			let scrollHeight = $(document).height();
			let scrollPosition = $(window).height() + $(window).scrollTop();		

			$("#scrollHeight").text(scrollHeight);
			$("#scrollPosition").text(scrollPosition);
			$("#bottom").text(scrollHeight - scrollPosition);

			if (scrollPosition > scrollHeight - 300) {			
				page++;
				teamListAjax();
			}  
		});
		

// 		$(window).scroll(function(){
//   		var scrollH = $(window).scrollTop() + $(window).height();
//   		var documentH = $(document).height();
//   			if (scrollH == documentH){
//     			for (var i=0; i<10; i++){
//       				$("<h1>Infinity scroll</h1>").appendTo("body");
//     			};
//   			};
// 		});
		// 리스트 형식
	</script>
</body>

</html>