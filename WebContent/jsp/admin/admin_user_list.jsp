<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="유저관리" />
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
      <li class="sj selected">유저관리</li>
      <li class="sj"><a href="${pageContext.request.contextPath}/user/userDeleteForm.do">게시판 관리</a></li>
      </ul>
    </div> 
         <section class="content ns_content">
			
            <h1 class="ns_Title"></h1>



            <div class="ns_listlength">
              
                <select name="list">
                    <option value="10" selected>10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                    
                </select>씩 보기
            </div>
  			
     		<div class="ns_table">
                <ul class="ns_TableListHead ns_TableListHeadByAdmin">
                    <li>
                        <span>id</span>
                        <span>이름</span>
                        <span>권한</span>
                        <span>관리</span>
                    </li>
                    
                </ul>
                
                <c:if test="${empty userList}">
				<li>
					<span></span>
					<span colspan='4'>가입된 회원이 없습니다.</span>
				</li>
				</c:if>
                
                

                
                <ul class="ns_TableListBody ns_TableListBodyByAdmin">
                <c:forEach var="member" items="${userList}">
                  <li>
                      <span>${member.userId}</span>
                      <span>${member.userName}</span>
                      <span>
                      <c:choose>
                      	<c:when test="${member.userGrade eq '2'}">
                      		Y
                      	</c:when>
                      	<c:otherwise>
                      		N
                      	</c:otherwise>
                      </c:choose>
                      </span>
                      <span>
                      <form method="POST" action="<c:url value="/admin/adminUserAuthUpdate.do"/>">
                      <input type="hidden" name="pageNo" value="${pr.pageNo}">
                      <input type="hidden" name="userNo" value="${member.userNo}">
                      <input type="hidden" name="userGrade" value="${member.userGrade}">
                      <button type="submit" class="button_box_sj box_email_sj">
                      <c:choose>
                      	<c:when test="${member.userGrade eq '2'}">
                      		권한 뺏기
                      	</c:when>
                      	<c:otherwise>
                      		권한 부여
                      	</c:otherwise>                      	
                      </c:choose> 
                      </button>
                      </form>
                      </span>
                      <span style="margin-left: 20px;">
                      <form method="POST" action="<c:url value="/admin/adminUserDelete.do"/>"> 
                   			<input type="hidden" name="userNo" value="${member.userNo}">
                   			<input type="hidden" name="pageNo" value="${pr.pageNo}">
                      		<button type="submit" class="button_box_sj box_email_sj">
                      				강제 탈퇴
                      		</button>
                      </form>              
                      </span>
                  </li>
                </c:forEach>
            
                </ul>
            </div>
  
  
          

            
              <ul class="pagination nams">
                <c:if test="${pr.count != 0}">
			  	<c:if test="${pr.prev}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${pr.beginPage -1}" aria-label="previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    	<li 
			    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
			    	><a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${i}">${i}</a></li>
			    </c:forEach>
			  	<c:if test="${pr.next}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${pr.endPage + 1}" aria-label="next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
		</c:if>
		</ul>
            
            

            
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



