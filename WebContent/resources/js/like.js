function likeUpdateAjax(postNo, userNo, pageNo) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let likeCnt = document.getElementById("likeUpdate");
				likeCnt.innerHTML = xhr.responseText;
			} else if (xhr.status === 500) {
				alert("이미 좋아요 누르셨습니다.");
				return false;
			}
		}
	};
	xhr.open("POST", "like_update.do", true);
	xhr.setRequestHeader(
			"Content-Type", 
			"application/x-www-form-urlencoded");
	xhr.send(`postNo=${postNo}&userNo=${userNo}&pageNo=${pageNo}`);
	return false;
}