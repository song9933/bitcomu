let f = document.writeForm
  function inputCheck(e) {
	console.log(e);
// 	titleIsContent(f.content, f.title);
	if (isEmpty(f.title, "제목을 입력하세요")) return false;
	if (isEmpty(f.content, "내용을 입력하세요")) return false;

    return true;  
  }
  
  function isEmpty(ele, msg) {
      if (ele.value == "") {
          alert(msg);
          ele.focus();
          return true; 
      }
      return false;
  }
 
  
  
//    function titleIsContent(content, title) {
// 	  if(content.value == " "){
		  
// 		  content.value = title.value;
// 		  alert("제곧내")
		  
// 	  }
//   } 
  
  //제목 길이 검사
  let title = document.getElementById("title");
  title.addEventListener("keydown", (e) => {
      let ele = e.target;
      let val = ele.value;
      // console.log(ele.value, ele.value.length);
      // ctrl + v 한 경우의 체크
      if (e.key === "v" && e.ctrlKey) {
          setTimeout(() => {
              if (e.target.value.length > 50) {
                  alert("제목이 너무 깁니다");
                  e.target.value = e.target.value.substr(0, 50);
              }
          }, 10);
      }

      if (val.length < 50) return;   // 6글자까지 입력될 수 있게 처리
      
      // 일부 키 허용하기
      // 8 : 백스페이스, 37 : 화살표 왼쪽 이동, 46 : delete 키
      // if (e.keyCode === 8 || e.keyCode === 37 || e.keyCode === 46) return;
      if ([8, 37, 46].indexOf(e.keyCode) != -1) return;
      e.preventDefault();

      // 한글처리
      setTimeout(() => {
          ele.value = ele.value.substr(0, 50);
      }, 100);
  });
  title.addEventListener("blur", (e) => {
      e.target.value = e.target.value.substr(0, 50);
  });
  
  //내용 길이 검사
  let content = document.getElementById("content");
  content.addEventListener("keydown", (e) => {
      let ele = e.target;
      let val = ele.value;
      // console.log(ele.value, ele.value.length);
      // ctrl + v 한 경우의 체크
      if (e.key === "v" && e.ctrlKey) {
          setTimeout(() => {
              if (e.target.value.length > 1000) {
                  alert("내용이 너무 깁니다");
                  e.target.value = e.target.value.substr(0, 1000);
              }
          }, 10);
      }

      if (val.length < 50) return;   // 6글자까지 입력될 수 있게 처리
      
      // 일부 키 허용하기
      // 8 : 백스페이스, 37 : 화살표 왼쪽 이동, 46 : delete 키
      // if (e.keyCode === 8 || e.keyCode === 37 || e.keyCode === 46) return;
      if ([8, 37, 46].indexOf(e.keyCode) != -1) return;
      e.preventDefault();

      // 한글처리
      setTimeout(() => {
          ele.value = ele.value.substr(0, 1000);
      }, 100);
  });
  content.addEventListener("blur", (e) => {
      e.target.value = e.target.value.substr(0, 1000);
  });