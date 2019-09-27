<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   <%--  <div id="ns_top"></div>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비트캠프 커뮤니티 | 공지 </title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="js/jquery-3.3.1.min.js"></script> --%>
    <%@ include file="/jsp/include/head.jsp"%>
</head>
<body>
   <div class="wrapepr">
     <!-- 헤더 -->
    <!-- <div class="w1280">
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
    </div> -->
    <!-- // 헤더 끝-->
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

            
  
           
           
           <div class="ns_table_write">
     <form method='post' action="/bitcomu/notice/write.do" enctype = "multipart/form-data">
	 	<div>
  		   제목 : <input type='text' name='title' size='70' />	 	
	 	</div>
	 	<div>
		     글쓴이 :${userNo} <input type='hidden' value="${userNo}" name='writer' size='30' />
	 	</div> 
	 	<div>
	            내용 : <textarea name='content' rows='7' cols='70'></textarea>
	 	</div>
		<div>
			<input type="file" name="attach" />
		</div>
              <a class="ns_write_do" > 
	    <button type='submit'>등록</button>
              </a> 
	</form>
              </div>
           
           
           
                
            
            <!--     <div class="ns_table_write_title">
                    <input type="text" name="title" placeholder="제목을 입력하세요">
                </div>

                <div class="ns_table_write_content">
                    <input type="text" name="content" placeholder="내용을 입력하세요">
                </div>

                <div> 
                  글등록
                </div>
               -->

              <a class="ns_to_list" href="<c:url value="/notice/noticeList.do" />"> 
                <div> 
                  목록으로
                </div>
              </a>




              
                
  
  
            
            
            
            
          
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <div id="ns_bottom"></div>
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

