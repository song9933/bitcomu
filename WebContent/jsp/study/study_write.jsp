<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="스터디게시판 글쓰기" />
</c:import> 
</head>
<body>
   <div class="wrapper sWrapWrite">
      <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
          <div class="container">
              <div class="section">
                  <h2>분야</h2>
                  <div class="checks"> 
                      <input type="checkbox"> 
                      <label for="ex_chk">JAVA</label> 
                      <input type="checkbox"> 
                      <label for="ex_chk">JavaScript</label> 
                      <input type="checkbox"> 
                      <label for="ex_chk">알고리즘</label> 
                      <input type="checkbox"> 
                      <label for="ex_chk">기타</label> 
                  </div>
              </div>
              <div class="section">
                  <h2>지역</h2>
                  <select name="location">
                      <option selected>선택</option>
                      <option >지역1</option>
                      <option >지역2</option>
                      <option >지역3</option>
                      <option >지역4</option>
                  </select>
              </div>
              <div class="section">
                  <h2>모집 인원</h2>
                <div class="checks">
                    <input type="radio">
                    <label class="radio">2~5명</label>
                    <input type="radio">
                    <label class="radio">6~9명</label>
                    <input type="radio">
                    <label class="radio">10~ 명</label>
                    <input type="radio">
                    <label class="radio">제한없음</label>
                </div>
              </div>
              <div class="section">
                  <h2>모집 여부</h2>
                <div class="enabled">
                    <input type="radio">
                    <label class="radio">모집중</label>
                    <input type="radio">
                    <label class="radio">마감</label>
                </div>  
              </div>
             
            <p class="title">
                <input type="text"  name="title" placeholder="제목을 입력하세요">
            </p>
            <p class="text">
                <textarea name="text" placeholder="내용을 입력하세요"></textarea>

            </p>
            <div class="submit">
                <input type="submit" value="글쓰기">
            </div>
        
          </div>
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

 	<%@include file="/jsp/include/footer.jsp" %>
    
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

