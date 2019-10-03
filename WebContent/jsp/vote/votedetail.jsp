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
body {
	font: normal 13px/20px Arial, Helvetica, sans-serif;
	word-wrap: break-word;
	background: #fff;
	padding-top: 100px
}

.countdown-label {
	font: thin 15px Arial, sans-serif;
	color: #65584c;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
	letter-spacing: 2px;
	margin-top: 9px
}

#countdown {
	box-shadow: 0 1px 2px 0 rgba(1, 1, 1, 0.4);
	width: 240px;
	height: 96px;
	text-align: center;
	background: #f1f1f1;
	border-radius: 5px;
	margin: auto;
}

#countdown #tiles {
	color: #fff;
	position: relative;
	z-index: 1;
	text-shadow: 1px 1px 0px #ccc;
	display: inline-block;
	font-family: Arial, sans-serif;
	text-align: center;
	padding: 20px;
	border-radius: 5px 5px 0 0;
	font-size: 48px;
	font-weight: thin;
	display: block;
}

.color-full {
	background: #53bb74;
}

.color-half {
	background: #ebc85d;
}

.color-empty {
	background: #e5554e;
}

#countdown #tiles>span {
	width: 70px;
	max-width: 70px;
	padding: 18px 0;
	position: relative;
}

#countdown .labels {
	width: 100%;
	height: 25px;
	text-align: center;
	position: absolute;
	bottom: 8px;
}

#countdown .labels li {
	width: 102px;
	font: bold 15px 'Droid Sans', Arial, sans-serif;
	color: #f47321;
	text-shadow: 1px 1px 0px #000;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
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
				<div class="w3-container w3-card w3-white w3-round vote_detail">
				<!-- 차트 그리기 시작점 -->
				<div id="bar_chart_div"></div>
				</div>

				<div class="w3-container w3-card w3-white w3-round vote_detail">
					<h3>투표상세보기</h3>
					<i class="fa fa-info-circle" aria-hidden="true"></i>
					<%-- 마감일까지 카운트 다운 출력 시작 --%>
						<input type="hidden" id="set-time" value="3" />
						<div id="countdown">
							<div id='tiles' class="color-full"></div>
							<div class="countdown-label">마감일까지 남은시간</div>
						</div><br>
					<div class="w3-panel w3-blue">
						<h2 class="vote_modal_title">${vote.voteTitle}</h2>
						<c:if test="vote.voteAnonyEnabled">
							<p>투표 결과는 익명처리됩니다.</p>
						</c:if>

						<p>${vote.voteContent}</p>
						<br>
					</div>
					<form action="<c:url value='/vote/votein.do' />">
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
						<input type="hidden" name="voteNo" value="${vote.voteNo}" />
						
						<%-- 참여or미참여 버튼 번경 --%>
							
						<c:choose>
							<c:when test="${commentinvote == 'N'}">
							<button id="vote-in" type="submit" class="w3-btn w3-green vote_submit_button">투표하기</button>	
							</c:when>
							<c:when test="${commentinvote == 'Y'}">
								<button id="vote-in" type="butten" disabled class="w3-btn w3-green vote_submit_button">참여한투표</button>
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
								class="w3-btn w3-deep-orange vote_submit_button">마감하기</button>
						</form>
					</c:if>

					<c:if test="${vote.voteCloseEnabled eq 'Y'}">
						<br><hr><br>
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
		var minutes = $( '#set-time' ).val();

var target_date = new Date().getTime() + ((minutes * 60 ) * 1000); // set the countdown date
var time_limit = ((minutes * 60 ) * 1000);
//set actual timer
setTimeout(
  function() 
  {
    alert( 'done' );
  }, time_limit );

var days, hours, minutes, seconds; // variables for time units

var countdown = document.getElementById("tiles"); // get tag element

getCountdown();

setInterval(function () { getCountdown(); }, 1000);

function getCountdown(){

	// find the amount of "seconds" between now and target
	var current_date = new Date().getTime();
	var seconds_left = (target_date - current_date) / 1000;
  
if ( seconds_left >= 0 ) {
  console.log(time_limit);
   if ( (seconds_left * 1000 ) < ( time_limit / 2 ) )  {
     $( '#tiles' ).removeClass('color-full');
     $( '#tiles' ).addClass('color-half');

		} 
    if ( (seconds_left * 1000 ) < ( time_limit / 4 ) )  {
    	$( '#tiles' ).removeClass('color-half');
    	$( '#tiles' ).addClass('color-empty');
    }
  
	days = pad( parseInt(seconds_left / 86400) );
	seconds_left = seconds_left % 86400;
		 
	hours = pad( parseInt(seconds_left / 3600) );
	seconds_left = seconds_left % 3600;
		  
	minutes = pad( parseInt(seconds_left / 60) );
	seconds = pad( parseInt( seconds_left % 60 ) );

	// format countdown string + set tag value
	countdown.innerHTML = "<span>" + hours + ":</span><span>" + minutes + ":</span><span>" + seconds + "</span>"; 
}
  
}

function pad(n) {
	return (n < 10 ? '0' : '') + n;
}
		
	</script>
</body>

</html>