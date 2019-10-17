let f = document.writeForm
let u = document.updateForm
  function inputCheck() {
	  
	var tempPageName = window.location.href;
    var strPageName = tempPageName.split("/");
    pageName = strPageName[strPageName.length-1].split("?")[0];

	
	if (pageName.indexOf("talk_write.do") != -1) {
		if (isEmpty(f.title, "제목을 입력하세요")) return false;
		if (isEmpty(f.content, "내용을 입력하세요")) return false;
		if (isMaxVal(f.title, "제목은 20자 이하로 입력하세요", 20)) return false;
		if (isMaxVal(f.content, "내용은 500자 이하로 입력하세요", 500)) return false;	
	}
	
	else if (pageName.indexOf("talk_detail.do") != -1) {
		
		if (isEmpty(f.cmtContent, "댓글을 입력하세요")) return false;
		if (isMaxVal(f.cmtContent, "댓글은 70자 이하로 입력하세요", 70)) return false;
		if (!isEmpty(f.cmtContent, "댓글을 입력하세요")) {
			commentRegistAjax();
		}
		if (typeof(u.cmtUpdateContent) != 'undefined') {
			if (isEmpty(u.cmtUpdateContent, "댓들을 입력하세요")) return false;
			if (isMaxVal(u.cmtUpdateContent, "댓글은 70자 이하로 입력하세요", 70)) return false;
			commentUpdateDoAjax(f.cmtNo);
		}
	}
    return true;  
  }
  
  function isEmpty(ele, msg) {
      if (ele.value.trim().length == 0) {
          alert(msg);
          ele.focus();
          return true; 
      }
      return false;
  }
  function isMaxVal(ele, msg, size) {
	  if (ele.value.length > size) {
		  alert(msg);
		  ele.focus();
		  return true; 
	  }
	  return false;
  }
 
  
  /*//댓글 길이 검사
  let cmtContent = document.getElementById("cmtContent");
  cmtContent.addEventListener("keydown", (e) => {
      let ele = e.target;
      let val = ele.value;
      // console.log(ele.value, ele.value.length);
      // ctrl + v 한 경우의 체크
      if (e.key === "v" && e.ctrlKey) {
          setTimeout(() => {
              if (e.target.value.length > 70) {
                  alert("내용이 너무 깁니다");
                  e.target.value = e.target.value.substr(0, 70);
              }
          }, 10);
      }

      if (val.length < 70) return;   // 6글자까지 입력될 수 있게 처리
      
      // 일부 키 허용하기
      // 8 : 백스페이스, 37 : 화살표 왼쪽 이동, 46 : delete 키
      // if (e.keyCode === 8 || e.keyCode === 37 || e.keyCode === 46) return;
      if ([8, 37, 46].indexOf(e.keyCode) != -1) return;
      e.preventDefault();

      // 한글처리
      setTimeout(() => {
          ele.value = ele.value.substr(0, 70);
      }, 10);
  });
  cmtContent.addEventListener("blur", (e) => {
      e.target.value = e.target.value.substr(0, 70);
  });
  */
  
  let str = document.getElementById("content").value;
  str = replaceAll(str,'<br>',"\r\n");

  document.getElementById("content").innerHTML = str;

  function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
  }
   
  
  

 
 
  
  

  
 