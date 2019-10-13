<%@page import="java.util.Map"%>
<%@page import="kr.co.bitcomu.repository.vo.Comment"%>
<%@page import="kr.co.bitcomu.repository.vo.Vote"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<%
	List<String> realMenu = (List) request.getAttribute("realMenu");
	Vote vote = (Vote)request.getAttribute("vote");
	List<Comment> cList = (List)request.getAttribute("cList");
	Map<String,Integer> menuCount = (Map)request.getAttribute("menuCount");
	%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="투표글쓰기" />
	</c:import>

	<style>
.vote_btn {
	float: left;
	margin-right: 5px;
}

.vote_detail {
	width: 550px;
	margin: 20px auto;
	padding: 20px 40px;
}

h2.vote_modal_title {
	padding: 13px 15px 20px 0px;
	font-size: x-large;
}

.vote_submit_button {
	margin-top: 20px;
}

/*카운트 다운 관련 CSS */
@import url(https://fonts.googleapis.com/css?family=Oswald:700);
/* body.dc {
  margin-top: 35px;
} */
.vote_countdown{
  	text-align: center;
    color: orangered;
    font-family: "Oswald";
    font-weight: 700;
    font-size: 1.7em;
    margin: 0 16%;
    padding: 10px;
}

/* 툴팁관련 */
/**
 * Tooltip Styles
 */

/* Add this attribute to the element that needs a tooltip */
[data-tooltip] {
  position: relative;
  z-index: 2;
  cursor: pointer;
}

/* Hide the tooltip content by default */
[data-tooltip]:before,
[data-tooltip]:after {
  visibility: hidden;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  filter: progid: DXImageTransform.Microsoft.Alpha(Opacity=0);
  opacity: 0;
  pointer-events: none;
}

/* Position tooltip above the element */
[data-tooltip]:before {
  position: absolute;
  bottom: 150%;
  left: 50%;
  margin-bottom: 5px;
  margin-left: -80px;
  padding: 7px;
  width: 160px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background-color: #000;
  background-color: hsla(0, 0%, 20%, 0.9);
  color: #fff;
  content: attr(data-tooltip);
  text-align: center;
  font-size: 14px;
  line-height: 1.2;
}

/* Triangle hack to make tooltip look like a speech bubble */
[data-tooltip]:after {
  position: absolute;
  bottom: 150%;
  left: 50%;
  margin-left: -5px;
  width: 0;
  border-top: 5px solid #000;
  border-top: 5px solid hsla(0, 0%, 20%, 0.9);
  border-right: 5px solid transparent;
  border-left: 5px solid transparent;
  content: " ";
  font-size: 0;
  line-height: 0;
}

/* Show tooltip content on hover */
[data-tooltip]:hover:before,
[data-tooltip]:hover:after {
  visibility: visible;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
  filter: progid: DXImageTransform.Microsoft.Alpha(Opacity=100);
  opacity: 1;
}


</style>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- // 헤더 끝-->
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
				<!-- breadcrumbs 위치 -->
				<div>
					<h4 style="text-align: center; color: gray;">현재위치 : 투표하기 - ${vote.voteTitle}</h4>
				</div>
				
			
				<div class="w3-container w3-card w3-white w3-round vote_detail">
				<!-- 차트 그리기 시작점 -->
				<div id="bar_chart_div"></div>
				</div>

				<div class="w3-container w3-card w3-white w3-round vote_detail">
					<h3>투표상세보기</h3>
					<i class="fa fa-info-circle" aria-hidden="true"></i>

					<%-- 마감일까지 카운트 다운 출력 시작 --%>
					<c:if test="${vote.voteCloseEnabled eq 'N'}">
						<div class="w3-card w3-light-grey w3-round" data-tooltip="마감일까지 남은시간">
						<h1 id="countdown" class="vote_countdown" ></h1>
						</div>
						
					</c:if>
					<div class="w3-panel w3-blue">
						<h2 class="vote_modal_title">${vote.voteTitle}</h2>
						<c:if test="vote.voteAnonyEnabled">
							<p>투표 결과는 익명처리됩니다.</p>
						</c:if>

						<p>${vote.voteContent}</p>
						<br>
					</div>
					
<!-- 					<form method="post" name="form"> -->
<!-- 						<input type="submit" value="update" -->
<!-- 							onclick="javascript: form.action='/manage/update';" /> -->
<!-- 						<input type="submit" value="delete" -->
<!-- 							onclick="javascript: form.action=<c:url value='/vote/votein.do' />;" /> -->
					<!-- 메인 투표 폼 컨텐츠 시작 -->
					<form method="post" name="form" >
					<c:choose>
						<c:when test="${user.userNo eq vote.userNo}"></c:when>
					</c:choose>
						<c:choose>
							<%-- 중복체크 가능한 체크박스형태  --%>
							<c:when test="${vote.voteType == 0}">
								<%--원래 메뉴의 이름을 입력할때 파악하기 위해 저장해놓는다. --%>
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="checkbox" class="w3-check" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
							<%-- 중복체크 불가능한 라디오박스형태  --%>
							<c:when test="${vote.voteType == 1}">
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="radio" class="w3-radio" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
						
						<%-- 참여or미참여 버튼 번경 --%>
							
						<c:choose>
							<c:when test="${commentinvote == 'N' && vote.voteCloseEnabled eq 'N'}">
						<input type="hidden" name="voteNo" value="${vote.voteNo}" />
							<button id="vote-in" type="submit" class="w3-btn w3-green vote_submit_button vote_btn"
							onclick="javascript: form.action=`<c:url value='/vote/votein.do'/>`;">투표하기</button>	
							</c:when>
							<c:when test="${commentinvote == 'Y' && vote.voteCloseEnabled eq 'N'}">
							<input type="hidden" name="voteNo" value="${vote.voteNo}" />
								<button id="vote-in-update" type="submit" class="w3-btn w3-green vote_submit_button vote_btn"
								onclick="javascript: form.action=`<c:url value='/vote/updatevotein.do' />`;">다시투표하기</button>
								<br><br>
								<div>나의 선택 : ${userContent}</div>
								
							</c:when>
						</c:choose>
					</form>
					
					<%-- 만약 작성자일 경우 마감하기 버튼이 나타나도록한다. 마감이미 되어있다면 나타나지 않는다. --%>
					<c:if
						test="${user.userNo eq vote.userNo && vote.voteCloseEnabled eq 'N'}">
						<form action="<c:url value='/vote/closevote.do' />" method="post">
							<input type="hidden" name="voteClose" value="${vote.voteNo}" />
							<button id="vote-close"
								class="w3-btn w3-deep-orange vote_submit_button vote_btn">마감하기</button>
						</form>
					</c:if>
					
					<%-- 만약 작성자일 경우 삭제하기 버튼이 나타나도록한다.--%>
					<c:if
						test="${user.userNo eq vote.userNo}">
						<form action="<c:url value='/vote/votedelete.do' />" method="post">
							<input type="hidden" name="voteDelete" value="${vote.voteNo}" />
							<button id="vote-delete"
								class="w3-btn w3-indigo vote_submit_button vote_btn">삭제하기</button>
						</form>
					</c:if>
					
					<%-- 로그인사용자가 작성자이고, 아직 투표에 참여한 사람이 없으면 수정하기 버튼이 나타나도록한다.--%>
					<c:if
						test="${user.userNo eq vote.userNo && vote.voteInCnt eq '0'}">
						<form action="<c:url value='/vote/votemodify.do' />" method="post">
							<input type="hidden" name="voteModify" value="${vote.voteNo}" />
							<button id="vote-modify"
								class="w3-btn w3-red vote_submit_button vote_btn">수정하기</button><br>
						</form>
					</c:if>
					
					

					<c:if test="${vote.voteCloseEnabled eq 'Y'}">
						<br><br><hr><br>
						<h3>마감된 투표입니다.</h3>
					</c:if>

				</div>
		</div>



	</section>	</div>
	<!-- //width = 1280px 인 컨텐츠영역 끝-->

	<%@include file="/jsp/include/footer.jsp"%>




	<script>
		
	
		function nodata(){
			let nodataMsg = document.createElement("h3");
			nodataMsg.innerText = "아직 집계된 통계가 없습니다.";
			
			document.getElementById("bar_chart_div").append(nodataMsg);
			
		}

		google.charts.load('current', { 'packages': ['bar', 'corechart'] });

		function schedulerSuccessAndFailChart() {
				
				 var data = google.visualization.arrayToDataTable([
				  ['선택지 이름', '<%= vote.getVoteTitle()%>'],
				  <% for (int i = 0; i < realMenu.size()-1; i++) {
				  	String menu = realMenu.get(i); %>
				  ['<%=menu%>', <%= menuCount.get(menu) %>],<%}%>
				  ['<%= realMenu.get((realMenu.size()-1)) %>', <%= menuCount.get(realMenu.get(realMenu.size()-1)) %>]], false);
			 
			 
			var barChartOption = {
				bars: 'vertical',
				height: 260,
				hAxis: {format: '0'},
				width: '100%',
				legend: { position: "top" },
				isStacked: false,
				tooltip: { textStyle: { fontSize: 14 }, showColorCode: true },
				animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					startup: true,
					duration: 1000,
					easing: 'linear'
				},
				annotations: {
					textStyle: {
						fontSize: 20,
						bold: true,
						italic: true,
						color: '#871b47',
						auraColor: '#d799ae',
						opacity: 0.8
					}
				}
			};

			var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
			
			
			//천단위마다 ,찍기.
			var formatter = new google.visualization.NumberFormat({pattern: '###,###'});
    	  	  formatter.format(data, 1);
			

			chart.draw(data, barChartOption);
			//반응형 그래프 출력
			window.addEventListener('resize', function () { chart.draw(data, barChartOption); }, false);
		}
		
		/* 어떤 투표도 되지 않았을 경우 노데이타 실행 */
		<% 
			int test = 0;
			for(int i = 0; i < realMenu.size(); i++){
			String menu = realMenu.get(i);
			if(menuCount.get(menu) != null) {
				test = test + 1;
			}
			
		}
		%>
		<% if(test != 0) { %>
		google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);
		<%} else {%> nodata(); <%}%>
		
		
	/*마감일까지 카운트다운 타이머 실행 스크립트*/
	// set the date we're counting down to
	var target_date = new Date(`${jsCloseDate}`).getTime();
 
	// variables for time units
	var days, hours, minutes, seconds;
 
	// get tag element
	var countdown = document.getElementById("countdown");
 
	// update the tag with id "countdown" every 1 second
	setInterval(function () {
 
    // find the amount of "seconds" between now and target
    var current_date = new Date().getTime();
    var seconds_left = (target_date - current_date) / 1000;
 
    // do some time calculations
    days = parseInt(seconds_left / 86400);
    seconds_left = seconds_left % 86400;
     
    hours = parseInt(seconds_left / 3600);
    seconds_left = seconds_left % 3600;
     
    minutes = parseInt(seconds_left / 60);
    seconds = parseInt(seconds_left % 60);
     
    // format countdown string + set tag value
    countdown.innerHTML = days + "일 " + hours + "시간 "
    + minutes + "분 " + seconds + "초 남음..";  
 
	}, 1000);
	</script>
</body>

</html>