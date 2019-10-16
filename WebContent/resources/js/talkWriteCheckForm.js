	let f = document.writeForm
  function inputCheck() {
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
  function 
  
  
//    function titleIsContent(content, title) {
// 	  if(content.value == " "){
		  
// 		  content.value = title.value;
// 		  alert("제곧내")
		  
// 	  }
//   } 