/*투표등록 모달창과 관련된 JS 시작*/

let index = 3;
	function vote_add(){
		let tg = document.getElementById("vote_tg");
		let title = document.createElement("h3");
		title.setAttribute("id", `vwmenu${index}`);
		title.innerText = `투표 선택지의 이름.`;
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
		minusbtn.setAttribute("onclick",`vote_sub(${index})`);
		minusbtn.setAttribute("aria-hidden",`true`);
// 		minusbtn.append(document.createElement("br"));
		title.append(input, plusbtn, minusbtn);
		tg.append(title);
		index = index + 1;
		sleep(300);
	}
	
	function vote_sub(num){
		document.getElementById(`vwmenu${num}`).remove();
		sleep(300);
	}
	
	function sleep (delay) {
		   var start = new Date().getTime();
		   while (new Date().getTime() < start + delay);
		}
	var cDate = new Date();
	cDate.setHours(cDate.getHours()+9);
	document.querySelector(".vote-close-dt").value= cDate.toISOString().slice(0, 16);

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
}
