<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원수정" />
</c:import> 

</head>
<body>
   <div class="wrapepr email_wrap">
     <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <div class="tab-box sj">
      <ul class="sj">
      <li class="sj selected">회원정보 수정</li>
      <li class="sj"><a href="${pageContext.request.contextPath}/user/userDeleteForm.do">회원 탈퇴</a></li>
      </ul>
    </div>    
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userUpdate.do" name="fr">
      <input type="hidden" name="no" value="${sessionScope.user.userNo}">
      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-pencil-square-o" aria-hidden="true"; style="color: #ffa500;"></i>  회원정보 수정</span></p>
                
                  <br/>
                  <strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i> 수정정보 입력</strong>
                  <br/>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td><input type="text"
                          name="id" class="input_box_sj box_join_sj" disabled value="${sessionScope.user.userId}">
                         </td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td> <input type="text"
                          name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요" value="${sessionScope.user.userName}">
                      </tr>
                      <tr>
                        <td>비밀번호</td>
                        <td> <input type="password"
                          name="password" id="password" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호를 입력"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요.</td>
                      </tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td> <input type="password"
                          name="passwordRetry" id="passwordRetry" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호를 확인"><span id="passChkVal"></span></td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                        	<c:forEach var="phoneNum" items="${mobileList}">
                            	<option value="${phoneNum.codeName}" <c:if test="${phoneNum.codeName eq phone[0]}"> selected </c:if>>${phoneNum.codeName}</option>
                        	</c:forEach>
                          </select>-
                          <input type="text"
                          name="userphone2" class="input_box_sj box_phone_sj" value="${phone[1]}">-
                          <input type="text"
                          name="userphone3" class="input_box_sj box_phone_sj" value="${phone[2]}">
                        </td>
                      </tr>
                      <tr>
                        <td>이메일</td>
                        <td> <input type="text"
                          name="email1" class="input_box_sj box_join_sj" disabled value="${email[0]}">@
                          <input type="text"
                          name="email2" class="input_box_sj box_join_sj" disabled value="${email[1]}">
                      </tr>
                      <tr>
                        <td>생년월일</td>  
                        <td>
                        <fmt:formatDate var="userBirth" value="${sessionScope.user.userBirth}" pattern="yyyy-MM-dd"/>
                            <input type="date"
                            name="birth" id="birth" class="input_box_sj box_join_sj" value="${userBirth}">
                        </td>
                      </tr>  
                </table>
                <div class="board_box_sj box_detail_sj">
                  <button type="button" class="button_box_sj box_email_sj" id="sendJoin">정보수정</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
  </form>


   <%@include file="/jsp/include/footer.jsp" %>
  </div>
  <script>
  let namePtn = /(^[가-힣]{2,6})+$/;
  let passPtn = /(^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{10,20})+$/;
  let phonePtn = /(^[0-9]{3,4})+$/;
  let phonePtn2 = /(^[0-9]{4})+$/;
  let passFlag = false;
  
  
  function chkJoinForm() {
		 
	  let obj = document.fr;
	
      
      if(!(namePtn.test(obj.name.value))) {
          alert('이름 2~6자 이외의 값, 한글이외의 값은 입력하실 수 없습니다.');
          obj.name.focus();
          return false;
      }
      
      if(!(passPtn.test(obj.password.value))) {
          alert('영문자, 숫자, 특수문자를 포함한 10~20자내의 비밀번호를 입력하세요.');
          obj.password.focus();
          return false;
      }
      
      if(!(passPtn.test(obj.passwordRetry.value))) {
          alert('영문자, 숫자, 특수문자를 포함한 10~20자내의 비밀번호를 입력하세요.');
          obj.password.focus();
          return false;
      }
      
      if(!(phonePtn.test(obj.userphone2.value))) {
          alert('3~4자리의 숫자를 입력하세요.');
          obj.userphone2.focus();
          return false;
      }
      
      if(!(phonePtn2.test(obj.userphone3.value))) {
          alert('4자리의 숫자를 입력하세요.');
          obj.userphone3.focus();
          return false;
      }
      
      if(obj.email1.length == 0 || obj.email2.length == 0) {
    	  alert('이메일 재인증 후 회원가입 시도해 주세요.');
          obj.email2.focus();
          return false;
      }
      let birth = document.getElementById("birth").value;
   	 
   	  if (birth.trim().length == 0) {
   		  alert('생년월일을 입력해 주세요.');
          obj.birth.focus();
          return false;
   	  }
   	  let year = parseInt(document.getElementById("birth").value.substr(0,4));
    	  
  
   	  if (year > 2019 || year < 1960) {
   		  alert('생년월일은 1960년도 부터 2019년 까지 가능합니다.');
          obj.birth.focus();
          return false;
   	  }

      if (!passFlag) {
    	  alert("비밀번호 확인 후에 진행해 주세요.");
    	  return false;
      }
      obj.submit();
  }

  
  
  
  let sendJoin = document.querySelector("#sendJoin");
  sendJoin.addEventListener("click", chkJoinForm);
  
  
  passwordRetry.addEventListener("keyup", passChk );
  
  password.addEventListener("keyup", passChk );
  
  function passChk() {
	  password = document.querySelector("#password");
	  passwordRetry = document.querySelector("#passwordRetry");
	  if(password.value.length != 0 || passwordRetry.value.length != 0) {
		  if(password.value != passwordRetry.value) {
			  passChkVal.style.color = "red";
			  passChkVal.innerText = "* 비밀번호가 일치하지 않습니다.";
			  passFlag = false;  
		  } else {
			  passChkVal.style.color = "black";
			  passChkVal.innerText = "* 비밀번호가 일치합니다.";
			  passFlag = true;
		  }
	  }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </script>
</body>
</html>