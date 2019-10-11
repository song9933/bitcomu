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
                          name="password" class="input_box_sj box_join_sj" placeholder="비밀번호를 입력하세요"> * 10~20자 이하 영문.숫자,특수문자(~,!,#,$,%,^,*) 조합으로 입력하세요.</td>
                      </tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td> <input type="password"
                          name="passwordRetry" class="input_box_sj box_join_sj" placeholder="비밀번호를 확인"> * 비밀번호가 일치합니다.</td>
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
                            name="email1" class="input_box_sj box_join_sj">@
                            <input type="text"
                     name="email2" class="input_box_sj box_join_sj">
                        </tr>
                      <tr>
                        <td>생년월일</td>  
                        <td>
                            <input type="date"
                            name="birth" class="input_box_sj box_join_sj" >
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
  userChk.addEventListener("click", e => {
	  let id = document.querySelector("#id").value;
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
  
  
  
  
  
  
  
  let idPtn = /[a-zA-Z0-9]{3,11}/;
  let namePtn = /[ㄱ-ㅎㅏ-ㅣ가-힣]{1,7}/;
//   let pwdPtn = 
  
//   var languageCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  


  
  

  function fun2() {
     
	  let obj = document.fr;
      
      if(!(idPtn.test(obj.id.value))) {
          alert('아이디 4~12자 이외의 값, 한글, 특수문자등은 입력하실 수 없습니다.');
          obj.id.focus();
          return false;
      }
      
      
      if(!(namePtn.test(obj.name.value))) {
          alert('이름 6자이상의 값, 한글이외의 값은 입력하실 수 없습니다.');
          obj.name.focus();
          return false;
      }
      /*
      if(obj.password.value == '') {
          alert('패스워드를 입력하세요');
          obj.password.focus();
          return false;
      }
      if(obj.password_c.value == '' || obj.password_c.value != obj.password.value) {
          alert('패스워드를 정확히 입력해주세요');
          obj.password_c.value = "";
          obj.password_c.focus();
          return false;
      }
      if(obj.gender.value == '') {
          alert('성별을 선택하세요');
          obj.gender.focus();
          return false;
      }
      if(obj.job.selectedIndex == 0)    {
          alert('직업을 선택하세요');
          obj.job.focus();
          return false;
      }
      if (document.fr.hobby[0].checked == false
              && document.fr.hobby[1].checked == false
              && document.fr.hobby[2].checked == false) {
          alert('취미를 선택하세요');
          document.fr.hobby[0].focus();
          return false;
      }
      if(obj.bio.value == '') {
          alert('자기소개를 입력하세요');
          obj.bio.focus();
          return false;
      }
      

      //obj.submit();
      alert('Success.. Contents Clear');
      obj.reset();
      document.getElementById("alert_text").innerHTML=('<span style="color: #777">아이디를 입력해주세요</span>');    
      document.getElementById("alert_password").innerHTML=('<span style="color: #777">패스워드를 한번 더 입력해주세요</span>');
      */
  }

  
  
  
  let sendJoin = document.querySelector("#sendJoin");
  sendJoin.addEventListener("click", fun2);
  
  

  </script>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</body>
</html>

