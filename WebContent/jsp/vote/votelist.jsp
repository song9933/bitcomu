<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="투표글쓰기" />
</c:import>
</head>
<style>
.dc_form {
	width: 80%;
	height: 800px;
	overflow: auto;
}

.dc_writeform-container {
	height: 550px;
    overflow: auto;
}

.vote_plusminus {
	font-size: 1.6em;
}

.dc_listbox {
	cursor: pointer;
}

</style>
<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />

		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280 vote_bg">
			<section class="content">
				<h2>투표하기</h2>
				<button type="button" id="writeVoteBtn"
					class="w3-button w3-round w3-blue dc_writevote">새 투표 등록</button>

				<!-- <button
					onclick="document.getElementById('dc_modal').style.display='block'"
					class="w3-btn w3-black">Open Modal</button>


				<!-- 투표모달창 시작 -->
				<div id="writevoteform" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container dc_writeform-container">
							<span
								onclick="document.getElementById('writevoteform').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>

							<%-- 투표 등록하는 폼 시작 --%>
							<form id="dc_form_write" class="dc_form w3-panel w3-card-4"
								action="<c:url value="/vote/votewrite.do" />" method="post">
								<h1>새 투표 등록하기</h1>

								<div>투표 제목을 입력해주세요.</div>
								<input class="w3-input" type="text" name="voteTitle"
									placeholder="투표제목"> <br>

								<div>마감 기한을 선택해주세요.</div>
								<div>
									<input type="datetime-local" name="voteCloseDt" id="voteCurrentTimeValue"/>
								</div>
								<br>
								<div>투표에대한 간략한 설명을 입력해주세요.</div>
								<textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.."
									name="voteContent"></textarea>

								<br>
								<div>중복체크 가능여부 설정(체크박스로 변경)</div>
								<input class="w3-check" type="checkbox" name="voteMultiCheck">
								<label>중복체크 가능</label>

								<div>
								<div><h3>투표 선택지1의 이름.
									<input class="w3-input" type="text" placeholder="선택지 이름을 입력하세요"
									name="menu" value="1"> <br>
								</h3></div>
								
								<div><h3>투표 선택지2의 이름.
									<input class="w3-input" type="text" placeholder="선택지 이름을 입력하세요"
									name="menu" value="2"> <i class="fa fa-plus-square vote_plusminus" onclick="vote_add()" aria-hidden="true"></i> <br>
								</h3></div>
								
								<div id="vote_tg"></div>
							    </div>

								<p>
									<input class="w3-check" type="checkbox" name="voteNotice">
									<label>공지사항으로 적용</label>
								</p>
								<p>
									<input class="w3-check" type="checkbox" name="voteAnonymous">
									<label>익명투표허용</label>
								</p>
								<br>
								<p>
									<button type="submit" class="w3-btn w3-blue">등록하기</button>
								</p>
								<br>
							</form>
						</div>
					</div>
				</div>
				<!-- 투표모달창 끝 -->


				<%-- 투표 리스트 출력시작 --%>
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach var="v" items="${list}">
							<div class="w3-panel w3-hover-shadow w3-round dc_listbox w3-card"
								onclick="location.href='<c:url value="/vote/votedetail.do?voteNo=${v.voteNo}" />'">
								<p>
									<c:if test="${v.voteNoticeEnabled eq 'Y'}">
										<공지>
									</c:if>
									<c:if test="${v.voteAnonyEnabled eq 'Y'}">
										<익명>
									</c:if>
									<c:if test="${v.voteCloseEnabled eq 'Y'}">
										<마감>
									</c:if>
								<div
									onclick="location.href='<c:url value="/vote/votedetail.do?voteNo=${v.voteNo}" />'">${v.voteTitle}</div>
								</p>
								<p>
									글쓴이 : ${v.userId}<br>
									<fmt:formatDate value="${v.voteRegDt}"
										pattern="yyyy년 MM월 dd일 hh시 mm분 " />
								</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="w3-panel w3-card-4 w3-round dc_listbox">
							<p>등록된 투표가 없습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>
				<%-- 투표 리스트 출력 끝 --%>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>

			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<%@include file="/jsp/include/footer.jsp"%>


	</div>
</body>
<script>
	let index = 3;
	function vote_add(){
		let tg = document.getElementById("vote_tg");
		let title = document.createElement("h3");
		title.setAttribute("id", `vwmenu\${index}`);
		title.innerText = `투표 선택지\${index}의 이름.`;
		let input = document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("class", "w3-input")
		input.setAttribute("placeholder", "선택지 이름을 입력하세요");
		input.setAttribute("name", "menu");
		input.setAttribute("value", `\${index}`);
		let plusbtn = document.createElement("i");
		plusbtn.setAttribute("class",`fa fa-plus-square vote_plusminus`);
		plusbtn.setAttribute("onclick",`vote_add()`);
		plusbtn.setAttribute("aria-hidden",`true`);
		let minusbtn = document.createElement("i");
		minusbtn.setAttribute("class",`fa fa-minus-square vote_plusminus`);
		minusbtn.setAttribute("onclick",`vote_sub(\${index})`);
		minusbtn.setAttribute("aria-hidden",`true`);
		minusbtn.append(document.createElement("br"));
		title.append(input, plusbtn, minusbtn);
		tg.append(title);
		index = index + 1;
		sleep(300);
	}
	
	function vote_sub(num){
		document.getElementById(`vwmenu\${num}`).remove();
		sleep(300);
	}
	
	function sleep (delay) {
		   var start = new Date().getTime();
		   while (new Date().getTime() < start + delay);
		}
	var cDate = new Date();
	cDate.setHours(cDate.getHours()+9);
	document.getElementById("voteCurrentTimeValue").value= cDate.toISOString().slice(0, 16);
	
	
	<%-- 이벤트 리스너 시작 --%>
	var writeBtn = document.getElementById("writeVoteBtn");

	writeBtn.addEventListener("click", writeVote);  // 선택한 요소에 click 이벤트 리스너를 등록함.

	function writeVote() {
		console.log('${sessionScope.user}');
		if('${sessionScope.user}' == null) {
			alert('투표 등록하기는 로그인후에 이용하실 수 있습니다.');
		} else {
			document.getElementById('writevoteform').style.display='block';
		}
	}

</script>

</html>