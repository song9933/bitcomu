<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <div id="ns_top"></div>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 공지 </title>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

  <script src="js/jquery-3.3.1.min.js"></script>
  <style>

  </style>
</head>
<body>
   <div class="wrapepr">
      <!-- 헤더 
   
     	헤더 끝 -->
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content ns_content">

            <h1 class="ns_Title">자유게시판</h1>


          

            <div class="ns_remote">
              <ul>
                <li>
                    <a href="#ns_top"><i class="fas fa-angle-double-up fa-2x"></i></a>
                    <a href="#ns_cmt"><i class="far fa-comment fa-2x"></i></a>
                    
                    <a href="#ns_list"><i class="fas fa-align-justify fa-2x"></i></a>
                    <a href="#ns_bottom"><i class="fas fa-angle-double-down fa-2x"></i></a>
                </li>
              </ul>
            </div>
  
            <div class="ns_table">
                <ul class="ns_TableListHead">
                    <li >
                    
                        <span>${talkDetail.postNo}</span>
                        <span>${talkDetail.title}</span>
                        <span>${talkDetail.userId }</span>
                        <span><fmt:formatDate value="${talkDetail.regDt}" pattern="MM-dd hh:mm"/></span>
                        <span>조회수${talkDetail.viewCnt}</span>
                    </li>
                    
                </ul>
                

                <ul class="ns_TableDetailBody">
                  <li>
                    ${talkDetail.content}
                  </li>
                </ul>

                <ul class="ns_TableListBody">
         		   <div id="ns_list"></div>
                  
                  <%@ include file="/jsp/talk/talk_list.jsp" %> 
                </ul>
                
             
             
             <c:choose>
	             <c:when test="${talkDetail.userNo eq sessionScope.user.userNo || sessionScope.user.userGrade eq 3 }">   
		              <div class="ns_go_update"> 
			            <a  href="/bitcomu/talk/updateTalkForm.do?postNo=${talkDetail.postNo}"> 
			               	 수정
			            </a>
		              </div>
			            <a class="ns_go_delete" href="/bitcomu/talk/talkdelete.do?postNo=${talkDetail.postNo}"> 
			              <div> 
			               	 삭제
			              </div>
			            </a>
	             </c:when>
	             <c:otherwise></c:otherwise>
             </c:choose>
            
            
            
            
            
            
            
            <a class="ns_talk_like" href="javascript:;" onclick="likeUpdateAjax(${talkDetail.postNo}, ${sessionScope.user.userNo}, ${pr.pageNo})">
           
            
           	 <i class="far fa-thumbs-up fa-3x" id="likeUpdate">${talkDetail.likeCnt}</i>
            
            </a>
            
                    
 		<div class="ns_coment_list">
          <div id="ns_cmt"></div>
           <div class="ns_member_coment">
 															
                  <form <%-- "<c:url value="/talk/comment_update.do"/>" --%> method="post"
                  	name="updateForm" onsubmit="return inputCheck();">
				<input type="hidden" name="boardPostNo" value="${talkDetail.postNo}" />
				<input type="hidden" name="cmtNo" value="${param.cmtNo}" />
				<input type="hidden" name="pageNo" value="${pr.pageNo}" />
				<input type="hidden" name="cmtPageNo" value="${cpr.pageNo}" />
			            <div id="AjaxCmtList">
				
				
	            
			<c:if test="${empty comment}">
				 <tr>
				    <td colspan='4'>댓글이 존재하지 않습니다.</td>
				 </tr>
			</c:if>	 
			            </div>
			</form>	
								  <%--
						 <table>
						 
							<c:forEach var="comment" items="${comment}">
							<c:choose>
							<c:when test="${param.cmtNo eq comment.cmtNo}">
								
								<tr>
								  <td>${comment.userId}</td>
								  <td>
								  	<textarea name="cmtCtt" rows="2" cols="60">${comment.cmtContent}</textarea>
								  </td>
								  <td colspan="2">
								  	  <input type="submit" value="수정" />
								  	  <a href="<c:url value="/talk/talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">취소</a>
								  </td>
								</tr>	
						 
							</c:when>
							<c:otherwise >
								   <th><h3>&nbsp;${comment.userId}</h3></th>
								  
								  <th>
									 <h6> ${comment.cmtRegDt}</h6>
								  </th>
								  
								  <th>
								  
								  
								  <c:if test="${ comment.userNo eq sessionScope.user.userNo || coment.userGrade eq 3}">
								  	  <a href="<c:url value="/talk/comment_delete.do?cmtNo=${comment.cmtNo}&postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">삭제</a>	
								  	  <a href="<c:url value="/talk/talk_detail.do?cmtNo=${comment.cmtNo}&postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">수정</a>	
								  </c:if>
								  
								  
								  </th>
			 						<th></th>
								    <tr>
									<td></td>
								    <td></td>
								    <td></td>
									  <td colspan="3">&emsp;${comment.cmtContent}</td>
								    </tr> 
					            
							</c:otherwise>
							</c:choose>
						</c:forEach>
								   --%>
					
						
			<c:if test="${cpr.count > 10}">
             <div>
	             <ul class="pagination cmt_nams">
			      	 <c:if test="${cpr.count != 0}">
					  	<c:if test="${cpr.prev}">
					    <li>
					      <a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}&CmtPageNo=${cpr.beginPage - 1}" aria-label="previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    </c:if>
					    <c:forEach var="i" begin="${cpr.beginPage}" end="${cpr.endPage}">
							<li <c:if test="${cpr.pageNo == i}">class="active"</c:if>>
								<a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}&CmtPageNo=${i}">${i}</a>
							</li>
					    </c:forEach>
					  	<c:if test="${cpr.next}">
					    <li>
					      <a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}&CmtPageNo=${cpr.endPage + 1}" aria-label="next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    </c:if>
					</c:if>
				</ul>
			 </div>
			</c:if>
       </div>
      </div>
             

             
             
             
			
				<form class="ns_comment_write" method="post" 
			       name="writeForm" onsubmit="return inputCheck();">
                    <input type="text" name=cmtContent id="cmtContent" class="ns_comment_write" placeholder="댓글을 입력하세요">
                    <input type="hidden" name="userNo" value="${sessionScope.user.userNo}"/>
                    <input type="hidden" name="boardPostNo" value="${talkDetail.postNo}"/>
                    <input type="hidden" name="pageNo" value="${pr.pageNo}"/>
                  	<button onclick="inputCheck();" type="button" class="ns_comment_do">등록</button>
				</form>
            </div>
  
  			
           


           <c:if test="${pr.count > 10 }"> 
             <ul class="pagination nams">
	             <c:if test="${pr.count != 0}">
				  	<c:if test="${pr.prev}">
					    <li>
					      <a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.beginPage - 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
				    	<li 
				    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
				    	><a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${i}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i}</a></li>
				    </c:forEach>
				  	<c:if test="${pr.next}">
					    <li>
					      <a href="talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.endPage + 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				</c:if>
			</ul>
           </c:if>
             
           <c:choose>
	          <c:when test="${ not empty sessionScope.user.userNo }">
		          <a class="ns_go_write" href="/bitcomu/talk/talk_write_form.do"> 
		            <div> 
		            	  글쓰기
		            </div>
		          </a>
	          </c:when>
	          <c:otherwise></c:otherwise>
           </c:choose>

            
           <div class="ns_search">
	          <form method="post" action="/bitcomu/talk/talkList.do">
	               search : 
	               <select name="searchType">
	                   <option value="titleContent" selected>제목 + 내용</option>
	                   <option value="title" >제목</option>
	                   <option value="content">내용</option>
	                   <option value="user">글쓴이</option>
	               </select>
	               
	               <input type="text" name="searchWord" >
		        <button type="submit" id="doSearch" >검색</button>
	          </form>
           </div>
          
        </section>
    </div>
           
           
           
    <div id="ns_bottom"></div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
  
    <%@ include file="../include/footer.jsp"%> 
    <!--// 푸터 끝-->
    


  </div>
  <script>
	let postNo = '${talkDetail.postNo}';
	let cmtPageNo = '${cpr.pageNo}';
	let UserGrade = '${sessionScope.user.userGrade}';
	let UserNo = '${sessionScope.user.userNo}';
  </script>
  <script src="<c:url value='/resources/js/like.js' />"></script>
  <script src="<c:url value='/resources/js/talkComment.js' />"></script>
  <script src="<c:url value='/resources/js/talkWriteCheckForm.js' />"></script>
</body>
</html>

