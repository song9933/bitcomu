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
   
    <%@ include file="/jsp/include/header.jsp"%>
     	헤더 끝 -->
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

            <div id="ns_list"></div>
                <ul class="ns_TableListBody">
                  
                  <%@ include file="/jsp/talk/talk_list.jsp" %> 
                </ul>
                
              <div class="ns_go_update"> 
            <a  href="/bitcomu/updateTalkForm.do?postNo=${talkDetail.postNo}"> 
               	 수정
            </a>
              </div>
            <a class="ns_go_delete" href="/bitcomu/talkdelete.do?postNo=${talkDetail.postNo}"> 
              <div> 
               	 삭제
              </div>
            </a>
            
            <a class="ns_talk_like" href="" >
            <i class="far fa-thumbs-up fa-3x"></i>
            </a>
            
             <%--      <c:forEach var="c" items="${comment}">
                  	 <div class="ns_member">${c.userId}
                  	 <div class="ns_comment">
                  	 	<pre>&nbsp; ${c.cmtContent}</pre>
                  	 	<a href="">수정</a>
	                    <a href="">삭제</a>
                      </div>
                    </div>
                  </c:forEach>   --%>
                  
                 <%--  <c:if test="${empty comment}">
					<li >
						<span></span>
						<span >댓글이 없습니다.</span>
					</li>
				 </c:if>  --%>
                    
                    
            <div class="ns_coment_list">
                  <div class="ns_member_coment">
                    <div id="ns_cmt"></div>
                    
                    <form action="talk/comment_update.do" method="post">
			<input type="hidden" name="postNo" value="${talkDetail.postNo}" />
			<input type="hidden" name="cmtNo" value="${param.cmtNo}" />
			<input type="hidden" name="pageNo" value="${pr.pageNo}" />
			<%-- <input type="hidden" name="cmtContent" value="${comment.cmtContent}" />		 --%>
			
			<table>
			<c:forEach var="comment" items="${comment}">
				<c:choose>
					<c:when test="${param.cmtNo eq comment.cmtNo}">
						<tr>
						  <td>${comment.userId}</td>
						  <td>
						  	<textarea name="cmtContent" rows="2" cols="60">${comment.cmtContent}</textarea>
						  </td>
						  <td colspan="2">
						  	  <input type="submit" value="수정" />
						  	  <a href="<c:url value="/talk_detail.do?postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">취소</a>
						  </td>
						</tr>		
					</c:when>
					<c:otherwise>
						<tr>
						  <td>${comment.userId}</td>
						  
						  <td><br/>&nbsp;${comment.cmtContent}</td>
						  <td>
						  	  <a href="<c:url value="talk/comment_delete.do?cmtNo=${comment.cmtNo}&postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">삭제</a>	
						  	  <a href="<c:url value="talk_detail.do?cmtNo=${comment.cmtNo}&postNo=${talkDetail.postNo}&pageNo=${pr.pageNo}"/>">수정</a>	
						  </td>
						  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
						                      value="${comment.cmtRegDt}"/>
						  </td>
					    </tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${empty comment}">
				 <tr>
				    <td colspan='4'>댓글이 존재하지 않습니다.</td>
				 </tr>
			</c:if>	 
			</table>
		</form>	
                    
                    
                    
                 
                    
                  </div>

              </div>
				<form class="ns_comment_write" method="post" action="/bitcomu/talk/comment_regist.do" >
                    <input class="ns_comment_write" type="text" name=cmtContent placeholder="댓글을 입력하세요"></li>
                    <input type="hidden" name="userNo" value="${sessionScope.user.userNo}"/>
                    <input type="hidden" name="boardPostNo" value="${talkDetail.postNo}"/>
                    <input type="hidden" name="pageNo" value="${pr.pageNo}"/>
                  	<button class="ns_comment_do">등록</button>
				</form>
            </div>
  
  
           


            
            
                <ul class="pagination nams">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              
             <a class="ns_go_write" href="/bitcomu/jsp/talk/talk_write.jsp">
              <div> 
              	  글쓰기
              </div>
            </a>

            
            
            <div class="ns_search">
                search : 
                <select name="list">
                    <option value="10" selected>제목 + 내용</option>
                    <option value="15">제목</option>
                    <option value="20">내용</option>
                    
                </select>
                <input type="text" name="search">
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
  // $(document).ready(alert());

  </script>
</body>
</html>

