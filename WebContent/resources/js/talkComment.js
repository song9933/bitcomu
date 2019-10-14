console.log(postNo);
console.log(cmtPageNo);
console.log(UserGrade);
console.log(UserNo);
/**
 * 댓글 목록 가져오는 Ajax
 * @returns
 */
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				console.log(list[0]);
				console.log(list[1]);
				makeCommentList(list);
			}
		}
	};
	xhr.open("POST", "commentList.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	xhr.send(`postNo=${postNo}&cmtPageNo=${cmtPageNo}`);
	return false;
}
commentListAjax();

function makeCommentList(list) {
	let AjaxCmtList = document.getElementById("AjaxCmtList");
	let html = "";
	for (let i = 0; i < list[0].length; i++) {
		let comment = list[0][i];
		let pr = list[1][i];
		if(true){
			
		html += `
		
		<th><h3>&nbsp;${comment.userId}</h3></th>
								  
		  <th>
			 <h6> ${comment.cmtRegDt}"</h6>
		  </th>
		  
		  <th>
		  
		`;
		
		if(comment.userNo == UserNo || UserGrade == 3) {
			html +=`<a href="#" onclick="commentDeleteAjax(${comment.cmtNo}, ${comment.boardPostNo}, ${pr.pageNo})">삭제</a>
				<a href="#" onclick="commentListAjax(${comment.cmtNo}, ${comment.boardPostNo}, ${comment.cmtContent} ${pr.pageNo})">수정</a>`
		}
		  
		  html +=`</th>
			<th></th>
		    <tr>
			<td></td>
		    <td></td>
		    <td></td>
			  <td colspan="3">&emsp;${comment.cmtContent}</td>
		    </tr>

	    `;
		}else{
			
		}
	}
	html += "";
	AjaxCmtList.innerHTML = html;
	// 삭제링크 이벤트 설정??
}

/**
 * 댓글 삭제
 * @returns
 */
function commentDeleteAjax(cmtNo, boardPostNo, pageNo ) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				console.log(list[0]);
				console.log(list[1]);
				makeCommentList(list);
				
			}
		}
	};
	xhr.open("POST", "comment_delete.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	xhr.send(`postNo=${postNo}&pageNo=${cmtPageNo}&cmtNo=${cmtNo}`);
	return false;
}

/**
 * 댓글 등록 
 * @returns
 */
function commentRegistAjax() {
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				console.log(list[0]);
				console.log(list[1]);
				makeCommentList(list);
			}
		}
	};
	xhr.open("POST", "comment_regist.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	
	let f = document.crForm;
	xhr.send(`no=${no}&writer=${f.writer.value}&content=${f.content.value}`);
	f.writer.value = "";
	f.content.value = ""
	return false;
}

/**
 * 댓글 수정 
 * @returns
 */
function commentUpdateAjax(commentNo) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let list =  xhr.responseText.split("]");
				list[0] += "]";
				list[0] = JSON.parse(list[0]);
				console.log(list[0]);
				console.log(list[1]);
				makeCommentList(list);
			
				
			}
			
			
		}
	};
	xhr.open("POST", "comment_update.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	
	xhr.send(`postNo=${postNo}&pageNo=${cmtPageNo}&cmtNo=${cmtNo}`);
	f.writer.value = "";
	f.content.value = "";
	return false;

}
