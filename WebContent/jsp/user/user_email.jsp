<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="이메일인증" />
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
        <span class="inline_sub_top_sj selected"><i class="fa fa-envelope" aria-hidden="true">이메일 인증</i></span>
        <span class="inline_sub_top_sj" ><i class="fa fa-user-plus" aria-hidden="true">개인정보입력</i></span>
        <span class="inline_sub_top_sj"><i class="fa fa-lock" aria-hidden="true">가입완료</i></span>
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <form method="GET" action="${pageContext.request.contextPath}/user/userJoinForm.do">
      <div class="w1280">
          <section class="content">
              <div class="board_box_sj">
                  <p><span class="font_align_sj"><i class="fa fa-envelope-o" aria-hidden="true" style="color: #ffa500"></i> 이메일 인증</span></p>
                  <div class="board_box_sj box_detail_sj">
                    <span><strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i></text>이메일 주소를 입력해 주세요.</strong> </span><br/>
                    <span>
                    <input type="text"
                    name="emailAuth" id="emailAuth" class="input_box_sj box_default_sj" placeholder="인증할 이메일 주소를 입력하세요">
                    <button type="button" id="emailSend" class="button_box_sj">전송</button>
                  </span>
                  
                  </div>
                  
                    
                <div class="board_box_sj box_detail_sj"><span><strong><i class="fa fa-arrow-circle-right" aria-hidden="true" style="color: #ffa500"></i></text>이메일에서 받은 인증번호를 입력해 주세요.</strong> </span><br/>
   				<span>
                    <input type="text"
                  name="emailAuth" class="input_box_sj box_default_sj" id="emailAuthResult" placeholder="인증번호를 입력하세요"/></span>
						<span id="countdown" class="vote_countdown" >3:00</span>
                  
                </div>
                <div class="board_box_sj box_detail_sj">
                  <button type="submit" class="button_box_sj box_email_sj">회원가입</button><span class="margin_sj"></span>
                  <button type="button" onclick="location.replace('${pageContext.request.contextPath}/main.do')" class="button_box_sj box_email_sj">취소</button>
                </div>
              </div>
          </section>
      </div> 
    
  </form>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <!-- width= 100%인 컨텐츠 영역-->
    <div class="video">
      <div class="w1280 mt100">

      </div>
    </div>
    <%@include file="/jsp/include/footer.jsp" %>
    


  </div>
  <script>
  
  	  let joinFlag = false;
  
	  let emailSend = document.querySelector("#emailSend");
	  
	  emailSend.addEventListener("click", (e) => {
		  
		  let emailAuth = document.querySelector("#emailAuth").value;
		  if (emailAuth.length == 0) {
			  alert("제대로 된 이메일 주소를 입력해주세요.");
			  return;
		  }
		  
		  
		  let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						let result = xhr.responseText.trim();
						if (result == 'Invalid Addresses') {
							alert("이메일 형식이 맞지 않습니다.");
							return;
						} else if (result == 'error') {
							alert("시스템 오류입니다.");
							return;
						}
						callbackResult(result);
						
					}

				}
			};	
			xhr.open("POST", "userEmailAuth.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("emailAddr=" + emailAuth);
	  });
	  
	  function callbackResult(result) {
		 return result;
	  }
	  
	  
	  
	  

	  	  
		
		

		function startTimer(duration, display) {
		    var timer = duration, minutes, seconds;
		    setInterval(function () {
		        minutes = parseInt(timer / 60, 10);
		        seconds = parseInt(timer % 60, 10);

		        minutes = minutes < 10 ? "0" + minutes : minutes;
		        seconds = seconds < 10 ? "0" + seconds : seconds;

// 		        display.textContent = minutes + ":" + seconds;
		        countdown.innerHTML = minutes + ":" + seconds;  
		        if (--timer < 0) {
		            timer = duration;
		        }
		    }, 1000);
		}
		function callTimer () {
		    var fiveMinutes = 60 * 3,
		    countdown = document.getElementById("countdown");
		    startTimer(fiveMinutes, countdown);
		};

  </script>
</body>
</html>



