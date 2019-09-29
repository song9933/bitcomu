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
      <li class="sj selected">게시판 관리</a></li>
      </ul>
    </div> 
         <section class="content ns_content">
			
            <h1 class="ns_Title"></h1>



            <div class="ns_listlength">
              
                <select name="viewList">
                    <option value="10" selected>10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                    
                </select>씩 보기
            </div>
  			
     		<div class="ns_table">
                <ul class="ns_TableListHead ns_TableListHeadByAdmin">
                    <li>
                        <span>유저이름</span>
                        <span>제목</span>
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
                
                

                
                <ul class="ns_TableListBody ns_TableListBodyByAdmin">
                <c:forEach var="board" items="${boardList}">
                  <li>
                      <span>${board.userId}</span>
                      <span>${board.postTitle}</span>
                      <span><fmt:formatDate value="${board.regDt}" pattern="yyyy-MM-dd"/></span>
                      <span colspan="2">${board.codeName}</span>
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
			      <a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${pr.beginPage -1}" aria-label="previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			   
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    	<li 
			    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
			    	><a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${i}">${i}</a></li>
			    </c:forEach>
			  	<c:if test="${pr.next}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/boardAllListForm.do?pageNo=${pr.endPage + 1}" aria-label="next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
		</c:if>
		</ul>
            
            

            
            <div class="ns_search">
                search : 
                <select name="searchList">
                    <option value="10" selected>제목 + 내용</option>
                    <option value="15">제목</option>
                    <option value="20">내용</option>
                    
                </select>
                <input type="text" name="search">
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
	
  </script>
</body>
</html>



