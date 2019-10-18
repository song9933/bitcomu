<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="투표 리스트" />
</c:import>

<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
</head>
<style>
</style>
<body>
	<a href="#" id="vote-scroll" style="display: none;"><span></span></a>
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
									<input type="datetime-local" name="voteCloseDt" class="vote_datetime_input vote-close-dt" id="limitDate"/>
								</div>
								<div>투표에대한 간략한 설명을 입력해주세요.</div>
								<textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.."
									name="voteContent" id="vote-content"></textarea>
								<div>중복체크 가능여부 설정(체크박스로 변경)</div>
								<input class="w3-check" type="checkbox" name="voteMultiCheck">
								<label>중복체크 가능</label>

								<div>
								<div><h3>투표 선택지의 이름
									<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
									name="menu">
								</h3></div>
								
								<div><h3>투표 선택지의 이름
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
	
/*등록하기 버튼에 대한 이벤트 리스너 시작 */
var writeBtn = document.getElementById("writeVoteBtn");

writeBtn.addEventListener("click", writeVote);  // 선택한 요소에 click 이벤트 리스너를 등록함.

function writeVote() {
	if('${sessionScope.user}' == '') {
		alert('투표 등록하기는 로그인후에 이용하실 수 있습니다.');
	} else if ('${sessionScope.user.userGrade}' == 1){
		alert('투표 등록하기는 현재 관리자와 반장만 이용 가능합니다.');
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
		let okok = document.querySelector(".vote_inner");
		//검색 한번에 한번 실행되는 스위치.
		if(searchSwitch) {
			document.querySelector(".vote_inner").innerHTML = "";
		}
		let strNone = "display:none;";
		let strBlock = "display:inline-block;";
		let voteNotice;
		let voteAnnoy;
		let voteClose;
		for(var i = 0; i < list.length; i++){
			let vote = list[i];
			if(`\${vote.voteNoticeEnabled}` == 'Y') {
				voteNotice = strBlock;
			} else {
				voteNotice = strNone;
			}
			if(`\${vote.voteAnonyEnabled}` == 'Y') {
				voteAnony = strBlock;
			} else {
				voteAnony = strNone;
			}
			if(`\${vote.voteCloseEnabled}` == 'Y') {
				voteClose = strBlock;
			} else {
				voteClose= strNone;
			}
			document.querySelector(".vote_inner").innerHTML += 
		`<div class="w3-panel w3-hover-shadow w3-round dc_listbox w3-card" 
			onclick="location.href='/bitcomu/vote/votedetail.do?voteNo=\${vote.voteNo}'">
			<p>
				<span class="vote-notice" style=\${voteNotice}>공지</span><span class="vote-annoy" style=\${voteAnony}>익명</span><span class="vote-close" style=\${voteClose}>마감</span>  				
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
// 		if(userInput.value.length == 0)
			
		if(userInput.trim().length == 0){
			alert('최소 한글자이상 입력해주세요.')
		}
		
		else {
			keyword = userInput;
			page = 1;
			searchSwitch = true;
			voteListAjax();
		}
		
	});
	
	/*새로고침 기능*/
	document.getElementById("vote-refresh-button").addEventListener('click', function(){
		location.href="/bitcomu/vote/votelist.do";
	});

	function mindate() {
		var cdate = new Date();
		return new Date();
	}
	
	/*스크롤 BacktotheTop*/
	$(document).ready(function(){ 
    $(window).scroll(function(){ 
        if ($(this).scrollTop() > 100) { 
            $('#vote-scroll').fadeIn(); 
        } else { 
            $('#vote-scroll').fadeOut(); 
        } 
    }); 
    $('#vote-scroll').click(function(){ 
        $("html, body").animate({ scrollTop: 0 }, 600); 
        return false; 
    }); 
});
	

</script>
</body>

</html>