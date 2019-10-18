<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="비밀번호찾기" />
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
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="POST" action="${pageContext.request.contextPath}/user/userPwUpdateFinish.do" name="fr">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-search" aria-hidden="true"; style="color: #ffa500"></i> 비밀번호 찾기</span></p>
                  <table class="type02_sj">
                      <tr>
                        <td>아이디</td>
                        <td> <input type="text"
                          name="id" id="id" class="input_box_sj box_join_sj" placeholder="가입시의 아이디 입력"> * 회원가입 시의 아이디를 입력해 주세요.
                          
                           </td>
                      </tr>
                        <tr>
                              <td>이메일</td>
                              <td>  <input type="text"
                            name="email1" id="email1" class="input_box_sj box_join_sj">@
                            <input type="text"
                     		name="email2" id="email2" class="input_box_sj box_join_sj">
                     		<span id="alert_text"></span><button type="button" id="userChk" class="button_box_sj">전송</button>
                          <div id="loading"><img id="loading-image" src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" alt="Loading..." /></div>
                     		
                     		</td>
                              </tr>
                        <tr>
                          <td>인증번호</td>
                          <td><span><strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i></text>이메일에서 받은 인증번호를 입력해 주세요.</strong> </span><br/>
				   				<span>
				                    <input type="text"
				                  name="emailAuth" class="input_box_sj box_default_sj" id="emailAuthResult" style="width: 250px;" placeholder="인증번호를 입력하세요"/></span>
										<span id="countdown" class="vote_countdown" ></span>
				                
                            
                           </td>
                            
                        </tr>
                        <tr>
                          <td>변경할 비밀번호</td>
                          <td> <input type="password"
                            name="password" id="password" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요. </td>
                        </tr>
                        <tr>
                          <td>변경할 비밀번호 확인</td>
                          <td> <input type="password"
                            name="passwordRetry" id="passwordRetry" class="input_box_sj box_join_sj" placeholder="변경할 비밀번호 확인"><span id="passChkVal"></</span></td>
                        </tr>

                  </table>
                  <div class="board_box_sj box_detail_sj">
                  <button type="button" id="sendJoin" class="button_box_sj box_email_sj">비밀번호수정</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
  </form>
	<%@include file="/jsp/include/footer.jsp" %>
  <script>
  let findFlag = false;
  let passFlag = false;
  let userChk = document.getElementById("userChk");
  let passwordRetry = document.getElementById("passwordRetry");
  let password = document.getElementById("password");
  let countdown = document.getElementById("countdown");
  let passChkVal = document.getElementById("passChkVal");
  
  
  let idPtn = /(^[a-zA-Z0-9]{4,12})+$/;
  let passPtn = /(^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{10,20})+$/;

  let sendJoin = document.querySelector("#sendJoin");
  sendJoin.addEventListener("click", chkJoinForm);
  
  
  userChk.addEventListener("click", e => {
	  let id = document.querySelector("#id").value;
	  let email1 = document.querySelector("#email1").value;
	  let email2 = document.querySelector("#email2").value;
	  
      if(!(idPtn.test(id))) {
          alert('아이디 4~12자 이외의 값, 한글, 특수문자등은 입력하실 수 없습니다.');
          return false;
      }
      if(email1.length == 0 || email2.length == 0) {
          alert('이메일 주소를 입력해주세요.');
          return false;
      }
      
      
	  
	  
	  showLoadingbar();
	  let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = (e) => {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					hideLoadingbar();
					let result = xhr.responseText.trim();
					
					
					
					if (result == 0) {
						alert("가입된 내역이 없습니다.");
						findFlag = false;
						return;
					} else if (result == 'Invalid Addresses') {
						alert("이메일 형식이 맞지 않습니다.");
						findFlag = false;
						return;
					} else if (result == 'error') {
						alert("시스템 오류입니다.");
						findFlag = false;
						return;
					}
					else {
						alert("가입한 내역이 확인되어 이메일 전송이 되었습니다.");
						findFlag = true;
						
					}
					
					document.querySelector("#id").readOnly = true;
					document.querySelector("#email1").readOnly = true;
					document.querySelector("#email2").readOnly = true;
					userChk.disabled = true;
					
					
					
					let emailAuthResult = document.getElementById("emailAuthResult");
					emailAuthResult.addEventListener("blur", e => {
						let emailAuthValue = emailAuthResult.value;
						if (emailAuthValue == result) findFlag = true;
						else findFlag = false;
					});
					
					let timer = 60 * 3, minutes, seconds;

					let startTimer = setInterval(function () {
					    	
					    	let countdown = document.getElementById("countdown");
							
						    timer = timer, minutes, seconds;
					        minutes = parseInt(timer / 60, 10);
					        seconds = parseInt(timer % 60, 10);

					        minutes = minutes < 10 ? "0" + minutes : minutes;
					        seconds = seconds < 10 ? "0" + seconds : seconds;

					        countdown.innerHTML = minutes + ":" + seconds;  
					        if (--timer < 0) {
					            timer = timer;
					        }
					        if (minutes == '00' && seconds == '00') {
					        	userChk.disabled = false;
						        countdown.innerHTML = "다시 인증 받으세요.";
						        document.querySelector("#id").readOnly = false;
								document.querySelector("#email1").readOnly = false;
								document.querySelector("#email2").readOnly = false;
						        findFlag = false;
					        	clearInterval(startTimer);
					        }
					 }, 1000);
					
					
					
				}

			}
		};	
		xhr.open("POST", "userPWFindAjax.do", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("userId=" + id + "&email1=" + email1 + "&email2=" + email2);
  });
  
  
  
  function chkJoinForm() {
		 
	  let obj = document.fr;
      if(!(idPtn.test(obj.id.value))) {
          alert('아이디 4~12자 이외의 값, 한글, 특수문자등은 입력하실 수 없습니다.');
          obj.id.focus();
          return false;
      }
      
      if(!(passPtn.test(obj.password.value))) {
          alert('영문자, 숫자, 특수문자를 포함한 10~20자내의 비밀번호를 입력하세요.');
          obj.password.focus();
          return false;
      }
      
      if(!(passPtn.test(obj.passwordRetry.value))) {
          alert('영문자, 숫자, 특수문자를 포함한 10~20자내의 비밀번호를 입력하세요.');
          obj.passwordRetry.focus();
          return false;
      }
      
      if(!findFlag) {
    	  alert("이메일 인증, 번호확인 후에 진행해 주세요.");
    	  return false;
      }
      
      if(!passFlag) {
    	  alert("비밀번호 확인 후에 진행해 주세요.");
    	  return false;
      }
      
//       return false;
      obj.submit();
  }
  
  
  
  passwordRetry.addEventListener("keyup", passChk );
  
  password.addEventListener("keyup", passChk );
  
  function passChk() {
	  password = document.querySelector("#password");
	  passwordRetry = document.querySelector("#passwordRetry");
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
  
 
  
  

  </script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
  
</body>
</html>

