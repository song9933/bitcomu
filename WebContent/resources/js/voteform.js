/*투표등록 모달창과 관련된 JS 시작*/


function validate(){
	let writeFormTitle = document.getElementById("dc-form-title");
	if (document.getElementById("dc-form-title").value.trim().length == 0){
		alert("제목을 입력해주세요.");
		return false;
	}
	if (document.getElementById("dc-form-title").value.length > 33){
		alert("제목은 33자이내로 입력해주세요.");
		return false;
	}
	var date = new Date();
	date.setMinutes(date.getMinutes()+3);
	date.setHours(date.getHours()+9);
	let dateString = date.toISOString().slice(0, 16);
	let inputdate = document.querySelector("#limitDate");
	if (inputdate.value < dateString){
		alert("마감기한은 현재시간보다 최소 3분 이후로 설정하셔야 합니다.");
		return false;
	}
	
	if (document.querySelector("#vote-content").value.trim().length == 0){
		alert("설명을 입력해주세요.");
		return false;
	}
	if (document.querySelector("#vote-content").value.length > 666){
		alert("666자 이내로 입력해주세요.");
		return false;
	}
	
	let menu = document.getElementsByClassName("vote_menu");
	for (let i = 0; i < menu.length; i++){
		if(menu[i].value.trim().length == 0){
			alert("선택지이름을 입력해주세요.");
			return false;
		}
		if(menu[i].value.length > 66){
			alert("선택지 이름은 66자 이내로 입력해주세요.");
			return false;
		}
		for(let j = 1; j < menu.length; j++){
			console.log(menu[i].value, menu[j].value);
			if(menu[i].value == menu[j].value && i != j){
				alert("중복되는 선택지 이름이 있습니다.");
				return false;
			}
		}
	}
}

let index = 3;
	function vote_add(){
		let tg = document.getElementById("vote_tg");
		let title = document.createElement("h3");
		title.setAttribute("id", `vwmenu${index}`);
		title.innerText = `투표 선택지의 이름`;
		let input = document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("class", "w3-input vote_menu")
		input.setAttribute("placeholder", "선택지 이름을 입력하세요");
		input.setAttribute("name", "menu");
		let plusbtn = document.createElement("i");
		plusbtn.setAttribute("class",`fa fa-plus-square vote_plusminus`);
		plusbtn.setAttribute("onclick",`vote_add()`);
		plusbtn.setAttribute("aria-hidden",`true`);
		let minusbtn = document.createElement("i");
		minusbtn.setAttribute("class",`fa fa-minus-square vote_plusminus`);
		minusbtn.setAttribute("onclick",`vote_sub(${index})`);
		minusbtn.setAttribute("aria-hidden",`true`);
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

