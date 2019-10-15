/***
 * 온라인강의 검색 & 페이징 js
 * 작성자 : 유지인
 */

let ifrEle = document.querySelectorAll('.vid_container .ifrBox');

for(let i = 0; i < ifrEle.length; i++) {
	ifrEle[i].addEventListener('click', (e) => {
		let no = ifrEle[i].getAttribute('data-ytNo');
		// 한 개의 온라인강의 객체를 가져오는 함수 
		selectOnlineclassAjax(no);
		// 위에서 조회한 강의객체의 댓글리스트
		commentListAjax(no);
	});
}

/***
 * 
 */
//selectOnlineclassListAjax(subj);
function selectOnlineclassListAjax() {
	console.log("subj : ", subj)
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200) {
			let obj = JSON.parse(xhr.responseText);
			console.log("결과", obj);
		}
	};
	xhr.open("GET", "onlineclsAjaxList.do?subj=" + subj, true);
	xhr.send();
}

/*------------------------------------*/

/***
 * 온라인강의 조회
 * @param no
 * @returns
 */
function selectOnlineclassAjax(no) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200) {
			// 키 ocls, userId
			let obj = JSON.parse(xhr.responseText);
			let pop_l_Ele = document.querySelector('.pop_l'); 
			pop_l_Ele.innerHTML = `<iframe src="https://www.youtube.com/embed/${ obj.ocls.ytAddr }" width="100%" height="100%" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>`;
			
			let pop_r_Ele = document.querySelector('.pop_r');
			pop_r_Ele.setAttribute('data-num', no);
			let pop_r_Ele1 = document.querySelector('.pop_ttl p');
			let pop_r_Ele2 = document.querySelector('.pop_ttl dd');
			
			pop_r_Ele1.innerHTML = `${ obj.ocls.ytTitle }`;
			if(userGrade == 3 || userNo == obj.ocls.userNo) {
				pop_r_Ele1.innerHTML += `<a id="rudBtn" href="javascript:openPop()">···</a>`;
			}
			pop_r_Ele2.innerHTML = obj.userId;
			pop_r_Ele2.innerHTML += "<span>조회수 : " + obj.ocls.ytViewCnt + "</span>";
			let popbg = document.querySelector(".popbg");
			let popup = document.querySelector(".popup");
			popbg.style.display = 'block';
			popup.style.display = 'block';
			// 좋아요 처리
			let likeEle = document.querySelector('#cntLike span');
			likeEle.innerText = obj.ocls.ytLike;
			
			for (let i = 0; i < obj.likeUserNo.length; i++) {
				if (userNo == obj.likeUserNo[i]){
					console.log("좋아요한 회원들의 회원번호", obj.likeUserNo[i]);
					let iconLike = document.querySelector(".like");
					iconLike.setAttribute('class', 'like fa fa-heart');
					iconLike.style.color="#ff006a";
				}
			}
			// 수정/삭제/취소 버튼 활성화 시 경로 변경
			let delBtn = document.getElementById('delThis');
//			delBtn.setAttribute('onclick', `location.href="${paramUrl}/onlineclass/delete.do?subj=${subj}&yt_no=${no}`);
			delBtn.setAttribute('onclick', `location.href="${paramUrl}/onlineclass/delete.do?subj=${subj}&yt_no=${no}"`);
			let updBtn = document.getElementById('updThis');
			if (userNo == obj.ocls.userNo && updBtn != undefined) {
				updBtn.classList.remove('hidden');
				updBtn.setAttribute('onclick', `location.href="${paramUrl}/onlineclass/updateform.do?subj=${subj}&yt_no=${no}"`);
				updBtn.setAttribute('data-usno', `${userNo}`);
				updBtn.setAttribute('data-wrtr', `${obj.ocls.userNo}`);
			}
		}
	};
	xhr.open("GET", "p.do?no=" + no + "&subj=" + subj, true);
	xhr.send();
};

/**
 * 온라인강의 댓글 js
 * 작성자 : 유지인 
 */

/***
 * 댓글 목록 가져오는 Ajax
 * @returns
 */
function commentListAjax(no) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				
				makeCommentList(JSON.parse(xhr.responseText));
				btnCmtUdp = document.getElementById('cmtUdp');
				
				
			}
		}
	};
	xhr.open("GET", `comment_list.do?no=${no}`, true);
	xhr.send();
};

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
			}
		}
	};
	let Ele = document.querySelector('.pop_r');
	let no = Ele.getAttribute('data-num');
	xhr.open("POST", "cmt_reg.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	let f = document.crForm;
	xhr.send(`no=${no}&user=${userNo}&cmtDetail=${f.cmtdetail.value}`);
	f.cmtdetail.value="";
	return false;
}

/***
 * 댓글 수정
 * 수정버튼 클릭시 실행
 */

function udpBtnClick(cmtNo) {
	let btnCmtUdp = document.getElementById(`cmtUdp${cmtNo}`);
		let cmtNo_Udp = btnCmtUdp.getAttribute('data-upno');
		// 
		let tAreaEle = document.querySelector("textarea[name='cmtdetail']");
		let orgTextarea = document.querySelector(`#cmtNo${cmtNo}`);
		let orgTxt = orgTextarea.innerText;
		tAreaEle.value = orgTxt;
		closePop2();
		// 객체 찾고 수정할 내용 입력했으면 수정 실행
		let udpBtn = document.querySelector('form[name="crForm"]');
		udpBtn.setAttribute('onsubmit', `return commentUpdateAjax(${cmtNo});`);
//		commentUpdateAjax(upNo);
	
}

function commentUpdateAjax(cmtNo) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			let obj = JSON.parse(xhr.responseText);
			if (obj.result == 1) {
				alert('수정완료');
			} else {
				alert('수정실패');
			}

			delete obj.result;
			makeCommentList(obj);
			let udpBtn = document.querySelector('form[name="crForm"]');
			udpBtn.setAttribute('onsubmit', 'return commentRegistAjax();');
		}
	};
	let Ele = document.querySelector('.pop_r');
	let no = Ele.getAttribute('data-num');
	
	xhr.open("POST", "cmt_upd.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	let f = document.crForm;
	xhr.send(`no=${no}&cmtNo=${cmtNo}&cmtDetail=${f.cmtdetail.value}`);
	f.cmtdetail.value = "";
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
				if (obj.result == 1) {
					closePop2();
				}
			}
		}
	};
	let Ele = document.querySelector('.pop_r');
	let no = Ele.getAttribute('data-num');
	xhr.open("GET", `cmt_del.do?no=${no}&cmtNo=${cmtNo}`, true);
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
	if (list.cmt.length == 0) {
		html += '<tr><td>등록된 댓글이 없습니다</td></tr>';
		commentListEle.innerHTML = html;
		return;
	}
	for (let i = 0; i < list.cmt.length; i++) {
		cmtUserNo = list.cmt[i].userNo;
		cmtNo = list.cmt[i].cmtNo;
		html += `<tr class="cmtun${cmtUserNo}" onclick="chkcmtuserno(${cmtUserNo}, ${cmtNo});">
		<td><i class="fa fa-user-circle" aria-hidden="true"></i></td>
		<td><b>${list.cmtUser[i]}</b></td>
		<td id="cmtNo${list.cmt[i].cmtNo}">${list.cmt[i].cmtContent}`;
			if (userNo == cmtUserNo || userNo ==2) {
				html += `<a href="javascript:openPop2()" class="hidden">···</a></td>`;
			}
		html += `</tr>`;	
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
			`<li id="cmtUdp${cmtNo}" onclick="udpBtnClick(${cmtNo})" data-upno=${cmtNo}>댓글 수정</li>
			<li onclick="commentDeleteAjax(${cmtNo});" class="red">댓글 삭제</li>
      		<li><a href="javascript:closePop2()">댓글 취소</a></li>`;
	} else {
		document.getElementById('cmtupdt').innerHTML = 
			`<li onclick="commentDeleteAjax(${cmtNo});" class="red">댓글 삭제</li>
      		<li><a href="javascript:closePop2()">댓글 취소</a></li>`;
	}
}

/***
 * 좋아요 처리
 */
let btnLike = document.querySelector('.like');
btnLike.addEventListener('click', (e) => {
	addLike();
});
function addLike() {
	let pop_r_Ele = document.querySelector('.pop_r');
	let no = pop_r_Ele.getAttribute('data-num');
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200) {
			let result = xhr.responseText.trim();
			console.log("좋아요 결과값", result);
			if (result == 'success') {
				alert("좋아요 성공");
				selectOnlineclassAjax(no)
			} else if (result == 'already') {
				alert("이미 좋아요를 누르셨습니다.");
			} else {
				alert("시스템 오류입니다.");
			}
		}
	};
	xhr.open("GET", `addLike.do?no=${no}&userNo=${userNo}`);
	xhr.send();
}

