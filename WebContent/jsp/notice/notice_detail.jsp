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
    <div class="w1280">
      <header>
        <h1><a href="./index.html"><img src="img/logo.png" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="./notice.html">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="./board_talk.html">자유게시판</a></li>
              <li><a href="./board_team.html">조별게시판</a></li>
              <li><a href="./board_study.html">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="./qna.html">질문답변</a></li>
          <li><a href="./vote.html">투표</a></li>
          <li><a href="./onlineclass.html">온라인강의</a></li>
        </ul>
        <ul class="nav">
          <li><a href="#">로그인</a></li>
          <li><a href="#">회원가입</a></li>
        </ul>
      </header>
    </div>
     	헤더 끝 -->
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content ns_content">

            <h1 class="ns_Title">공지</h1>


            <!--          
            <div class="ns_listlength">
              
                <select name="list">
                    <option value="10" selected>10개</option>
                    <option value="15">15개</option>
                    <option value="20">20개</option>
                    
                </select>씩 보기
            </div>
          -->

            <div class="ns_remote">
              <ul>
                <li>
                    <a href="#ns_top"><i class="fas fa-angle-double-up fa-2x"></i></a>
                    <!--
                    <i class="far fa-comment fa-2x"></i>
                    -->
                    <a href="#ns_list"><i class="fas fa-align-justify fa-2x"></i></a>
                    <a href="#ns_bottom"><i class="fas fa-angle-double-down fa-2x"></i></a>
                </li>
              </ul>
            </div>
  
            <div class="ns_table">
                <ul class="ns_TableListHead">
                    <li >
                    
                        <span>${noticeDetail.postNo}</span>
                        <span>${noticeDetail.title}</span>
                        <span>${noticeDetail.userId }</span>
                        <span><fmt:formatDate value="${noticeDetail.regDt}" pattern="MM-dd hh:mm"/></span>
                        <span>조회수${noticeDetail.viewCnt}</span>
                    </li>
                    
                </ul>
                

                <ul class="ns_TableDetailBody">
                  <li>
                    ${noticeDetail.content}
                  </li>
                </ul>

            <div id="ns_list"></div>
                <ul class="ns_TableListBody">
                  
                  <%@ include file="/jsp/notice/notice_list.jsp" %> 
                </ul>
             <c:if test="${sessionScope.user.userGrade eq 3 }">
              <div class="ns_go_update"> 
            <a  href="/bitcomu/updateNoticeForm.do?postNo=${noticeDetail.postNo}"> 
               	 수정
            </a>
              </div>
            <a class="ns_go_delete" href="/bitcomu/noticedelete.do?postNo=${noticeDetail.postNo}"> 
              <div> 
               	 삭제
              </div>
            </a>
             </c:if>
                
            </div>
  
  
            <!--

              <div class="ns_pasing">
                <ul>
                  <li>|맨 앞|<li>
                    <li>이전|</li>
                    <li>1 |</li>
                    <li>2 |</li>
                    <li>3 |</li>
                    <li>4 |</li>
                    <li>5 |</li>
                    <li>다음|</li>
                    <li>맨 뒤|</li>
                  </ul>
                </div>
                
                <ul class="pagination">
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
            -->


            
             <c:if test="${pr.count > 10 }"> 
                 <ul class="pagination nams">
              <c:if test="${pr.count != 0}">
		  	<c:if test="${pr.prev}">
		    <li>
		      <a href="notice_detail.do?postNo=${noticeDetail.postNo}&pageNo=${pr.beginPage - 1}" aria-label="previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    </c:if>
		    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
		    	<li 
		    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
		    	><a href="notice_detail.do?postNo=${noticeDetail.postNo}&pageNo=${i}">${i}</a></li>
		    </c:forEach>
		  	<c:if test="${pr.next}">
		    <li>
		      <a href="notice_detail.do?postNo=${noticeDetail.postNo}&pageNo=${pr.endPage + 1}" aria-label="next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    </c:if>
			</c:if>
			</ul>
			</c:if>
             <c:if test="${sessionScope.user.userGrade eq 3 }">  
             <a class="ns_go_write" href="/bitcomu/jsp/notice/notice_write.jsp"> 
              <div> 
              	  글쓰기
              </div>
            </a>
			</c:if>
            
            
            <div class="ns_search">
           <form method="post" action="/bitcomu/notice/noticeList.do">
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
   <!--  <div id="ns_bottom"></div>
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer> -->
    <!--// 푸터 끝-->
    <%@ include file="../include/footer.jsp"%> 
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

