/***
 * 온라인강의 검색 & 페이징 js
 * 작성자 : 유지인
 */

//let PageNo = 1;	// 페이지 1번으로 초기화
//let xhr = new XMLHttpRequest();
//
//xhr.onreadystatechange = () => {
//	if (xhr.readyState ==4 && xhr.status == 200) {
//		
//	}
//};



/**
 * 온라인강의 댓글 js
 * 작성자 : 유지인 
 */

/***
 * 댓글 목록 가져오는 Ajax
 * @returns
 */
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	};
	xhr.open("GET", `comment_list.do?no=${no}`, true);
	xhr.send();
};

commentListAjax();
/***
 * 댓글 등록 
 */
function commentRegistAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let obj = JSON.parse(xhr.responseText);
				makeCommentList(obj);
				console.log("등록OK: 1, 에러 : 0", obj.result);
			}
		}
	};
	xhr.open("POST", "cmt_reg.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	let f = document.crForm;
	xhr.send(`no=${no}&user=${userNo}&cmtDetail=${f.cmtdetail.value}`);
	f.cmtdetail.value="";
	return false;
}

/***
 * 댓글 삭제
 */
function commentDeleteAjax(cmtNo) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4) {
			if (xhr.status == 200) {
				let obj = JSON.parse(xhr.responseText);
				makeCommentList(obj);
				console.log("삭제 결과값", obj.result);
				if (obj.result == 1) {
					closePop2();
				}
//				makeCommentList(obj);
				commentListAjax();
			}
		}
	};
	xhr.open("GET", `cmt_del.do?cmtNo=${cmtNo}`, true);
	xhr.send();
}
/***
 * 댓글을 리스트로 만들어 뿌려주는 모듈 
 */
function makeCommentList(list) {
	
	let commentListEle = document.getElementById("commentList");
	let html = "";
	let cmtUserNo;
	let cmtNo;
	let result = list.result;
//	console.log(list);
//	console.log(list.cmt.length);
	if (list.cmt.length == 0) {
		html += '<tr><td>등록된 댓글이 없습니다</td></tr>';
		commentListEle.innerHTML = html;
		return;
	}
	for (let i = 0; i < list.cmt.length; i++) {
		cmtUserNo = list.cmt[i].userNo;
		cmtNo = list.cmt[i].cmtNo;
		html += `<tr class="cmtun${cmtUserNo}" onclick="chkcmtuserno(${cmtUserNo}, ${cmtNo});">
		<td>${cmtUserNo}</td>
		<td><i class="fa fa-user-circle" aria-hidden="true"></i></td>
		<td><b>${list.cmtUser[i]}</b></td>
		<td>${list.cmt[i].cmtContent}<a href="javascript:openPop2()" class="hidden">···</a></td>
		</tr>
		`;	
	}
	commentList.innerHTML = html;	
}

/***
 * 댓쓴이와 로그인유저 일치여부를 통해
 * 수정 버튼 포함 또는 불포함
 * @param cmtUserNo
 * @returns
 */
function chkcmtuserno(cmtUserNo, cmtNo) {
	//<form name="crForm" method="post" onsubmit="return commentRegistAjax();" class="clearboth">
	if (`${userNo}` == `${cmtUserNo}`) {
		document.getElementById('cmtupdt').innerHTML =
			`<li>댓글 수정</li>
			<li onclick="commentDeleteAjax(${cmtNo});" class="red">댓글 삭제</li>
      		<li><a href="javascript:closePop2()">댓글 취소</a></li>`;
	} else {
		document.getElementById('cmtupdt').innerHTML = 
			`<li onclick="commentDeleteAjax(${cmtNo});" class="red">댓글 삭제</li>
      		<li><a href="javascript:closePop2()">댓글 취소</a></li>`;
	}
	console.log("cmtUsrNo", cmtUserNo, "/userNo", userNo, "cmtNo", cmtNo);
}

