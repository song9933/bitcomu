<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="게시판 관리" />
</c:import> 
</head>
<body>
   <div class="wrapepr">
     
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280" style="
    position: relative;">
       <div class="tab-box sj">
      <ul class="sj" style="position: absolute;
    		top: -10px;
    		left: 100px;">
      <li class="sj"><a href="${pageContext.request.contextPath}/admin/adminUserList.do">유저관리</a></li>
      <li class="sj selected"><a href="${pageContext.request.contextPath}/admin/boardAllListForm.do">게시판 관리</a></li>
      </ul>
    </div> 
         <section class="content ns_content">
			
            <h1 class="ns_Title"></h1>
			


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
            
              

  			
     		<div class="ns_table">
                <ul class="ns_TableListHead">
                    <li>
                    	<span>유저아이디</span>
                        <span>제목</span>
                        <span>유저이름</span>
                        <span>날짜</span>
                        <span>게시판형태</span>
                        <span></span>
                    </li>
                    
                </ul>
                
                <c:if test="${empty boardList}">
				<li>
					<span></span>
					<span colspan='4'>등록된 게시글이 없습니다.</span>
				</li>
				</c:if>
                
                

                
                <ul class="ns_TableListBody">
                <c:forEach var="board" items="${boardList}">
                  <li>
                      <span>${board.userId}</span>
                     
                      <span>
                      
                      <c:choose>
                      <c:when test="${board.codeName eq '자유게시판'}">
                      	  <a target="_blank" href="<c:url value="/talk_detail.do?postNo=${board.postNo}&pageNo=1"/>">${board.postTitle}</a>
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
                    
                      
                      
                      
                      
                      
                      </span>
                      
                      
                      
                      <span>${board.userName}</span>
                      <span><fmt:formatDate value="${board.regDt}" pattern="yyyy-MM-dd"/></span>
                      <span>${board.codeName}</span>
                      <span></span>
<!--                       <span style="margin-left: 20px;"> -->
<%--                       <form method="POST" action="<c:url value="/admin/adminUserDelete.do"/>">  --%>
<%--                    			<input type="hidden" name="userNo" value="${member.userNo}"> --%>
<%--                    			<input type="hidden" name="pageNo" value="${pr.pageNo}"> --%>
<!--                       		<button type="submit" class="button_box_sj box_email_sj"> -->
<!--                       				강제 탈퇴 -->
<!--                       		</button> -->
<!--                       </form>               -->
<!--                       </span> -->

                  </li>
                </c:forEach>
            
                </ul>
            </div>
  
  
          

            
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
  // $(document).ready(alert());
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
		console.log(viewBoardVal[i].value);
// 		console.log('@@@@' + '${codeValue}');
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



