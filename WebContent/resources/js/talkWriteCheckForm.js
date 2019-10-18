let f = document.writeForm;
let u = document.updateForm;
  function inputCheck() {
	let tempPageName = window.location.href;
    let strPageName = tempPageName.split("/");
    pageName = strPageName[strPageName.length-1].split("?")[0];

	
	if (pageName.indexOf("talk_write_form.do") != -1 || pageName.indexOf("updateTalkForm.do") != -1 ||  pageName.indexOf("notice_write_form.do") != -1 || pageName.indexOf("updateNoticeForm.do") != -1) {
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
	}
    return true;  
  }
  function inputCheck2(cmtNo) {
	  if (isEmpty(u.cmtUpdateContent, "댓글을 입력하세요")) return false;
	  if (isMaxVal(u.cmtUpdateContent, "댓글은 70자 이하로 입력하세요", 70)) return false;
	  commentUpdateDoAjax(cmtNo);

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
 
 

  let str = document.getElementById("content").value;
  str = replaceAll(str,'<br>',"\r\n");
  document.getElementById("content").innerHTML = str;

  function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
  }
   
  
  

 
 
  
  

  
 