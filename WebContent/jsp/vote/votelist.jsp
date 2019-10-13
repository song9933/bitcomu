<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="투표글쓰기" />
</c:import>

<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
</head>
<style>
.dc_form {
	width: 97%;
	height: 800px;
	overflow: auto;
	font-family: 'Cute Font', cursive;
	font-size: 24px;
    line-height: 2.7em;
    font-weight: bolder;
    color: black;
}
	
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
    width: 40%;
    margin: 25px auto;
    height: 242px;
    padding: 40px;
    text-align: center;
    font-size: 22px;
    line-height: 2.5em;
    color: black;
    background-color: #fff20708;
}

.vote_h1 {
	margin-top: 22px;
}

/* 투표 검색창 CSS */
.vote_search {
  width: 100%;
  position: relative;
  display: flex;
  margin-top: -168px;
  margin-left: -57px;
}

.vote_searchTerm {
  width: 100%;
  border: 3px solid #00B4CC;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.vote_searchTerm:focus{
  color: #00B4CC;
}

.vote_searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
  margin-right: 2px;
}

/*Resize the wrap to see the search bar change!*/
.vote_wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.vote-x-btn {
	font-size: 50px;
	color: black;
}

.vote_datetime_input {
	font-size: x-large;
}

</style>
<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />

		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280 vote_bg">
			<section class="content">
			<!-- 검색창 -->
				<div class="vote_wrap">
					<div class="vote_search">
						<input type="text" class="vote_searchTerm"
							placeholder="검색어를 입력하세요." id="vote-search-input">
						<button type="submit" class="vote_searchButton" id="vote-search-button">
							<i class="fa fa-search"></i>
						</button>
						<button type="submit" class="vote_searchButton" id="vote-refresh-button">
							<i class="fa fa-refresh"></i>
						</button>
							
					</div>
				</div>
				<!-- 검색창끝 -->
				<h2>투표하기</h2>
				
				<!-- 투표 등록버튼 -->				
				<button type="button" id="writeVoteBtn"
					class="w3-button w3-round w3-blue dc_writevote">새 투표 등록</button>

				<!-- 투표모달창 시작 -->
				<div id="writevoteform" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container dc_writeform-container">
							<span
								onclick="document.getElementById('writevoteform').style.display='none'"
								class="w3-button w3-display-topright vote-x-btn">&times;</span>

							<%-- 투표 등록하는 폼 시작 --%>
							<form id="dc_form_write" class="dc_form w3-panel"
								action="<c:url value="/vote/votewrite.do" />" method="post" onsubmit="return validate()">
									<h1 class="vote_h1">새 투표 등록하기</h1>

								<div>투표 제목을 입력해주세요.</div>
								<input class="w3-input" type="text" name="voteTitle" id="dc-form-title"
									placeholder="투표제목">

								<div>마감 기한을 선택해주세요.</div>
								<div>
									<input type="datetime-local" name="voteCloseDt" class="vote_datetime_input vote-close-dt" />
								</div>
								<div>투표에대한 간략한 설명을 입력해주세요.</div>
								<textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.."
									name="voteContent" id="vote-content"></textarea>
								<div>중복체크 가능여부 설정(체크박스로 변경)</div>
								<input class="w3-check" type="checkbox" name="voteMultiCheck">
								<label>중복체크 가능</label>

								<div>
								<div><h3>투표 선택지1의 이름.
									<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
									name="menu">
								</h3></div>
								
								<div><h3>투표 선택지2의 이름.
									<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
									name="menu"> <i class="fa fa-plus-square vote_plusminus" onclick="vote_add()" aria-hidden="true"></i>
								</h3></div>
								
								<div id="vote_tg"></div>
							    </div>

								<div>
									<input class="w3-check" type="checkbox" name="voteNotice">
									<label>공지사항으로 적용</label>
								</div>
								<div>
									<input class="w3-check" type="checkbox" name="voteAnonymous">
									<label>익명투표허용</label>
								</div>
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
				
				<br><br><br><br><br><br>
				<!-- 무한스크롤을 위한 표시장소 -->
				
				<div class='vote_inner'></div>
				
			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<%@include file="/jsp/include/footer.jsp"%>


	</div>
	<script src="${pageContext.request.contextPath}/resources/js/voteform.js"></script>
	<script>
	<%-- let index = 3;
	function vote_add(){
		let tg = document.getElementById("vote_tg");
		let title = document.createElement("h3");
		title.setAttribute("id", `vwmenu\${index}`);
		title.innerText = `투표 선택지\${index}의 이름.`;
		let input = document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("class", "w3-input vote_menu")
		input.setAttribute("placeholder", "선택지 이름을 입력하세요");
		input.setAttribute("name", "menu");
// 		input.setAttribute("value", `\${index}`);
		let plusbtn = document.createElement("i");
		plusbtn.setAttribute("class",`fa fa-plus-square vote_plusminus`);
		plusbtn.setAttribute("onclick",`vote_add()`);
		plusbtn.setAttribute("aria-hidden",`true`);
		let minusbtn = document.createElement("i");
		minusbtn.setAttribute("class",`fa fa-minus-square vote_plusminus`);
		minusbtn.setAttribute("onclick",`vote_sub(\${index})`);
		minusbtn.setAttribute("aria-hidden",`true`);
// 		minusbtn.append(document.createElement("br"));
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
	document.getElementById("vote-close-dt").value= cDate.toISOString().slice(0, 16);
	
	
	등록하기 버튼에 대한 이벤트 리스너 시작
	var writeBtn = document.getElementById("writeVoteBtn");

	writeBtn.addEventListener("click", writeVote);  // 선택한 요소에 click 이벤트 리스너를 등록함.

	function writeVote() {
		if('${sessionScope.user}' == '') {
			alert('투표 등록하기는 로그인후에 이용하실 수 있습니다.');
		} else {
			document.getElementById('writevoteform').style.display='block';
		}
	}

//투표 글쓰기창의 유효성 검사 함수

function validate(){
	let writeFormTitle = document.getElementById("dc-form-title");
	if (document.getElementById("dc-form-title").value == ""){
		alert("제목을 입력해주세요.");
		return false;
	}
	var date = new Date();
	date.setMinutes(date.getMinutes()+3);
	if (document.getElementById("vote-close-dt").value < date.value){
		alert("마감기한은 현재시간보다 최소 3분 이후로 설정하셔야 합니다.");
		return false;
	}
	if (document.querySelector("#vote-content").value.length == 0){
		alert("설명을 입력해주세요.");
		return false;
	}
	
	let menu = document.getElementsByClassName("vote_menu");
	console.log(menu);
	for (let i = 0; i < menu.length; i++){
		if(menu[i].value.length == 0){
			alert("선택지이름을 입력해주세요.");
			return false;
		}	
	}
} --%>

/*등록하기 버튼에 대한 이벤트 리스너 시작 */
var writeBtn = document.getElementById("writeVoteBtn");

writeBtn.addEventListener("click", writeVote);  // 선택한 요소에 click 이벤트 리스너를 등록함.

function writeVote() {
	if('${sessionScope.user}' == '') {
		alert('투표 등록하기는 로그인후에 이용하실 수 있습니다.');
	} else {
		document.getElementById('writevoteform').style.display='block';
	}
}

/* 무한스크롤 스크립트 시작 */
let list;
let page = 1;
let keyword = "";
let searchSwitch = false;
let userInput;
function voteListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				list = JSON.parse(xhr.responseText);
				// makeCommentList(list);
				if(list.length == 0){
					//만약 검색을 통해 받아온리스트가 아예 0일때
						if(searchSwitch){
							alert('검색결과가 존재하지 않습니다.');
						}
					page--;
				} else {
				loadMore(list);
				}
			}
		}
	};
	if(keyword){
		xhr.open("GET", "/bitcomu/vote/votesearchajax.do?pageno="+page+"&keyword="+keyword, true);
		xhr.send();
	}else{
		xhr.open("GET", "/bitcomu/vote/votelistajax.do?pageno="+page, true);
		xhr.send();
	}
}
voteListAjax();

function loadMore(list) {
	console.log(list.length);
		let okok = document.querySelector(".vote_inner");
		//검색 한번에 한번 실행되는 스위치.
		if(searchSwitch) {
			document.querySelector(".vote_inner").innerHTML = "";
		}
		for(var i = 0; i < list.length; i++){
			let vote = list[i];
			let notice = "";
			console.log(vote.voteNoticeEnabled);
			if(vote.voteNoticeEnabled == 'Y') {
				notice = "<공지>";
			}
			let annoy = "";
			if(vote.voteAnonyEnabled == 'Y') {
				annoy = "<익명>";	
			}
			let close = "";
			if(vote.voteCloseEnabled == 'Y'){
				close = "<마감>";
			}

			document.querySelector(".vote_inner").innerHTML += 
		`<div class="w3-panel w3-hover-shadow w3-round dc_listbox w3-card" 
			onclick="location.href='/bitcomu/vote/votedetail.do?voteNo=\${vote.voteNo}'">
			<p>
				\${notice} \${annoy} \${close}				
			<div
				onclick="location.href='/bitcomu/vote/votedetail.do?voteNo=\${vote.voteNo}'">\${vote.voteTitle}</div>
			</p>
			<p>
				글쓴이 : \${vote.userId}<br>
				\${vote.voteRegDt}
			</p>
		</div>`;
		}
		searchSwitch = false;
		userInput = "";
}	

$(window).on("scroll", function() {
	var scrollHeight = $(document).height();
	var scrollPosition = $(window).height() + $(window).scrollTop();		

	$("#scrollHeight").text(scrollHeight);
	$("#scrollPosition").text(scrollPosition);
	$("#bottom").text(scrollHeight - scrollPosition);
	if (scrollPosition > scrollHeight - 200 && keyword == "") {			
		//todo
		page++;
    	voteListAjax();
	}
});

/* 검색기능구현 */
	/* 검색아작스 */
	document.getElementById("vote-search-button").addEventListener('click', function searchajax(){
		userInput = document.getElementById("vote-search-input").value;
		if(userInput != ""){
			keyword = userInput;
			console.log('클릭이벤트 끝나기 직전 키워드',keyword);
			page = 1;
			searchSwitch = true;
			voteListAjax();
		} else {
			alert('최소 한글자이상 입력해주세요.')
		}
	});
	
	/*새로고침 기능*/
	document.getElementById("vote-refresh-button").addEventListener('click', function(){
		location.href="/bitcomu/vote/votelist.do";
	});
	
</script>
</body>

</html>