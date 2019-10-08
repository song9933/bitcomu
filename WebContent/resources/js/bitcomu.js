/**
 * 온라인강의 js
 * 작성자 : 유지인 
 */

function commentListAjax() {
	console.log();
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let commentListEle = document.getElementById("commentList");
				let html = "";
				let resList = JSON.parse(xhr.responseText);
				console.log(resList);
				for (let i = 0; i < resList.cmt.length; i++) {
					console.log(resList.cmt[i].cmtContent, resList.cmtUser[i]);
					html += `<tr>
					<td><i class="fa fa-user-circle" aria-hidden="true"></i></td>
					<td><b>${resList.cmtUser[i]}</b></td>
					<td>${resList.cmt[i].cmtContent}</td>
					</tr>`;
/*
 <li>
	<i class="fa fa-user-circle" aria-hidden="true"></i>
	<b>${resList.cmtUser[i]}</b>${resList.cmt[i].cmtContent}
</li> 
 */					
				}
				commentListEle.innerHTML += html;
			}
		}
	};
	xhr.open("GET", "comment_list.do?no=" + no, true);
	xhr.send();
};

commentListAjax();
