<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="온라인강의 업로드"/>
</c:import>
</head>
<body>
   <div class="wrapepr upload_form">
	<c:import url="/jsp/include/header.jsp" />
    <!-- 컨텐트 비주얼 -->
    <div class="visual">
      <div class="visual">
        <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
      </div>
    </div>
    <!-- 컨텐트 비주얼 끝-->
    <div>
      <!-- width = 1280px 인 컨텐츠영역-->
      <div class="w1280">
          <section class="content new_form clearboth">
            <h2>강의 등록 <span>· UPLOAD</span> </h2>
            <form action="">
              <div>
                <table>
                  <tr>
                    <th>제목</th>
                    <td>
                      <input type="text" name="yt_title">
                    </td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td>
                      <textarea name="yt_detail" cols="160" rows="10" style="resize: none"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <th>영상주소</th>
                    <td>
                      <input type="text" name="yt_addr" placeholder="youtobe영상 주소를 입력하세요.">
                    </td>
                  </tr>
                  <tr>
                    <th>분류</th>
                    <td>
                      <select name="yt_sel" class="yt_sel">
                        <option>과목선택</option>
                        <option value="java">JAVA</option>
                        <option value="db">데이터베이스</option>
                        <option value="servlet">Servlet</option>
                        <option value="jsp">JSP</option>
                        <option value="spring">Spring</option>
                        <option>직접입력</option>
                      </select>
                      <input type="text" name="inp_yt_sel" placeholder="과목 입력">
                    </td>
                  </tr>
                </table>
              </div>
              <ul class="btn_btm clearboth">
                <li>
                  <a href="#">등록<button></button></a>
                </li>
                <li><a href="../onlineclass.html">이전</a></li>
              </ul>
            </form>
          </section>
      </div>
      <!-- //width = 1280px 인 컨텐츠영역 끝-->
  </div>

<c:import url="/jsp/include/footer.jsp" />
    <!-- 팝업 -->
    <div class="popbg"></div>
    <div class="popup clearboth">
      <div class="pop_l">
        <iframe src="https://www.youtube.com/embed/7ZDW5gOIJKs" width="100%" height="100%" frameborder="0" allow="accelerometer;" allowfullscreen></iframe>
      </div>
      <div class="pop_r">
          <div>
            <dl>
              <dt><i class="fa fa-user-circle" aria-hidden="true"></i></dt>
              <dd>iamteacher</dd>
            </dl>
          </div>
          <div>
            <p>
              #jsp #스프링프레임워크 #Servlet
            </p>
          </div>
          <div class="socialbox">
              <i class="fa fa-heart-o" aria-hidden="true"></i>
              <!-- <i class="fa fa-heart" aria-hidden="true"></i> -->
              <i class="fa fa-comment-o" aria-hidden="true"></i>
              <p>좋아요 44,444개</p>
              <p>2019.09.09</p>

          </div> 
          <div class="comment">
            <textarea style="resize: none" placeholder="댓글 달기..."></textarea>
          </div>

      </div>
    </div>
    <!-- //팝업 끝 -->
  </div>
  <script>
    $(document).ready(function() {

    });
  </script>
</body>
</html>

