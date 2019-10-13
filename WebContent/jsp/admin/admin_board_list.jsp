<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="게시판 관리" />
</c:import> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datatables.min.css">
 <script src="${pageContext.request.contextPath}/resources/js/datatables.min.js"></script>
<style>

	thead td:last-child {
    	text-align: center;
	}
	tbody td:last-child {
    	text-align: center;
	}
	table {width: 80%}
	
	.pagination>li {
    	display: inline-block;
	}

	ul.pagination.nams {
	    width: 400px;
	    margin: 10px auto;
	    display: block;
	}

	.ns_search {
	    width: 400px;
	    display: block;
	    margin: 0px auto;
	}

	.ns_listlength {
		float: right;
	}
	.button_box_sj.box_email_sj {
		width: 160px;
		height: 30px;
	}
	
</style>


</head>
<body>
   <div class="wrapepr">

     
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
     <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
          <section class="content">
       <div class="tab-box sj">
	      <ul class="sj">
	      <li class="sj"><a href="${pageContext.request.contextPath}/admin/adminUserList.do">유저관리</a></li>
	      <li class="sj selected"><a href="${pageContext.request.contextPath}/admin/boardAllListForm.do">게시판 관리</a></li>
	      </ul>
	      
   		</div> 
			
  			<div>
			  <button type="button" class="button_box_sj box_email_sj" id="delSelBoard">선택 게시판 삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <button type="button" class="button_box_sj box_email_sj" id="delSelAllBoard">선택 게시판 전체 삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <button type="button" class="button_box_sj box_email_sj" id="delAllBoard">전체 게시판 삭제</button>
          	</div>

            <div class="ns_listlength">
            
              	게시판 형태 
                <select name="viewBoard" id="viewBoard">
                
                    <option value="all">전체 게시판</option>
                    <c:forEach var="boardVal" items="${boardCode}">
                    	<option value="${boardVal.codeValue}">${boardVal.codeName}</option>
                    </c:forEach>
                    
                </select>
              	
              	
                <select name="changeList" id="changeList">
                    <option value="10" selected>10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                </select>씩 보기
                
            </div>
            
              
			<table id="table_id" class="display">
			    <thead>
			        <tr>
			            <td style="margin: 0 auto; padding: 10px;"><input type="checkbox" id="allChk"/></td>
			            <td><b>유저아이디</b></td>
			            <td><b>유저이름</b></td>
			            <td><b>제목</b></td>
			            <td><b>등록날짜</b></td>
			            <td><b>게시판형태</b></td>
			        </tr>
			    </thead>
			    <tbody>
			    <c:if test="${empty boardList}">
			    <tr>
			    <td colspan="5" align="center">등록된 게시글이 없습니다.
			    </td>
			    </tr>
			    </c:if>
			        <c:forEach var="board" items="${boardList}">
                  <tr>
                  	  <td><input type="checkbox" name="delChk" class="delChk" value="${board.postNo}||${board.codeName}"/></td>
                      <td>${board.userId}</td>
                      <td>${board.userName}</td>
                      <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
                      <c:choose>
	                      <c:when test="${board.codeName eq '자유게시판'}">
	                      	  <a target="_blank" href="<c:url value="/talk/talk_detail.do?postNo=${board.postNo}&pageNo=1"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '공지게시판'}">
	                       	  <a target="_blank" href="<c:url value="/notice_detail.do?postNo=${board.postNo}&pageNo=1"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '온라인강의게시판'}">
	                      	<a target="_blank" href="<c:url value="/onlineclass/p.do?no=${board.postNo}&subj=${board.subject}"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '팀프로젝트게시판'}">
	                      	<a target="_blank" href="<c:url value="/team/teamBoardDetail.do?teamBoardNo=${board.postNo}"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '투표게시판'}">
	                      	<a target="_blank" href="<c:url value="/vote/votedetail.do?voteNo=${board.postNo}"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '스터디게시판'}">
	                      	<a target="_blank" href="<c:url value="/study/studydetail.do?studyPostNo=${board.postNo}"/>">${board.postTitle}</a>
	                      </c:when>
	                      <c:when test="${board.codeName eq '질문답변게시판'}">
	                      	<a target="_blank" href="#" >${board.postTitle}</a>
	                      </c:when>
                      </c:choose>
                      
                      <td><fmt:formatDate value="${board.regDt}" pattern="yyyy-MM-dd"/></td>
                      <td>${board.codeName}</td>

                  </tr>
                </c:forEach>
			    </tbody>
			</table>

  
          

            
              <ul class="pagination nams">
                <c:if test="${pr.count ne 0}">
			  	<c:if test="${pr.prev}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${pr.beginPage -1}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if><c:if test="${!empty codeValue}">&codeValue=${codeValue}</c:if>" aria-label="previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			   
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    	<li 
			    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
			    	><a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${i}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if><c:if test="${!empty codeValue}">&codeValue=${codeValue}</c:if>">${i}</a></li>
			    </c:forEach>
			  	<c:if test="${pr.next}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${pr.endPage + 1}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if><c:if test="${!empty codeValue}">&codeValue=${codeValue}</c:if>" aria-label="next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
		</c:if>
		</ul>
            
            
	
            
        <div class="ns_search">
            search : 
            <select name="searchList" id="searchList">
                <option value="all" selected>제목 + 내용</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="userid">유저아이디</option>
                <option value="username">유저이름</option>
                
            </select>
            <input type="text" name="search" id="searchValue" value="${search.searchWord}">
            <button type="button" id="doSearchUser" name="searchVal">검색</button>
        </div> 
      </section>  
        
        
        
        
        
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <%-- <%@ include file="../include/footer.jsp"%> --%>
    <!--// 푸터 끝-->
    
    


  </div>
  <script>
  
  
  let talkList = new Array();
  let noticeList = new Array();
  let onlineList = new Array();
  let teamList = new Array();
  let voteList = new Array();
  let studyList = new Array();
  let qnaList = new Array();
  
  
  
  
  
  $(document).ready( function () {
	    $('#table_id').DataTable({
	    	 paging: false,
	    	 searching: false,
	    	 ordering:  false,
	    	 Showing: false,
	    	 bInfo: false
	    });
	   
	} );

	let sList = document.querySelector("#searchList").value;
	let viewBoardList = document.querySelector("#viewBoard");
	let viewBoard = document.querySelector("#viewBoard").value;
	let viewBoardVal = document.querySelectorAll("#viewBoard > option");
	let optVal = document.querySelectorAll("#searchList > option");
	let changeList = document.querySelector("#changeList");
	let sValue = document.querySelector("#searchValue").value;
	let doSearchUser = document.querySelector("#doSearchUser");
	let selectedValue = document.querySelector("#changeList").value;
	let changeVal = document.querySelectorAll("#changeList > option");
	let allChk = document.querySelector("#allChk");
	let delChk = document.querySelectorAll(".delChk");
	
	
	let delSelBoard = document.querySelector("#delSelBoard");
	let delSelAllBoard = document.querySelector("#delSelAllBoard");
	let delAllBoard = document.querySelector("#delAllBoard");
	
	delSelBoard.addEventListener("click", (e) => {
		let flag = true;
		delChk = document.querySelectorAll(".delChk");
		
		
		for (let i =0; i < delChk.length; i++) {
			if (delChk[i].checked) {
				let result = delChk[i].value.split("||");
				if (result[1] == '자유게시판') talkList.push(parseInt(result[0]));
 				else if (result[1] == '공지게시판') noticeList.push(parseInt(result[0]));
				else if (result[1] == '온라인강의게시판') onlineList.push(parseInt(result[0]));
				else if (result[1] == '팀프로젝트게시판') teamList.push(parseInt(result[0]));
				else if (result[1] == '투표게시판') voteList.push(parseInt(result[0]));
			    else if (result[1] == '스터디게시판') studyList.push(parseInt(result[0]));
				else if (result[1] == '질문답변게시판') qnaList.push(parseInt(result[0]));	
				flag = false;
			}
		}
		if (flag) {
			alert('삭제할 게시판을 선택하세요.');
			return false;
		}
		let jsonData = {};
		if (talkList.length > 0) jsonData["1"] = talkList;
		if (noticeList.length > 0) jsonData["2"] = noticeList;
		if (onlineList.length > 0) jsonData["3"] = onlineList;
		if (teamList.length > 0) jsonData["4"] = teamList;
		if (voteList.length > 0) jsonData["5"] = voteList;
		if (studyList.length > 0) jsonData["6"] = studyList;
		if (qnaList.length > 0) jsonData["7"] = qnaList;
		
		
		let result = confirm("정말 선택한 게시판을 삭제하시겠습니까?");
		if (result) {
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
							alert("삭제 되었습니다.");
							location.href = '${pageContext.request.contextPath}/admin/boardAllListForm.do?searchType=' + sList + '&searchWord=' + sValue + '&pageList=' + selectedValue + '&codeValue=' + viewBoard;
						} else {
							alert("시스템 오류입니다. 다시 시도해 주세요.")
						}
				}
			};	
			xhr.open("POST", "boardSelectDel.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("data=" + JSON.stringify(jsonData));
		} else {
			alert("취소되었습니다.");
		}
		
	});
	
	
	delSelAllBoard.addEventListener("click", (e) => {
		let flag = true;
		if(viewBoard == 'all') {
			alert("삭제할 게시판을 선택 후 삭제 버튼을 눌러주세요.");
			return false;
		}
		
		let result = confirm("정말 선택한 게시판 전체를 삭제하시겠습니까?");
		if (result) {
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
							alert("선택한 게시판이 전체 삭제 되었습니다.");
							location.href = '${pageContext.request.contextPath}/admin/boardAllListForm.do?&codeValue=' + viewBoard;
						} else {
							alert("시스템 오류입니다.")
						}
				}
			};	
			xhr.open("POST", "boardSelectAllDel.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("delSelAllBoard=" + viewBoard);
		} else {
			alert("취소되었습니다.");
		}
		
	});
	
	
	delAllBoard.addEventListener("click", (e) => {
		let result = confirm("정말 선택한 게시판 전체를 삭제하시겠습니까?");
		if (result) {
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
							alert("선택한 게시판이 전체 삭제 되었습니다.");
							location.href = '${pageContext.request.contextPath}/admin/boardAllListForm.do';
						} else {
							alert("시스템 오류입니다.")
						}
				}
			};	
			xhr.open("POST", "boardAllDel.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("data=allDelete");
		} else {
			alert("취소되었습니다.");
		}
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	allChk.addEventListener("click", (e) => {
		for (let i =0; i < delChk.length; i++) {
			delChk[i].checked = allChk.checked;
		}
	});
	
	
	for (let i = 0; i < optVal.length; i++) {
		if (optVal[i].value == '${search.searchType}') {
			optVal[i].selected = true;
			sList = optVal[i].value;
		}
	}
	
	for (let i = 0; i < changeVal.length; i++) {
		if (changeVal[i].value == '${pageList}') {
			changeVal[i].selected = true;
			selectedValue = changeVal[i].value;
		}
	}
	
	for (let i = 0; i < viewBoardVal.length; i++) {
		if (viewBoardVal[i].value == '${codeValue}') {
			
			viewBoardVal[i].selected = true;
			viewBoard = viewBoardVal[i].value;
		}
	}
	
	
	
	doSearchUser.addEventListener("click", function (e) {
		sList = document.querySelector("#searchList").value;
		sValue = document.querySelector("#searchValue").value;
		location.href='${pageContext.request.contextPath}/admin/boardAllListForm.do?searchType=' + sList + '&searchWord=' + sValue + '&pageList=' + selectedValue + '&codeValue=' + viewBoard;
         
    });    


	
	changeList.addEventListener("change", function (e) {
		
	    let selectedValue = changeList.options[changeList.selectedIndex].value;

		location.href='${pageContext.request.contextPath}/admin/boardAllListForm.do?searchType=' + sList + '&searchWord=' + sValue + "&pageList=" + selectedValue + '&codeValue=' + viewBoard;
         
    });    
	
	viewBoardList.addEventListener("change", function (e) {
		
		viewBoard = viewBoardList.options[viewBoardList.selectedIndex].value;

		location.href='${pageContext.request.contextPath}/admin/boardAllListForm.do?searchType=' + sList + '&searchWord=' + sValue + "&pageList=" + selectedValue + '&codeValue=' + viewBoard;
         
    });    
  </script>
</body>
</html>



