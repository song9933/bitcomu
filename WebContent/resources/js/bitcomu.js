/**
 * 온라인강의 js
 * 작성자 : 유지인 
 */

/***
 * 댓글 목록 가져오는 Ajax
 * @returns
 */
function commentListAjax() {
	console.log();
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	};
	xhr.open("GET", "comment_list.do?no=" + no, true);
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
			if (xhr.status == 200) {}
			makeCommentList(JSON.parse(xhr.responseText));
		}
	};
	xhr.open("POST", "ajax_comment_regist.do");
	let f = document.crForm;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(`no=${no}&user=${sessionScope.user.userNo}&cmtDetail=${f.cmtdetail.value}`);
	f.cmtdetail.value="";
	return false;
}

/***
 * 댓글을 리스트로 만들어 뿌려주는 모듈 
 */
function makeCommentList(list) {
	let commentListEle = document.getElementById("commentList");
	let html = "";
	console.log(list);
	console.log(list.cmt.length);
	if (list.cmt.length == 0) {
		html += '<tr><td>등록된 댓글이 없습니다</td></tr>';
		commetListEle.innerHTML += html;
		return;
	}
	for (let i = 0; i < list.cmt.length; i++) {
//		console.log(list.cmt[i].cmtContent, list.cmtUser[i]);
		html += `<tr>
		<td><i class="fa fa-user-circle" aria-hidden="true"></i></td>
		<td><b>${list.cmtUser[i]}</b></td>
		<td>${list.cmt[i].cmtContent}</td>
		</tr>`;				
	}
	commentList.innerHTML += html;
}