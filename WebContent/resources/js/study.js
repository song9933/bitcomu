var pageNo = 1;
var xhr = new XMLHttpRequest();
var itemContainer =  document.getElementById('list');



 xhr.onreadystatechange = function(){
  if(xhr.readyState == 4 && xhr.status == 200) {
	
    data = xhr.responseText;
    dataObj = JSON.parse(data);
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
	    	sUserId.style.marginRight = '5px';
	    	
	    	var sRegDt = document.createElement('span');
	    	sRegDt.innerHTML = list.studyRegDt;
	    	sRegDt.style.marginRight = '5px';
	    	
	    	var sViewCnt = document.createElement('span');
	    	sViewCnt.innerHTML +='<i class="fa fa-eye" aria-hidden="false"></i>';
	    	sViewCnt.style.marginRight = '5px';
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
xhr.send(`pageNo=${pageNo}&searchType=${searchType}&searchWord=${searchWord}`);

document.addEventListener('scroll', function() {
	
        if ((window.scrollY - 15) >= (document.body.offsetHeight - window.innerHeight)) {
          pageNo++;
          xhr.open('POST', '/bitcomu/study/studyList_ajax.do', true);
          xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
          xhr.send(`pageNo=${pageNo}&searchType=${searchType}&searchWord=${searchWord}`);
        }
     	
});

/**
 * 검색결과 가져오기
 */
doSearchStudy.addEventListener('click', e => {
	let schWord = document.getElementById('keyword').value;
	let schType = document.getElementById('selectType').value;

	location.href='/bitcomu/study/studyList.do?searchType='+schType+'&searchWord='+schWord;
})

let selList = document.querySelectorAll("#selectType > option");
for (let i = 0 ; i < selList.length ; i++) {
	if(selList[i].value == `${searchType}`){	
		selList[i].selected = true;
	}
}

