<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="조별게시판" />
</c:import>
<style>
.projectNo_active_cws {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #0f5399;
	/* margin-top: -4px;
	padding-top: 10px; */
}
.teamNo_active_cws {
    border-color: #cccccca6;
	color: #0f5399;
    margin-top: 40px;
	margin-bottom: 40px;
	transform: scale(1.2);
	transition-duration: 0.3s;
    transition-timing-function: linear;
}
div.a_cws {
	border-top: 5px solid #0f5399;
	border-bottom: 5px solid #0f5399;
	padding: 10px;
 	padding-top: 60px; 
	padding-bottom: 70px;
	width: 120px;
	position: absolute;
}
.board_cws {
	border: 1px solid lightgray;
	width: 700px;
	font-size: 20px;
	padding: 20px;
	float: left;
	margin-left: 290px;
	border-radius: 15px;

}
.boardtitle_cws {
	width: 1000px;
	float: left; 
	padding: 20px;
	/* border: 1px solid lightgray; */
	margin: 0 auto;
	margin-left: 150px;
}
</style>
</head>

<body>
  <div class="wrapepr">
  <c:import url="/jsp/include/header.jsp"/>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
      <section class="content">

        <h2 class="title_cws"style="text-align: center">
		<a href="/teamBoardList.do">조별프로젝트 게시판</a></h2>
        <br><br><br><br>
        <div class="tabs_cws">
					<ul  class="projectNo_active_cws">
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=1">1 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=2">2 차</a></li>
						<li><a href="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=3">3 차</a></li>
					</ul>
				</div>
				<br> <br>

				<div class="subtabs_cws">
					<br>
					<c:if test="${sessionScope.user.userGrade eq 3}">
					<form method="post" name="sendForm" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}">
						<input type='hidden' id="codeValue" name="codeValue" value="${codeValue}">
						
						<p style="margin-left: 30px;">조 추가/삭제</p>
						<button type="button" onclick="doAdd();"
							style="width: 20px; height: 20px; margin-left: 40px;">+</button>
					
						<button type="button" onclick="doDel();"
							style="width: 20px; height: 20px;">-</button>
					 
<!-- 						<button type="submit">저장</button> -->
						<button type="button" onclick="sendTeam();">저장</button>
					</form>
					</c:if>
					
					<div class="a_cws">
						<ul id="teamtabs_cws">
						
						</ul>
<!-- 					</form> -->
					</div>
				</div>



      </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    <div class="background_cws">
    </div>
    <div class="writepopup_cws">
      <form method="post" action="${pageContext.request.contextPath}/team/teamBoardList.do?projectNo=${projectNo}&teamNo=${teamNo}">
        <button class="close_cws" style="width:50px; height:50px; 
      		background-color: white; opacity: .9; border: none">
      	</button>
      </form>
      <br>
      <h1 style="text-align: center">글등록</h1>
      <br>
     <form method='post' action='${pageContext.request.contextPath}/team/teamBoardWrite.do'
     		onsubmit="return writeConfirm()">
      <input type="hidden" name="userNo" value="${userNo}">
      
      <div>
        <select name="projectNo" id="projectNo" style="margin-left: 30px;">
          <option value="1">1차</option>
          <option value="2">2차</option>
          <option value="3">3차</option>
        </select>
        <select name="teamNo" id="teamNo">
        </select>
      </div>
      <div class="titleboard_cws">
        <input type="text" name="teamBoardTitle" id="teamBoardTitle"
        placeholder="제목을 입력하세요" 
        style="width: 100%; border: hidden">
        <br>
        <br>
        <div class="writecontent_cws">
          <textarea name="teamBoardContent" id="teamBoardContent" 
          placeholder="내용을 입력하세요."
          style="width: 98%; height: 100%; 
          font-size: 16px; text-align: left; 
          padding: 5px; resize: none"></textarea>
        </div>
        <br> 
<!--         <input type="file" id="myFile" -->
<!-- 				style="cursor: pointer; width: 180px; float: left; margin-left: -120px" -->
<!-- 				/> -->
<!-- 		<button type="button" onclick="uploadFile()">파일업로드</button> -->

					<!--         <input type="image" src="" style="margin-left: 20px;"> -->
        <br>
        <button class="submitbutton_cws" type="submit" >등록</button>
      </div>
     </form>
			  
<!-- 			<div><input type="text" name="msg"></div> -->
<!-- 			<div><input type="file" name="attach" multiple/></div> -->
<!-- 			<div><button>전송</button></div> -->
    </div>




  </div>
  <script>
  // $(document).ready(alert());
  
  	// 글등록시 null값 유효성검사, 글등록시 길이 제한
  	function writeConfirm(){
  		if (document.querySelector("#teamBoardTitle").value.trim().length == 0){
  			alert("제목을 입력하세요");
  			return false;
  		}
  		if (document.querySelector("#teamBoardContent").value.trim().length == 0){
  			alert("내용을 입력하세요");
  			return false;
  		}
  		if (document.querySelector("#teamBoardTitle").value.length > 66){
  	  		alert("제목은 66자리를 초과할 수 없습니다.");
  	  		return false;
  	  	}
  	  	if (document.querySelector("#teamBoardContent").value.length > 666){
  	  		alert("내용은 666자리를 초과할 수 없습니다.");
  	  		return false;
  	  	}
  	}
  
  // 조 갯수
	let teamTab = document.querySelector("#teamtabs_cws");
	let team = ${codeValue};
	for (let i = 1; i <= team; i++) {
		let liEle = document.createElement("li");
		let aEle = document.createElement("a");
		
		let txtNode = document.createTextNode(`\${i}조`);
		aEle.append(txtNode);
		liEle.append(aEle);
		liEle.setAttribute("id", `team\${i}`);
		teamTab.append(liEle);
	}
  	// select박스에 추가/삭제한 팀 번호 보여주기
	let teamNo = document.querySelector("#teamNo");
	for (let i = 1; i <= team; i++) {
		let opEle = document.createElement("option");
		opEle.value = `\${i}`;
		let tNode = document.createTextNode(`\${i}조`);
		opEle.append(tNode);
		teamNo.append(opEle);
			
	}
	// select박스에 선택된 프로젝트로 보여주기
	let proNo = document.querySelectorAll("#projectNo > option");
	for (let i = 0; i < proNo.length; i++) {
		if (proNo[i].value == ${projectNo})
			proNo[i].setAttribute("selected", true);
	}
	// select박스에 선택된 팀으로 보여주기
	let tNo = document.querySelectorAll("#teamNo > option");
		for (let i = 0; i < tNo.length; i++) {
		if (tNo[i].value == ${teamNo})
			tNo[i].setAttribute("selected", true);
	}
		
// 	uploadFile = function() {
// 		  let file = document.getElementById('myFile');
// 		  let filedata = new FormData(); // FormData 인스턴스 생성
	
// 		  if (!file.value) return; // 파일이 없는 경우 빠져나오기
	
// 		  filedata.append('uploadfile', file.files[0]);
	
// 		  let xml = new XMLHttpRequest();
// 		  xml.open('POST', 'teamBoardWrite.do', true);
// 		  xml.onload = function(event) {
// 		    if (xml.status == 200) {
// 		      alert('파일업로드 완료');
// 		    }
// 		    else {
// 		      alert('파일업로드에 실패했습니다.');
// 		    }
// 		  };
	
// 		  xml.send(filedata);
// 		};
  </script>
</body>

</html>