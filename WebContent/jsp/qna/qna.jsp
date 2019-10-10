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
      <section class="qna_content">
        <div>
         <strong class="qna_title">질문 답변</strong>
		</div>
		<c:forEach var="b" items="${qna}">
          <div class="qna_accordion vertical" >   	
        	<form method='post' action="/bitcomu/qna/qnaList.do">
            <h3 class="qna_title_1" onclick="changeView('${b.qnaNo}');">${b.qnaTitle}</h3>
    		<i class="fa fa-lock qna_pd10" style="font-size: 2em" aria-hidden="true"></i>
               <!-- 수정버튼 -->
                   <span class="qna_updat_1">
					 <a href="javascript:void(0)"
					  onclick="document.getElementById('light_1').style.display='block'; document.getElementById('fade_1').style.display='block'"
					  style="font-weight: bold">수정</a>
				   </span>
			  <!-- 삭제버튼 -->
				   <span class="qna_delete_1">
					  <a href="javascript:void(0)"
					  onclick="document.getElementById('light').style.display='block'; document.getElementById('fade').style.display='block'"
					  style="font-weight: bold">삭제</a>
				   </span>
    		 <div class="qna_content_1" id="${b.qnaNo}">
    		 	
                        <p>공개여부 ${b.qnaPublicEnabled} 조회수 ${b.qnaViewCnt}</p>
                        <p>${b.userId}</p>
                        <p>${b.qnaContent}</p>
                        <p><fmt:formatDate value="${b.qnaRegDt}" pattern="yyyy-MM-dd hh:mm"/></p>
              
                        <input type="text" class="qna_text_content_2" name="comment" style="resize: none" placeholder="Comment" />
                        <button type="submit" class="qna_button_2">댓글</button>
             	
             </div>                	
    	</form>
    	</div>
   
    	<!-- 삭제 팝업 -->
      <div id="light" class="qna_white_content">
      	<form method='post' action="/bitcomu/qna/qnaDelete.do" >
      		<input type="hidden" name="qnaNo" value="${b.qnaNo}" /> 
      		<a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none'; document.getElementById('fade').style.display='none'" />
          		<div class="qna_delete_2"><p>삭제 하시겠습니까?</p></div> 
          		<div class="qna_button_1" style="resize: none">
          		<div><button type="submit" class="qna_button_0" >삭제</button></div>
          		<div><button type="button" onclick="location.href='#'" class="qna_button_0">취소</button></div>
      			</div>
        </form>
      </div>
      <div id="fade" class="qna_black_overlay"></div>
        <!-- 수정 팝업 -->
  	  <div id="light_1" class="qna_white_content_1">
  	  	<form method='post' action="/bitcomu/qna/qnaUpdate.do">
  			<input type="hidden" name="qnaNo" value="${b.qnaNo}" /> 
  				<a href="javascript:void(0)"
    			onclick="document.getElementById('light_1').style.display='none'; document.getElementById('fade_1').style.display='none'"></a>
    	<div class="qna_update_title">   
      		<input type="text" class="qna_text_title_1" name="qnaTitle" style="resize: none" placeholder="Title" value="${b.qnaTitle}" />
      		<input type="checkbox" id="check_0" value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
      		<input type="text" class="qna_text_content_1" name="qnaContent" style="resize: none" placeholder="Content" value="${b.qnaContent}" />
      <div>
      </div>
       <div><input type="file" class="qna_update_attatch" enctype="multipart/form-data" name="attach" /></div>
      <div><button type="submit" class="qna_button_update">수정</button></div>
      <div><button type="button" onclick="location.href=''" class="qna_button_cancle">취소</button></div> 
    </div> 
     </form>   
  </div>
  <div id="fade_1" class="qna_black_overlay_1"></div>
       
    </div>
    	</c:forEach>
 
 <!--          
<ul class="qna_delete_1">
  <a href="javascript:void(0)"
  onclick="document.getElementById('light').style.display='block'; document.getElementById('fade').style.display='block'"
  style="font-weight: bold" ></a>

</ul>  
 -->  
        <div class="qna_board_qna_title">
           <form method='post' action="/bitcomu/qna/qnaWrite.do" >
              <input type="text" class="qna_text_title" name="qnaTitle" style="resize: none" placeholder="Title" value="${b.qnaTitle}" />
              <input type="checkbox" id="qna_check_2"  value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
			  <input type="text" class="qna_text_content" name="qnaContent" style="resize: none" placeholder="Content" value="${b.qnaContent}" /> 
              <button type="submit" class="qna_button">등록</button>
              <input type="file" class="qna_attatch" enctype="multipart/form-data" name="attach" />
          	</form>
         </div>
          <div class="qna_search">
              <input type="text" class="qna_text_search" name="search" style="resize: none" placeholder="Search" vlaue="${search.searchWord}" />
              <select name="select" class="qna_select_1">
                  <option value="1">작성자</option>
                  <option value="2">제목</option>
                  <option value="3">내용</option>
              </select>
              <button type="submit" class="qna_button_serch">검색</button>
            </div>
        </div>
      </section>

      <%@include file="/jsp/include/footer.jsp" %>



    </div>
	  
    <script>
    	let a = document.querySelectorAll(".qna_content_1");
    	for (let i = 0; i < a.length; i++) {
    		a[i].className = "hidden";
    	}
    	function changeView(i) {
        let divEle = document.getElementById(i);
        divEle.classList.toggle("show");
        divEle.classList.toggle("hidden");
    }
    </script>
</body>
</html>