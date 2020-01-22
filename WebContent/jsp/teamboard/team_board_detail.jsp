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
 	animation-duration: 1s;
 	animation-name: slide;
	overflow: hidden;
}

@keyframes slide {
	from {
		height: auto;
	}
	
	to {
		height: 0px;
	}
}

.hidden2 {
	height: 0px;
	opacity: 0;
	transition: 1s;
}

.show {
	height: auto;
	opacity: 1;
	transition: 1s;
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
		<a href="#" id="teamList-scroll" style="display: none;">맨 위로<span></span></a>
			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${teamBoard.projectNo}&teamNo=${teamBoard.teamNo}">
        		<button class="close_cws" style="width:50px; height:50px; 
      				opacity: .9; border: none; font-size: 40px;">
      			</button>
      		</form>
<!-- 			<br> -->
      		<div>
      			<h5>${teamBoard.projectNo}차 프로젝트 > ${teamBoard.teamNo}조</h5>
      		</div>
			<h1 style="word-break:break-all; text-align: center; padding: 36px;">${teamBoard.teamBoardTitle}</h1>
<!-- 			<br> -->
<!-- 			<div class="detailimage_cws"> -->
<!-- 				<input type="image" title="&emsp;글에 첨부된 이미지" -->
<!-- 					style="width: 600px; height: 300px;"> -->
<!-- 			</div> -->
			<div class="detailcontent_cws" style="padding: 3px;">
					<h4 style="float: right; margin-right: 10px; padding: 10px;">
					${teamBoard.teamBoardRegDt}
					</h4>
					<br>
					<h3 style="margin-top: -20px; padding: 8px;"><i class="fa fa-user-circle-o fa-lg" aria-hidden="true"></i>
						&nbsp;${teamBoard.userId}</h3>
			</div>
<!-- 					<br> -->
			<div class="detailcontent_cws" style="padding: 3px;">
					<h3 id="teamBoardContent" style="word-break:break-all; padding: 8px;">${teamBoard.teamBoardContent}</h3>
				<br> <br> <br> <br> <br> <br> <br><br> <br> <br>
			</div>
			
			<div id="list_c">
			</div>
		</div>

		<div>
<%-- 			<form method="post" action="${pageContext.request.contextPath}/team/teamBoardDetail.do?teamBoardNo=${teamBoard.teamBoardNo}"> --%>
<!-- 				<button id="movetop" class="movetop_cws"><i class="fa fa-arrow-up fa-3x" aria-hidden="true"></i> -->
<!-- 					<br> <br>  -->
<!-- 					<h3 style="color: #ffffffe5">맨 위로</h3> -->
<!-- 				</button> -->
<!-- 			</form> -->
		</div>	
	</div>
	<script>

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
	
// 	댓글 아코디언
		function viewComment(listLength) {
				let commentEle = document.querySelector("#team_comment_cws");
				if(listLength == 0) {
					alert("댓글이 존재하지 않습니다  가장 먼저 댓글을 달아보세요!");
					return;
				}
				commentEle.classList.toggle("hidden2");
				commentEle.classList.toggle("show");
				
		}
			
// 	댓글 ===========================================

// 삭제 여부 묻는 alert
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

//  댓글 목록 가져오는 Ajax
let teamBoardNo = ${teamBoard.teamBoardNo};
// let cmtNo = ${cmtNo};
function commentListAjax(showFlag) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list = JSON.parse(xhr.responseText);
					makeCommentList(list, showFlag);
			}
		}
	};
	xhr.open("GET", "teamBoardDetail_ajax.do?teamBoardNo=" + teamBoardNo, true);
	xhr.send();
}
commentListAjax(false);

function makeCommentList(list, showFlag) {
	let commentList = document.getElementById("list_c");
	let html = `<div>
		<button class="viewcomment_cws" onclick="viewComment(\${list.length})">댓글보기</button>
		<form method="post" action="${pageContext.request.contextPath}/team/teamBoardUpdateform.do">
			`;
			let upList = document.createElement("span");
			upList.innerHTML="";
			if ('${sessionScope.user.userNo}' == '${teamBoard.userNo}' || '${sessionScope.user.userGrade}' == 3){
			upList.innerHTML=
			`<button class="updatebutton_cws">수정</button>
			<input type="hidden"name="teamBoardNo" value="${teamBoard.teamBoardNo}"/>
			
			`};
		html +=
			
		`
		\${upList.innerHTML}
		</form>
		<br> <br> 
		<div id="teamCommentWriteForm">
			<form name="crForm" method="post"  
			      onsubmit="return teamCommentWriteAjax()">
			<p style="margin-left: 40px;">▶
			<input type="text" id="cmtContent" name="cmtContent" placeholder="댓글을 입력하세요" style="width: 450px;"/>
			<input type="hidden" name="teamBoardNo" value="${teamBoard.teamBoardNo}"/>
			<input type="hidden" name="userNo" value="${teamBoard.userNo}"/>
			<button>등록</button>
			</p>
			<br>
			</form>
		</div>
		
		`;
		
		html += `<div id="team_comment_cws">
				
	`;
	
	for (let i = 0; i < list.length; i++) {
		let comment = list[i];
		let cList = document.createElement("span");
		cList.innerHTML = "";
		
		if ('${sessionScope.user.userNo}' == comment.userNo || '${sessionScope.user.userGrade}' == 3){
			cList.innerHTML = 	
				`<a onClick="updateF(\${comment.cmtNo}, '\${comment.cmtContent}', \${comment.boardPostNo})" href="javascript:;">수정</a>
                 <a href="javascript:;" onclick="commentDeleteAjax(\${comment.cmtNo}, \${comment.boardPostNo});">삭제</a>
		`};
		html += `
			
			<ul id="update\${comment.cmtNo}" style="border: 1px solid black; padding: 3px;">
				<li style="width: 35%;"><i class="fa fa-user-circle-o fa-lg" aria-hidden="true"></i>&nbsp; \${comment.userId}</li>
	            <li style="width: 70%">\${comment.cmtContent}</li>
	            <li
	                style="float: right; position: relative; margin-top: -45px; margin-right: 5px;">
	                \${comment.cmtRegDt}
	            </li>
	            <li style="float: right; position: relative; margin-top: -25px; margin-right: 5px;">
	            	\${cList.innerHTML}
	            </li>
			</ul>
			
			</form>
			`;
	}
	html += "</div>";
	commentList.innerHTML = html;
	if(showFlag) {
		document.querySelector("#team_comment_cws").className = "show";
// 		let dpEle = document.querySelector(".viewcomment_cws");
// 		dpEle.style.transition = "1s";
	} else {
		document.querySelector("#team_comment_cws").className = "hidden2";
	}
}

/**
 * 댓글 등록
 */
 function teamCommentWriteAjax() {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					commentListAjax(true);
					}
			}
		};
		xhr.open("POST", "teamCommentWrite.do", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		let f = document.crForm;
		let cmtContent = document.getElementById("cmtContent").value;
		xhr.send(`teamBoardNo=\${f.teamBoardNo.value}&userNo=\${f.userNo.value}&cmtContent=\${cmtContent}`);
		if (document.querySelector("#cmtContent").value.length == 0){
			alert("내용을 입력하세요");
			return false;
		}
		if (document.querySelector("#cmtContent").value.length > 100) {
			alert("내용은 100자리를 초과할 수 없습니다.");
		  	return false;
		}
	}
/**
 * 댓글 삭제
 * @returns
 */
function commentDeleteAjax(cmtNo, boardPostNo) {
		let result = confirm("정말 삭제하시겠습니까?");
	if(result){
		    alert("삭제되었습니다");
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					commentListAjax(true);
				}
			}
		};
		xhr.open("GET", `teamCommentDelete.do?cmtNo=\${cmtNo}&teamBoardNo=\${boardPostNo}`, true);
		xhr.send();
	    return true;
	}else{
	    alert("취소되었습니다");
	    return false;
	}
}

function realUpdate(cmtNo, teamBoardNo){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				makeCommentList(xhr.responseText);
				commentListAjax(true);
			}
		}
	};
	let cmtCon = document.getElementById("cmtCon");
	
	xhr.open("POST", `teamCommentUpdate.do`, true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("cmtNo=" + cmtNo + "&cmtContent=" + cmtCon.value + "&teamBoardNo=" + teamBoardNo);
	if (document.querySelector("#cmtCon").value.length == 0){
		alert("내용을 입력하세요");
		return false;
	}
	if (document.querySelector("#cmtCon").value.length > 100) {
		alert("내용은 100자리를 초과할 수 없습니다.");
	  	return false;
	}
}
/**
 * 댓글 수정
 */
//	href="teamBoardDetail.do?teamBoardNo=${teamBoard.teamBoardNo}" 


function updateF(cmtNo, cmtContent, boardPostNo) {
	
	let upEle = document.querySelector(`#update\${cmtNo}`);
	upEle.style="height: 40px; border: 1px solid black; padding: 4px;";
	upEle.innerHTML = `
		<li style="width: 70%; padding: 2px;">
	 	<textarea id="cmtCon" autofocus name="cmtContent" style="border: none; height: 40px; width: 465px; resize: none">\${cmtContent}</textarea>
	</li>
		<li style="float: right; margin-top: -32px; margin-right: 4px; position: relative;">
        <a href="javascript:;" onclick="realUpdate(\${cmtNo}, \${boardPostNo})"
        	style="color: inherit; background: none; border: none; cursor: pointer;">수정</a>
        <a href="javascript:;" onclick="commentListAjax(true)"
        	style="color: inherit; background: none; border: none; cursor: pointer;">취소</a>
		</li>
	`;
}
	</script>
	<script>

	let str = document.getElementById("#cmtCon").value;
	str = replaceAll(str,'<br>',"\r\n");
	document.getElementById("#cmtCon").innerHTML = str;
	
	let str2 = document.getElementById("#cmtContent").value;
	str2 = replaceAll(str2,'<br>',"\r\n");
	document.getElementById("#cmtContent").innerHTML = str2;
	
	let str3 = document.getElementById("#teamBoardContent").value;
	str3 = replaceAll(str3,'<br>',"\r\n");
	document.getElementById("#teamBoardContent").innerHTML = str3;
	
	function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
	}
	
	</script>
</body>

</html>