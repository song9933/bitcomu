var distToBottom, data, dataObj;
var pageNo = 1;
var pollingForData = false;
var xhr = new XMLHttpRequest();
var itemContainer =  document.getElementById('list');


function getDistFromBottom () {

  var scrollPosition = window.pageYOffset;
  var windowSize     = window.innerHeight;
  var bodyHeight     = document.body.offsetHeight;

  return Math.max(bodyHeight - (scrollPosition + windowSize), 0);

}
xhr.onreadystatechange = function(){
  if(xhr.readyState == 4 && xhr.status == 200) {
	
    pollingForData = false;
    data = xhr.responseText;
    dataObj = JSON.parse(data);
    // for iterating through the data
    // Using a ForEach
    dataObj.forEach((list, index) => {
    	
    	var sContainer = document.createElement('a');
    	sContainer.classList.add('item');
    	sContainer.setAttribute('href',`/bitcomu/study/studydetail.do?studyPostNo=${list.studyPostNo}`);
    	
    	var sCompl = document.createElement('p');
    	sCompl.classList.add('completed');
    	sCompl.setAttribute('id','completed');
    	sCompl.innerText = list.studyRecruitEnabled;
    	
    	var sSub = document.createElement('p');
    	sSub.classList.add('sub');
    	sSub.innerText = list.studyRecruitField;
    	
    	var sTitle = document.createElement('h2');
    	sTitle.innerText = list.studyPostTitle;
    	
    	var sInfo = document.createElement('p');
    	
	    	var sUserId = document.createElement('span');
	    	sUserId.innerText = list.userId;
	    	
	    	var sRegDt = document.createElement('span');

	    	//sRegDt.innerHTML = dateFormat(list.studyRegDt,"yyyy-MM-dd HH:mm");
	    	console.log(list.studyRegDt);
	    	//sRegDt.innerHTML = `<fmt:formatDate value='${list.studyRegDt}' pattern="yyyy-MM-dd HH:mm" />`;
	    	//sRegDt.innerText = list.studyRegDt;
	    	
	    	var sViewCnt = document.createElement('span');
	    	sViewCnt.innerHTML +='<i class="fa fa-eye" aria-hidden="false"></i>';	    	
	    	sViewCnt.innerHTML += list.studyViewCnt;
	    	
	    	var sCmtCnt = document.createElement('span');
	    	sCmtCnt.innerHTML +='<i class="fa fa-comment-o" aria-hidden="false"></i>';
	    	sCmtCnt.innerHTML += list.studyCmtCnt;
    	
    	sInfo.appendChild(sUserId);
    	sInfo.appendChild(sRegDt);
    	sInfo.appendChild(sViewCnt);
    	sInfo.appendChild(sCmtCnt);
    	
    	sContainer.appendChild(sCompl);
    	sContainer.appendChild(sSub);
    	sContainer.appendChild(sTitle);
    	sContainer.appendChild(sInfo);
    	
    	//console.log(sContainer);
    	itemContainer.appendChild(sContainer);
    	
    	

    	
    }
    
    )
    let ele = document.getElementsByClassName("completed");
	for (let i = 0; i<ele.length ; i++){
	
		if (ele[i].innerText == 'Y'){
			ele[i].innerText = '모집중';
			ele[i].style.background = '#7D9EF8';
			ele[i].style.color = 'white';
		} else if(ele[i].innerText != '모집중') {
			ele[i].innerText  = '마감';
		}
	}    
  }
	
}
xhr.open('POST', '/bitcomu/study/studyList_ajax.do', true);
xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xhr.send(`pageNo=${pageNo}`);
pollingForData = true;

document.addEventListener('scroll', function() {
        distToBottom = getDistFromBottom();
    
        
        if ((window.pageYOffset -17) == (document.body.offsetHeight - window.innerHeight)) {
          pollingForData = true;
          pageNo++;
      
          xhr.open('POST', '/bitcomu/study/studyList_ajax.do', true);
          xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
          xhr.send(`pageNo=${pageNo}`);
        }
     
    		
    		
});



