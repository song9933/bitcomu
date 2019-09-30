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
		  <form action="/bitcomu/qna/qnaList.do">
          <div class="qna_accordion vertical">
            <ul>
                <li>
                    <input type="checkbox" id="checkbox-1" name="checkbox-accordion" />
                    <label for="checkbox-1" class="qna_title_1">비트 캠프 지각은 몇시 인가요?</label>
                    <i class="fa fa-lock qna_pd10" style="font-size: 2em" aria-hidden="true"></i>
          
                    <div class="qna_content_1">
                        <p>공개 10분전 조회수 10</p>
                        <h3>관리자</h3>
                        <p>1교시 수업은 9시 30분 부터 시작이며,  40분 이후로 지각처리 됩니다.</p>
                        <p>2019.8.31. 19:07:00</p>
                        <p>od31**</p>
                        <p>답변 감사합니다.</p>
                        <p>2019.8.31. 19:07:11</p>
                        <textarea class="qna_text_content_2" name="content" style="resize: none" placeholder="Comment"></textarea>
                        <button type="submit" class="qna_button_2">댓글</button>
                    </div>
                </li>
            </ul>
        </div>
        </form>
  <!-- 수정버튼 -->
  <form action="/bitcomu/qna/qnaupdate.do">
  <p class="qna_updat_1">
    <a href="javascript:void(0)"
  onclick="document.getElementById('light_1').style.display='block'; document.getElementById('fade_1').style.display='block'"
  style="font-weight: bold">수정</a>
  </p>
  </form>
  <!-- 삭제버튼 -->
  <form action="/bitcomu/qna/qnadelete.do">
  <p class="qna_delete_1">
    <a href="javascript:void(0)"
  onclick="document.getElementById('light').style.display='block'; document.getElementById('fade').style.display='block'"
  style="font-weight: bold">삭제</a>
  </p>
  </form>
  <div id="light_1" class="qna_white_content_1"><a href="javascript:void(0)"
    onclick="document.getElementById('light_1').style.display='none'; document.getElementById('fade_1').style.display='none'">

    <ul class="qna_update_title">
    <div>
      <textarea class="qna_text_title_1" name="title" style="resize: none" placeholder="비트 캠프 지각은 몇시 인가요?"></textarea>
      <input type="checkbox" id="check_0" value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
      <textarea class="qna_text_content_1" name="content" style="resize: none" placeholder="몇시 부터 지각처리가 되나요?"></textarea>
      <ul class="qna_count">
        <p>작성시간 : 10분전    조회수 : 7</p>
      </ul>
      <div><button type="submit" class="qna_button_update">수정</button></div>
      <div><button type="submit" class="qna_button_cancle">취소</button></div>
    </div>
  </div>
  <div id="fade_1" class="qna_black_overlay_1"></div>
</ul>
            
<ul class="qna_delete_1">
  <a href="javascript:void(0)"
  onclick="document.getElementById('light').style.display='block'; document.getElementById('fade').style.display='block'"
  style="font-weight: bold"></a></p>

          </ul>  

          
       	<form method='post' action="/bitcomu/qna/write.do" >
          <ul class="qna_board_qna_title">
            <div>
              <textarea class="qna_text_title" name="title" style="resize: none" placeholder="Title"></textarea>
              <input type="checkbox" id="qna_check_2"  value="1"><i class="fa fa-lock" style="font-size: 2em" aria-hidden="true"></i>
              <textarea class="qna_text_content" name="content" style="resize: none" placeholder="Content"></textarea>
              <button type="submit" class="qna_button">등록</button>
            </div>
          </ul>
		  </form>
		  <form action="/bitcomu/qna/search.do">
          <ul class="qna_board_serh">
            <div>
              <textarea class="qna_text_search" name="search" style="resize: none" placeholder="Search"></textarea>
              <select name="select" class="qna_select_1">
                  <option value="1">작성자</option>
                  <option value="2">제목</option>
              </select>
              <button type="submit" class="qna_button_serch">검색</button>
            </div>
          </ul>
          </form>
        </div>
      </section>
      
      <%@include file="/jsp/include/footer.jsp" %>



    </div>
    <script>
  // $(document).ready(alert());

    </script>
      <div id="light" class="qna_white_content"><a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none'; document.getElementById('fade').style.display='none'"></a><a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none'; document.getElementById('fade').style.display='none'">
              
          <div class="qna_delete_2"><p>삭제 하시겠습니까?</p></div> 
          <div class="qna_button_1" style="resize: none">
          <div><button type="submit" class="qna_button_0">확인</button></div>
          <div><button type="submit" class="qna_button_0">취소</button></div>
        </div>
          </a></div>
        <div id="fade" class="qna_black_overlay"></div>
    </div>

</body>

</html>