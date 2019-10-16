<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="회원가입" />
</c:import> 
<style>
@import url(https://fonts.googleapis.com/css?family=Oswald:700);
.vote_countdown{
  	text-align: center;
    color: orangered;
    font-family: "Oswald";
    font-weight: 700;
    font-size: 1.7em;
    padding: 10px;
}

</style>


</head>
<body>
   <div class="wrapepr email_wrap">
    <c:import url="/jsp/include/header.jsp"/>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <div class="board_box_sj sub_top_sj">
        <span class="inline_sub_top_sj"><i class="fa fa-check-square-o" aria-hidden="true">약관동의</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-envelope" aria-hidden="true">이메일 인증</i></span>
        <span class="inline_sub_top_sj selected"><i class="fa fa-user-plus" aria-hidden="true">개인정보입력</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-lock" aria-hidden="true">가입완료</i></span>
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userJoin.do" name="fr">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-user-plus" aria-hidden="true" style="color: #ffa500;"></i> 회원가입</span></p>
                
                  <br/>
                  <strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i> 기본정보 입력</strong>
                  <br/>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td><input type="text"
                          id="id" name="id" class="input_box_sj box_join_sj" placeholder="아이디를 입력하세요.">
                          <span id="alert_text"></span><button type="button"  id="userChk" class="button_box_sj">중복확인</button>
                          <div id="loading"><img id="loading-image" src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" alt="Loading..." /></div>
                        </td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td><input type="text"
                          name="name" class="input_box_sj box_join_sj" placeholder="이름을 입력하세요.">
                      </tr>
                      <tr>
                        <td>비밀번호</td>
                        <td> <input type="password"
                          name="password" id="password" class="input_box_sj box_join_sj" placeholder="비밀번호를 입력하세요"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요.</td>
                      </tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td> <input type="password"
                          name="passwordRetry" id="passwordRetry" class="input_box_sj box_join_sj" placeholder="비밀번호를 확인"><span id="passChkVal"></span></td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td> <select name="userphone1" class="input_box_sj box_phone_sj">
                        	<c:forEach var="phoneNum" items="${mobileList}">
                            <option value="${phoneNum.codeName}">${phoneNum.codeName}</option>
                        	</c:forEach>
                          </select>-
                          <input type="text"
                          name="userphone2" class="input_box_sj box_phone_sj">-
                          <input type="text"
                          name="userphone3" class="input_box_sj box_phone_sj">
                        </td>
                      </tr>
                      <tr>
                          <td>이메일</td>
                          <td> <input type="text"
                            name="email1" class="input_box_sj box_join_sj" value="${userEmail[0]}" readonly="readonly">@
                            <input type="text"
                     name="email2" class="input_box_sj box_join_sj" value="${userEmail[1]}" readonly="readonly">
                        </tr>
                      <tr>
                        <td>생년월일</td>  
                        <td>
                            <input type="date"
                            name="birth" id="birth" class="input_box_sj box_join_sj" min="1960-01-01" max="2019-01-01">
                        </td>
                      </tr>
                </table>
                <div class="board_box_sj box_detail_sj">
                  <button type="button" id="sendJoin" class="button_box_sj box_email_sj">회원가입</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
  </form>
  
 <%@include file="/jsp/include/footer.jsp" %>
 
 
 
  </div>
  <script>
  
  let countdown = document.getElementById("countdown");
  let joinFlag = false;
  let passFlag = false;
  let passwordRetry = document.getElementById("passwordRetry");
  let password = document.getElementById("password");
  let userChk = document.getElementById("userChk");
  
  let idPtn = /(^[a-zA-Z0-9]{4,12})+$/;
  let namePtn = /(^[가-힣]{2,6})+$/;
  let passPtn = /(^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{10,20})+$/;
  let phonePtn = /(^[0-9]{3,4})+$/;
  let phonePtn2 = /(^[0-9]{4})+$/;
  
  userChk.addEventListener("click", e => {
	  let id = document.querySelector("#id").value;
	  
      if(!(idPtn.test(id))) {
          alert('아이디 4~12자 이외의 값, 한글, 특수문자등은 입력하실 수 없습니다.');
          return false;
      }
	  
	  
	  showLoadingbar();
	  let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = (e) => {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					hideLoadingbar();
					let result = xhr.responseText.trim();
					console.log(result);
					if (result == 0) {
						alert("사용가능한 아이디 입니다.");
						joinFlag = true;
					} else {
						alert("중복된 회원이 있습니다!");
						joinFlag = false;
						return;
					}
					
				}

			}
		};	
		xhr.open("POST", "userIdChk.do", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("userId=" + id);
  });
  
  
  
  
  
  
  
 


  
  

  function chkJoinForm() {
	 
	  let obj = document.fr;
	  console.log(idPtn.test(obj.id.value));
      if(!(idPtn.test(obj.id.value))) {
          alert('아이디 4~12자 이외의 값, 한글, 특수문자등은 입력하실 수 없습니다.');
          obj.id.focus();
          return false;
      }
      
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

      if(!joinFlag) {
    	  alert("아이디 중복확인 후에 진행해 주세요.");
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
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</body>
</html>

