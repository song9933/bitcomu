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
            <form action="yt_write.do" method="post">
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
                      <select name="yt_subj_sel" class="yt_sel">
                        <option>과목선택</option>
                        <c:forEach var="subject" items="${ sList }">
                        	<option value="${ subject.ytSubject }">${ subject.ytSubject }</option>
                        </c:forEach>
                        	<option value="0">직접입력</option>
                      </select>
	 				  <input type="text" name="yt_subj_inp" placeholder="과목 입력" class="hidden">
                    </td>
                  </tr>
                </table>
              </div>
              <ul class="btn_btm clearboth">
                <li>
                  <a href="#">등록<button></button></a>
                </li>
                <li><a href='${pageContext.request.contextPath}/onlineclass/onlineclsList.do?subj=${ subject }'>이전</a></li>
              </ul>
              <input type="hidden" name="yt_addr_mod" value=""/>
            </form>
          </section>
      </div>
      <!-- //width = 1280px 인 컨텐츠영역 끝-->
  </div>

<c:import url="/jsp/include/footer.jsp" />
    </div>
<script>
/***
 * 영상주소의 원본데이터를 유지하고
 * hidden타입의 input에 필요한 파라미터만 잘라 전송하기
 */
let addrEle = document.querySelector('input[name="yt_addr"]');
addrEle.addEventListener('blur', (e) => {
	let addrModEle = document.querySelector('input[name="yt_addr_mod"]');
	let hidAddrVal = addrEle.value;
	if (hidAddrVal != "") {
		let addrArr = hidAddrVal.split('?v=');
		for (let i = 0; i < addrArr.length; i++) {
			console.log(addrArr[i]);
		}
		let targetAddr = addrArr[1].split("&")[0];
		addrModEle.value = targetAddr;
	} else {
		addrModEle.value = hidAddrVal;
	}
});
let selEle = document.querySelector('select[name="yt_subj_sel"]');
selEle.addEventListener('change', (e) => {
	console.log('change OK')
	let optEle = document.querySelector('option[value="0"]');
	let inpEle = document.querySelector('input[name="yt_subj_inp');
	if (optEle.selected) {
		$('input[name="yt_subj_inp').removeClass('hidden');
	} else {
		if (inpEle.class != 'hidden') {
			$('input[name="yt_subj_inp').addClass('hidden');
		}
	}
});


/* let selEle = document.querySelector('option[value="0"]');
if (selEle.selected) {
	let inpEle = document.querySelector('input[name="yt_subj_inp"]');
	inpEle.classList.add = 'a';
}
 */
$(document).ready(function() {

});
</script>
</body>
</html>

