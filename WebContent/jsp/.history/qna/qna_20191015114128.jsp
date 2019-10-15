<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="질문답변" />
</c:import> 
  
</head>

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
		
		
		<!-- 리스트 출력시작 -->
		
		<div class="qna_inner">
		
		</div>
<%-- 
		<c:forEach var="b" items="${qna}">
          <div class="qna_accordion vertical" >   	
        	<div method='post' action="/bitcomu/qna/qnaList.do">
            <h3 class="qna_title_1" onclick="changeView('${b.qnaNo}');">${b.qnaTitle}</h3>
    		<i class="fa fa-lock qna_pd10" style="font-size: 2em" aria-hidden="true"></i>
               <!-- 수정버튼 -->
                   <span class="qna_updat_1">
					 <a href="javascript:void(0)"
					  onclick="document.getElementById('light_1${b.qnaNo}').style.display='block'; document.getElementById('fade_1${b.qnaNo}').style.display='block'"
					  style="font-weight: bold">수정</a>
				   </span>
			  <!-- 삭제버튼 -->
				   <span class="qna_delete_1">
					  <a href="javascript:void(0)"
					  onclick="document.getElementById('light${b.qnaNo}').style.display='block'; document.getElementById('fade${b.qnaNo}').style.display='block'"
					  style="font-weight: bold">삭제</a>
				   </span>
				  
    		 <div class="qna_content_1" id="${b.qnaNo}">	 	
    		 		<p>공개여부 ${b.qnaPublicEnabled} 조회수 ${b.qnaViewCnt}</p>  
                    <p>${b.userId}</p>
                    <p>${b.qnaContent}</p>
                    <p><fmt:formatDate value="${b.qnaRegDt}"
											pattern="yyyy-MM-dd HH:mm" /></p>
				
					<c:forEach var="cmt" items="${b.commentList}">
					<div class="qna_cmt_content" id="${cmt.cmtNo}">
 				  	<form method='post' action="/bitcomu/qna/qnaCommentList.do" >
                        <p>${cmt.userId}</p>
                        <p>${cmt.cmtContent}</p>
                        <p>${cmt.cmtRegDt}</p>			
					</form> 
			 		</div>
			 		<div class="wrapper qna_comment">
					<div class="item parent">
						<!-- 댓글수정 폼 팝업 -->
						<a href="#popupMod">수정</a>
							  <form method="post" action="<c:url value="/qna/qnaCommentUpdate.do"/>">
									<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
									<input type="hidden" name="qnaNo" value="${b.qnaNo}" />
								<div id="popupMod" class=layer>
									<div class="box">
										<textarea id="comment" name="cmtContent" cols="30" rows="10">${cmt.cmtContent}</textarea>
										<button type="submit" class="close">수정</button>								
										<button type="button" onclick="location.href='#'" class="close">취소</button>
									</div>
									</div>
							  </form>
						 <!-- 댓글 삭제 팝업-->	
						 <a href="#popupDelCmt">삭제</a>
								<form method="post" action="<c:url value="/qna/qnaCommentDelete.do"/>">
									<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
									<input type="hidden" name="qnaNo" value="${b.qnaNo}" />									
								<div id="popupDelCmt" class=layer>
									<div class="box">
										<p class="text">삭제 하시겠습니까?</p>
										<button type="submit" class="delete">삭제</button> 
										<button type="button" onclick="location.href='#'" class="close">취소</button>
									</div>
								</div>
								</form>
							</div>
						</div>	
					</c:forEach>
			            
                <form method='post' action="/bitcomu/qna/qnaCommentWrite.do" >
                    <input type="hidden" class="qna_text_content_2" name="boardPostNo" style="resize: none" placeholder="Comment" value="${b.qnaNo}"/>
                    <input type="text" class="qna_text_content_2" name="cmtContent" style="resize: none" placeholder="Comment"/>
                    <button type="submit" class="qna_button_2">댓글</button>
				</form>
                      	
             	</div> 
             </div>               	
    	</div>
    	   
    	<!-- 삭제 팝업 -->
      <div id="light${b.qnaNo}" class="qna_white_content">
      	<form method='post' action="/bitcomu/qna/qnaDelete.do" >
      		<input type="hidden" name="qnaNo" value="${b.qnaNo}" /> 
      		<a href="javascript:void(0)" onclick="document.getElementById('light${b.qnaNo}').style.display='none'; document.getElementById('fade${b.qnaNo}').style.display='none'" />
          		<div class="qna_delete_2"><p>삭제 하시겠습니까?</p></div> 
          		<div class="qna_button_1" style="resize: none">
          		<div><button type="submit" class="qna_button_0" >삭제</button></div>
          		<div><button type="button" onclick="location.href='#'" class="qna_button_0">취소</button></div>
      			</div>
        </form>
      </div>
      <div id="fade${b.qnaNo}" class="qna_black_overlay"></div>
        <!-- 수정 팝업 -->
  	  <div id="light_1${b.qnaNo}" class="qna_white_content_1">
  	  	<form method='post' action="/bitcomu/qna/qnaUpdate.do">
  			<input type="hidden" name="qnaNo" value="${b.qnaNo}" /> 
  			<input type="hidden" name="selBoardNo" value="${b.qnaNo}" /> 
  				<a href="javascript:void(0)"
    			onclick="document.getElementById('light_1${b.qnaNo}').style.display='none'; document.getElementById('fade_1${b.qnaNo}').style.display='none'"></a>
    	<div class="qna_update_title">   
      		<input type="text" class="qna_text_title_1" name="qnaTitle" style="resize: none" placeholder="Title" value="${b.qnaTitle}" />
      		<input type="checkbox" id="check_0" value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
      		<input type="text" class="qna_text_content_1" name="qnaContent" style="resize: none" placeholder="Content" value="${b.qnaContent}" />
      <div>
      </div>
 <!-- <div><input type="file" class="qna_update_attatch" enctype="multipart/form-data" name="attach" /></div> -->
      <div><button type="submit" class="qna_button_update">수정</button></div>
      <div><button type="button" onclick="location.href=''" class="qna_button_cancle">취소</button></div> 
    </div> 
     </form>   
  </div>
  <div id="fade_1" class="qna_black_overlay_1"></div>
       
    </div>
    	</c:forEach>
    	--%>
     
        <div class="qna_board_qna_title">
           <form method='post' action="/bitcomu/qna/qnaWrite.do" >
              <input type="text" class="qna_text_title" name="qnaTitle" style="resize: none" placeholder="Title" value="${b.qnaTitle}" />
              <input type="checkbox" id="qna_check_2"  value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
			  <input type="text" class="qna_text_content" name="qnaContent" style="resize: none" placeholder="Content" value="${b.qnaContent}" /> 
              <button type="submit" class="qna_button">등록</button>
         <!-- <input type="file" class="qna_attatch" enctype="multipart/form-data" name="attach" /> -->
          	</form>
         </div>
         
          <div class="qna_search">
              <input type="text" class="qna_text_search" name="searchWord" style="resize: none" placeholder="Search" />
              <select name="select" class="qna_select_1">
                  <option value="1">작성자</option>
                  <option value="2">제목+작성자</option>
                  <option value="3">제목</option>
                  <option value="4">내용</option>
              </select>
              <button type="button" onclick="" class="qna_button_serch">검색</button>
            </div>
        </div>
      </section>

      <%@include file="/jsp/include/footer.jsp" %>



    </div>
	  
    <script>
//     let boardNo = ${boardNo};
        
        let selectBoardNo = ${selBoardNo};
    	let a = document.querySelectorAll(".qna_content_1");
    	a.className = "hidden";
//     	a.addEventListener("click", changeView())
//     	for (let i = 0; i < a.length; i++) {
//     		a[i].className = "hidden";
//     	if (a[i].id == boardNo) a[i].className = "hidden";
//     	}
        if (selectBoardNo != 0) {
	        let divEle2 = document.getElementById(selectBoardNo);
	        divEle2.classList.remove("hidden");
	        divEle2.classList.add("show");
        	
        }	
		
        
        function changeView(i) {
	        let divEle = document.getElementById(i);
	        divEle.classList.toggle("show");
	        divEle.classList.toggle("hidden");
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
        				console.log('dd',qlist);
        				// makeCommentList(list);
        				if(qlist.length == 0){
        					//만약 검색을 통해 받아온리스트가 아예 0일때
        						if(searchSwitch){
        							alert('검색결과가 존재하지 않습니다.');
        						}
        					page--;
        				} else {
        				loadMore(qlist);
        				}
        			}
        		}
        	};
//         	if(keyword){
//         		xhr.open("GET", "/bitcomu/qna/qnasearchajax.do?pageno="+page+"&keyword="+keyword, true);
//         		xhr.send();
//         	}else{
        		xhr.open("GET", "/bitcomu/qna/qnalistajax.do?pageno="+page, true);
        		xhr.send();
//         	}
        }
        qnaListAjax();


        function loadMore(qlist) {
        	console.log(qlist.length);
        		let okok = document.querySelector(".qna_inner");
        		//검색 한번에 한번 실행되는 스위치.
        		if(searchSwitch) {
        			document.querySelector(".qna_inner").innerHTML = "";
        		}
       			let html = "";
//         			document.querySelector(".qna_inner").innerHTML += 
        		for(var i = 0; i < qlist.length; i++){
        			let b = qlist[i];
        			console.log('b는', b);
        			
				html +=`
          			<div class="qna_accordion vertical" >	
        			<div method='post' action="/bitcomu/qna/qnaList.do">
            		<h3 class="qna_title_1" onclick="changeView(\${b.qnaNo});">\${b.qnaTitle}</h3>
    				<i class="fa fa-lock qna_pd10" style="font-size: 2em" aria-hidden="true"></i>
    				
                   <span class="qna_updat_1">
					 <a href="javascript:void(0)"
					  onclick="document.getElementById('light_1\${b.qnaNo}').style.display='block'; document.getElementById('fade_1\${b.qnaNo}').style.display='block'"
					  style="font-weight: bold">수정</a>
				   </span>
				   
				   <span class="qna_delete_1">
					  <a href="javascript:void(0)"
					  onclick="document.getElementById('light\${b.qnaNo}').style.display='block'; document.getElementById('fade\${b.qnaNo}').style.display='block'"
					  style="font-weight: bold">삭제</a>
				   </span>
				  
    		 <div class="qna_content_1 hidden" id="\${b.qnaNo}">	 	
    		 		<p>공개여부 \${b.qnaPublicEnabled} 조회수 \${b.qnaViewCnt}</p>  
                    <p>\${b.userId}</p>
                    <p>\${b.qnaContent}</p>
                    <p>\${b.qnaRegDt}</p>`;
                    
                    /* 댓글 부분 추출장소 */
                    if(qlist[i].commentList != null){
                    	 console.log('코멘트 리스트', qlist[i].commentList);
         				for(var j = 0; j < qlist[i].commentList.length; j++){
         					let cmt = qlist[i].commentList[j];
         					html += `
         					<div class="qna_cmt_content" id="\${cmt.cmtNo}">
         				  	<form method='post' action="/bitcomu/qna/qnaCommentList.do" >
                                 <p>\${cmt.userId}</p>
                                 <p>\${cmt.cmtContent}</p>
                                 <p>\${cmt.cmtRegDt}</p>
         					</form> 
         			 		</div>
         			 		<div class="wrapper qna_comment">
         					<div class="item parent">
         						/* 댓글수정 폼 팝업 */
         						<a href="#popupMod">수정</a>
         							  <form method="post" action="bitcomu/qna/qnaCommentUpdate.do">
         									<input type="hidden" name="cmtNo" value="\${cmt.cmtNo}" /> 
         									<input type="hidden" name="qnaNo" value="\${b.qnaNo}" />
         								<div id="popupMod" class=layer>
         									<div class="box">
         										<textarea id="comment" name="cmtContent" cols="30" rows="10">${cmt.cmtContent}</textarea>
         										<button type="submit" class="close">수정</button>								
         										<button type="button" onclick="location.href='#'" class="close">취소</button>
         									</div>
         									</div>
         							  </form>
         						 /* 댓글 삭제 팝업 */	
         						 <a href="#popupDelCmt">삭제</a>
         								<form method="post" action="bitcomu/qna/qnaCommentDelete.do"/>">
         									<input type="hidden" name="cmtNo" value="\${cmt.cmtNo}" /> 
         									<input type="hidden" name="qnaNo" value="\${b.qnaNo}" />									
         								<div id="popupDelCmt" class=layer>
         									<div class="box">
         										<p class="text">삭제 하시겠습니까?</p>
         										<button type="submit" class="delete">삭제</button> 
         										<button type="button" onclick="location.href='#'" class="close">취소</button>
         									</div>
         								</div>
         								</form>
         							</div>
         						</div>`;	
         					}
                    }
                   
                    
                    /* 댓글부분 추출끝 장소 */
					
					html +=`<form method='post' action="/bitcomu/qna/qnaCommentWrite.do" >
                    <input type="hidden" class="qna_text_content_2" name="boardPostNo" style="resize: none" placeholder="Comment" value="\${b.qnaNo}"/>
                    <input type="text" class="qna_text_content_2" name="cmtContent" style="resize: none" placeholder="Comment"/>
                    <button type="submit" class="qna_button_2">댓글</button>
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
  	  	<form method='post' action="/bitcomu/qna/qnaUpdate.do">
  			<input type="hidden" name="qnaNo" value="\${b.qnaNo}" /> 
  			<input type="hidden" name="selBoardNo" value="\${b.qnaNo}" /> 
  				<a href="javascript:void(0)"
    			onclick="document.getElementById('light_1\${b.qnaNo}').style.display='none'; document.getElementById('fade_1\${b.qnaNo}').style.display='none'"></a>
    	<div class="qna_update_title">   
      		<input type="text" class="qna_text_title_1" name="qnaTitle" style="resize: none" placeholder="Title" value="\${b.qnaTitle}" />
      		<input type="checkbox" id="check_0" value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
      		<input type="text" class="qna_text_content_1" name="qnaContent" style="resize: none" placeholder="Content" value="\${b.qnaContent}" />
      <div>
      </div>
 <!-- <div><input type="file" class="qna_update_attatch" enctype="multipart/form-data" name="attach" /></div> -->
      <div><button type="submit" class="qna_button_update">수정</button></div>
      <div><button type="button" onclick="location.href=''" class="qna_button_cancle">취소</button></div> 
    </div> 
     </form>   
  </div>
  <div id="fade_1" class="qna_black_overlay_1"></div>
       
    </div>
    	        		
        		`;
        		}
        		document.querySelector(".qna_inner").innerHTML += html;
        		searchSwitch = false;
        		userInput = "";
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
        
   
    </script>
</body>
</html>