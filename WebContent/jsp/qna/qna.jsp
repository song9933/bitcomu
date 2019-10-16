<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="질문답변" />
</c:import> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<style>

</style>
<body>
  <div class="wrapepr">
   <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영역">
    </div>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
      <section class="qna_content"  style="margin-bottom:0">
        <div>
         <strong class="qna_title">질문 답변</strong>
		</div>
		<!-- 검색창 -->
				<div class='qna-container' tabindex='1'>
					<div class='qna-search-container' tabindex='1'>
						<input class='qna-input' id='qna-input-content' placeholder='search' type='text'> 				
						<a class='qna-button' id='qna-submit-button'>
							<i class="fa fa-search icon-search" ></i>
						</a>	
					</div>
						<a class='qna-button' id='qna-refresh-button'>
							<i class="fa fa-refresh icon-search" ></i>
						</a>
				</div>
				<!-- 게시글 등록 -->
				<div class="qna_board_qna_title">
           			<form method='post' action="/bitcomu/qna/qnaWrite.do" name="crForm1">
              			<input type="text" class="qna_text_title" name="qnaTitle" style="resize: none" placeholder="Title" value="${b.qnaTitle}" />
              			<input type="checkbox" id="qna_check_2" name="qnaEnabled" value="N"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
			  			<input type="text" class="qna_text_content" name="qnaContent" style="resize: none" placeholder="Content" value="${b.qnaContent}" /> 
              			<button type="button" onclick="chkNullQna()" class="qna_button">등록</button>
         <!-- <input type="file" class="qna_attatch" enctype="multipart/form-data" name="attach" /> -->
          			</form>
         		</div>
				<!-- 리스트 출력시작 -->
		
		<div class="qna_inner"></div>

        </div>
      </section>
      <%@include file="/jsp/include/footer.jsp" %>

    </div>
	  
    <script>
    	let enabledFlag = false;
//      let boardNo = ${boardNo};
        
        let selectBoardNo = ${selBoardNo};
    	let a = document.querySelectorAll(".qna_content_1");
    	a.className = "hidden";
//     	a.addEventListener("click", changeView())
//     	for (let i = 0; i < a.length; i++) {
//     		a[i].className = "hidden";
//     	if (a[i].id == boardNo) a[i].className = "hidden";
//     	}
        	
        
        function loadMore2(boardNo) {
        	let xhr = new XMLHttpRequest();
        	xhr.onreadystatechange = function() {
        		if (xhr.readyState == 4 && xhr.status == 200) {
//         			console.log(xhr.responseText);
       				let result = JSON.parse(xhr.responseText);
       				
       				if (result[0] != 1) {
       					alert("시스템 오류 발생했습니다.");
       					return;
       				}
       				let targetPlace = document.querySelector("#c" + boardNo + " > span:nth-child(1)");
       				targetPlace.innerText = "조회수 " + result[1];
        			
        		}
        	};
        	
        		xhr.open("POST", "/bitcomu/qna/QnaViewCntAjax.do", true);
        		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        		xhr.send("qnaNo=" + boardNo);
        	
        }
        
        function loadMore3(boardNo, userNo) {
        	let xhr = new XMLHttpRequest();
        	xhr.onreadystatechange = function() {
        		if (xhr.readyState == 4 && xhr.status == 200) {
//         			console.log(xhr.responseText);
        			let result = JSON.parse(xhr.responseText);
       				
       				if (result[0] =='already') {
       					alert("좋아요 를 이미 누르셨습니다.");
       					return;
       				}
       				else if (result[0] =='error') {
       					alert("시스템 오류입니다.");
       					return;
       				} else {
       					alert("좋아요 성공!");
       				}
       				
       				
       				let targetPlace = document.querySelector("#c" + boardNo + " > span:nth-child(2)");
       				targetPlace.innerHTML = "&nbsp;&nbsp;좋아요 수&nbsp;&nbsp;" + result[1] + "&nbsp;&nbsp;"
        			
        		}
        	};
        	
        		xhr.open("POST", "/bitcomu/qna/QnaLikeAjax.do", true);
        		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        		xhr.send("qnaNo=" + boardNo + "&userNo=" + userNo);
        	
        }
        
        
        /* 무한스크롤 스크립트 시작 */
        let qlist;
        let page = 1;
        let keyword = "";
        let searchSwitch = false;
        let userInput;
        function qnaListAjax() {
        	let xhr = new XMLHttpRequest();
        	xhr.onreadystatechange = function() {
        		if (xhr.readyState == 4) {
        			if (xhr.status == 200) {
        				qlist = JSON.parse(xhr.responseText);
//         				console.log('큐리스트',qlist);
        				// makeCommentList(list);
        				if(qlist.length == 0){
        					//만약 검색을 통해 받아온리스트가 아예 0일때
        						if(searchSwitch){
        							alert('검색결과가 존재하지 않습니다.');
        							searchSwitch = false;
        						}
        					page--;
        				} else {
        				loadMore(qlist);
        				}
        			}
        		}
        	};
        	if(keyword){
//         		console.log('키워드 이프문 진입');
        		xhr.open("GET", "/bitcomu/qna/qnasearchajax.do?pageno="+page+"&keyword="+keyword, true);
        		xhr.send();
        	}else{
        		xhr.open("GET", "/bitcomu/qna/qnalistajax.do?pageno="+page, true);
        		xhr.send();
        	}
        }
        qnaListAjax();


        function loadMore(qlist) {
//         	console.log(qlist.length);
        		let okok = document.querySelector(".qna_inner");
        		//검색 한번에 한번 실행되는 스위치.
        		if(searchSwitch) {
        			document.querySelector(".qna_inner").innerHTML = "";
        		}
       			let html = "";
//         			document.querySelector(".qna_inner").innerHTML += 
        		for(var i = 0; i < qlist.length; i++){
        			enabledFlag = false;
        			let b = qlist[i];
//         			console.log('b는', b);
        				
					html +=`
		          			<div class="qna_accordion vertical" >	
		        			<div method='post' action="/bitcomu/qna/qnaList.do">`;
		        	if (`\${b.qnaPublicEnabled}` == 'N') {
// 		        				console.log(${sessionScope.user.userNo});
// 		        				console.log(b.userNo);
			        	if (${sessionScope.user.userNo} != b.userNo && ${sessionScope.user.userGrade} != 3) {
			        		html += `
			        			<h3 class="qna_title_1 qna_private">비공개 글입니다.</h3>
			        		`
			        		enabledFlag = true;
			        	}
		        	}	
		        		//관리자거나 작성자거나 공개여부가 Y라서 비공개글을 볼수 있는 경우
		        		if(!enabledFlag) {
		        			html += `<h3 class="qna_title_1" onclick="changeView(\${b.qnaNo});">\${b.qnaTitle}</h3>`;
		        		}
		        		html +=	`<i class="fa fa-lock qna_pd10" style="font-size: 2em; color: #f9f9f9" aria-hidden="true"></i>
		    				
		                   <span class="qna_updat_1">
							 <a href="javascript:void(0)"
							  onclick="updateQna(\${b.userNo}, \${b.qnaNo});"
							  style="font-weight: bold">수정</a>
						   </span>
				   
						   <span class="qna_delete_1">
							  <a href="javascript:void(0)"
								  onclick="deleteQna(\${b.userNo}, \${b.qnaNo});"
							  style="font-weight: bold">삭제</a>
						   </span>
						  
		    		 		<div class="qna_content_1 hidden" id="c\${b.qnaNo}">	 	
			    		 		<span class="qna_viewcnt">조회수 \${b.qnaViewCnt}</span><span>&nbsp;&nbsp;좋아요&nbsp;&nbsp;\${b.qnaLikeCnt}&nbsp;&nbsp;</span><i class="far fa-thumbs-up fa-1x" id="likeUpdate\${b.qnaNo}" onclick="loadMore3(\${b.qnaNo}, ${sessionScope.user.userNo})"></i>   
			                    <p style="font-weight: bold; font-size: 1.3em; color: inherit;" >\${b.userId}</p>
			                    <p>\${b.qnaContent}</p>
			                    <p>\${b.qnaRegDt}</p><hr>`;
		                    
		                    /* 댓글 부분 추출장소 */
		                    if(qlist[i].commentList != null) {
		         				for(var j = 0; j < qlist[i].commentList.length; j++) {
		         					let cmt = qlist[i].commentList[j];
// 		         					console.log('코멘트 하나하나', cmt)
		         					html += `
				         					<div class="qna_cmt_content" id="\${cmt.cmtNo}">
				         				  	<form method='post' action="/bitcomu/qna/qnaCommentList.do" >
				                                 <p style="font-weight: bold; font-size: 1.3em; color: inherit;">\${cmt.userId}</p>
				                                 <p>\${cmt.cmtContent}</p>
				                                 <p>\${cmt.cmtRegDt}</p>
				         					</form> 
				         			 		</div>
				         			 		<div class="wrapper qna_comment">`;
// 				         					console.log(${sessionScope.user.userNo});
// 				         					console.log(b.userNo);
// 				         					console.log(${sessionScope.user.userGrade});
				         					if (${sessionScope.user.userNo} == cmt.userNo || ${sessionScope.user.userGrade} == 3) {
				         					
					         					html +=	`<div class="qna_item parent">
					         						<p><a href="#popupMod\${cmt.cmtNo}">수정</a></p>
					         							  <form method="post" action="/bitcomu/qna/qnaCommentUpdate.do"  name="crForm4">
					         									<input type="hidden" name="cmtNo" value="\${cmt.cmtNo}" /> 
					         									<input type="hidden" name="qnaNo" value="\${b.qnaNo}" />
					         								<div id="popupMod\${cmt.cmtNo}" class="layer">
					         									<div class="box">
					         										<textarea id="comment" name="cmtContent" cols="30" rows="10">\${cmt.cmtContent}</textarea>
					         										<button type="button" onclick="location.href='#'" class="close">취소</button>
					         										<button type="button" onclick="chkNullQnaCmtUpdate(\${cmt.cmtNo})" class="close">수정</button>
					         									</div>
					         								</div>
					         							  </form>
					         						 <a href="#popupDelCmt\${cmt.cmtNo}">삭제</a>
					         								<form method="post" action="/bitcomu/qna/qnaCommentDelete.do">
					         									<input type="hidden" name="cmtNo" value="\${cmt.cmtNo}" /> 
					         									<input type="hidden" name="qnaNo" value="\${b.qnaNo}" />									
					         								<div id="popupDelCmt\${cmt.cmtNo}" class="layer">
					         									<div class="box">
					         										<p class="text">삭제 하시겠습니까?</>
					         										<button type="button" onclick="location.href='#'" class="close">취소</button>
					         										<button type="submit" class="delete">삭제</button>
					         									</div>
					         								</div>
					         								</form>
					         							</div>`;
				         						
				         					}
				         								
				         					html +=	`</div><hr>`;	
		         					}
		                    }
                   
                    
                    /* 댓글부분 추출끝 장소 */
					
					html +=`
								<form method='post' action="/bitcomu/qna/qnaCommentWrite.do" name="crForm3">
				                    <input type="hidden" class="qna_text_content_2" name="boardPostNo" style="resize: none" placeholder="Comment" value="\${b.qnaNo}"/>
				                    <input type="text" class="qna_text_content_2" name="cmtContent" style="resize: none" placeholder="Comment"/>
				                    <button type="button" onclick="chkNullQnaCmt(\${b.qnaNo})" class="qna_button_2">댓글</button>
								</form>
				                      	
				             	</div> 
				             </div>               	
				    	</div>
    	   
				    	<!-- 삭제 팝업 -->
				      <div id="light\${b.qnaNo}" class="qna_white_content">
				      	<form method='post' action="/bitcomu/qna/qnaDelete.do" >
				      		<input type="hidden" name="qnaNo" value="\${b.qnaNo}" /> 
				      		<a href="javascript:void(0)" onclick="document.getElementById('light\${b.qnaNo}').style.display='none'; document.getElementById('fade\${b.qnaNo}').style.display='none'" />
				          		<div class="qna_delete_2"><p>삭제 하시겠습니까?</p></div> 
				          		<div class="qna_button_1" style="resize: none">
				          		<div><button type="submit" class="qna_button_0" >삭제</button></div>
				          		<div><button type="button" onclick="location.href='#'" class="qna_button_0">취소</button></div>
				      			</div>
				        </form>
				      </div>
				      <div id="fade\${b.qnaNo}" class="qna_black_overlay"></div>
      
      
				        <!-- 수정 팝업 -->
				  	  <div id="light_1\${b.qnaNo}" class="qna_white_content_1">
				  	  	<form method='post' action="/bitcomu/qna/qnaUpdate.do" name="crForm2">
				  			<input type="hidden" name="qnaNo" value="\${b.qnaNo}" /> 
				  			<input type="hidden" name="selBoardNo" value="\${b.qnaNo}" /> 
				  				<a href="javascript:void(0)"
				    			onclick="document.getElementById('light_1\${b.qnaNo}').style.display='none'; document.getElementById('fade_1\${b.qnaNo}').style.display='none'"></a>
				    	<div class="qna_update_title">   
				      		<input type="text" class="qna_text_title_1" name="qnaTitle" style="resize: none" placeholder="Title" value="\${b.qnaTitle}" />
				      		<input type="text" class="qna_text_content_1" name="qnaContent" style="resize: none" placeholder="Content" value="\${b.qnaContent}" />
				      	<div>
				      </div>
				 <!-- <div><input type="file" class="qna_update_attatch" enctype="multipart/form-data" name="attach" /></div> -->
				      <div><button type="button" onclick="chkNullQnaUpdate(\${b.qnaNo})" class="qna_button_update">수정</button></div>
				      <div><button type="button" onclick="location.href=''" class="qna_button_cancle">취소</button></div> 
				    </div> 
				     </form>   
				  </div>
				  <div id="fade_1\${b.qnaNo}" class="qna_black_overlay_1"></div>
				       
			      </div>
    	        		
        			`;
        		
        		}
        		
        		document.querySelector(".qna_inner").innerHTML += html;
        		
				let qnaPrivate = document.querySelectorAll(".qna_private");
				
				for (let i = 0; i < qnaPrivate.length; i++) {
					qnaPrivate[i].nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML = "";
					qnaPrivate[i].nextElementSibling.style = "font-size: 2em; color: #184278;";
				}
				
				
        		searchSwitch = false;
        		userInput = "";
        		document.getElementById("qna-input-content").value = "";
        		
        		if (selectBoardNo != 0) {
                	changeView(selectBoardNo);
                }
        };	

        $(window).on("scroll", function() {
        	var scrollHeight = $(document).height();
        	var scrollPosition = $(window).height() + $(window).scrollTop();		

        	$("#scrollHeight").text(scrollHeight);
        	$("#scrollPosition").text(scrollPosition);
        	$("#bottom").text(scrollHeight - scrollPosition);
        	if (scrollPosition > scrollHeight - 200 /* && keyword == "" */) {			
        		//todo
        		page++;
            	qnaListAjax();
        	}
        });
   
    /* 검색기능구현 */
	/* 검색 Ajax */
	document.getElementById("qna-submit-button").addEventListener('click', function searchajax(){
		userInput = document.getElementById("qna-input-content").value;
		if(userInput != ""){
			keyword = userInput;
// 			console.log('클릭이벤트 끝나기 직전 키워드',keyword);
			page = 1;
			searchSwitch = true;
			qnaListAjax();
		} else {
			alert('최소 한글자이상 입력해주세요.')
		}
	});
	
	/*새로고침 기능*/
	document.getElementById("qna-refresh-button").addEventListener('click', function(){
		location.href="/bitcomu/qna/qnaList.do";
	});
	
	/* 게시글 수정에 조건 주는 펑션 */
	
	function updateQna(userNo, qnaNo){
// 		console.log('세션의유저',${user.userNo});
		let qnaId = "light_1"+ qnaNo;
		let qnaId2 = "fade_1"+ qnaNo;
		if('${user.userNo}' == userNo) {
			document.getElementById(qnaId).style.display='block';
			document.getElementById(qnaId2).style.display='block';
		} else {
			alert('작성자만 수정할 수 있습니다.');
			return;
		}
	}
	
	/* 게시글 삭제조건 주는 펑션 */
	
	function deleteQna(userNo, qnaNo){
// 		console.log('세션의유저',${user.userNo});
		let qnaId = "light"+ qnaNo;
		let qnaId2 = "fade"+ qnaNo;
		if('${user.userNo}' == userNo) {
			document.getElementById(qnaId).style.display='block';
			document.getElementById(qnaId2).style.display='block';
		} else {
			alert('작성자만 삭제할 수 있습니다.');
			return;
		}
	}
	
	/* 게시글 공백처리 펑션 */
	
	function chkNullQna() {
		let crForm1 = document.crForm1;
		if(crForm1.qnaTitle.value.trim().length == 0 || crForm1.qnaContent.value.trim().length == 0)
		{
			alert("빈값은 입력하실 수 없습니다.");
			return false;
		}	
		
		crForm1.submit();
		
	}
	
	/* 게시글 수정 공백처리 펑션 */
	
	function chkNullQnaUpdate(qnaNo) {
		let crForm2 = document.crForm2;
		for (let i = 0; i < crForm2.length; i++) {
			if (crForm2[i].qnaNo.value == qnaNo) {
				let crFomVal = crForm2[i]; 
				if(crFomVal.qnaTitle.value.trim().length == 0 || crFomVal.qnaContent.value.trim().length == 0)
				{
					alert("빈값은 입력하실 수 없습니다.");
					return false;
				}	
				crFomVal.submit();
			}
		}	
	}
	
	/* 댓글 공백처리 펑션 */
	
	function chkNullQnaCmt(qnaNo) {
		let crForm3 = document.crForm3;
		for (let i = 0; i < crForm3.length; i++) {
			if (crForm3[i].boardPostNo.value == qnaNo) {
				let crFomVal2 = crForm3[i]; 
				if(crFomVal2.cmtContent.value.trim().length == 0)
				{
					alert("빈값은 입력하실 수 없습니다.");
					return false;
				}	
				crFomVal2.submit();
			}
		}	
	}
	
/* 댓글 수정공백처리 펑션 */
	
	function chkNullQnaCmtUpdate(cmtNo) {
		let crForm4 = document.crForm4;
		for (let j = 0; j < crForm4.length; j++) {
			if (crForm4[j].cmtNo.value == cmtNo) {
				let crFomVal3 = crForm4[j]; 
				if(crFomVal3.cmtContent.value.trim().length == 0)
				{
					alert("빈값은 입력하실 수 없습니다.");
					return false;
				}	
				crFomVal3.submit();
			}
		}	
	}
	
	function changeView(i) {
        let divEle = document.getElementById(`c\${i}`);
//        	console.log(divEle);
        if (divEle.classList.contains("hidden")) {
			loadMore2(i);	        	
	        divEle.classList.toggle("show");
        }
        
        divEle.classList.toggle("hidden");
	}
    </script>
</body>
</html>