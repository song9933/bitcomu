<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>비트캠프 커뮤니티 | 투표</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>


</head>
<Style>
.dc_form {
	width: 70%;
}
</Style>
<body>
	<div class="wrapepr">
		<!-- 헤더 -->
		<div class="w1280">
			<header>
				<h1>
					<a href="./index.html"><img src="img/logo.png" alt="비트컴퓨터로고"></a>
				</h1>
				<ul class="gnb">
					<li><a href="./notice.html">공지</a></li>
					<li><a href="#">커뮤니티</a>
						<ul class="dep2">
							<li><a href="./board_talk.html">자유게시판</a></li>
							<li><a href="./board_team.html">조별게시판</a></li>
							<li><a href="./board_study.html">스터디게시판</a></li>
						</ul></li>
					<li><a href="./qna.html">질문답변</a></li>
					<li><a href="./vote.html">투표</a></li>
					<li><a href="./onlineclass.html">온라인강의</a></li>
				</ul>
				<ul class="nav">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</header>
		</div>
		<!-- // 헤더 끝-->
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
				<h2>투표하기</h2>
				<button type="button" onclick="document.getElementById('writevoteform').style.display='block'"
					class="w3-button w3-round w3-blue dc_writevote">새 투표 등록</button>
				
				<!-- <button
					onclick="document.getElementById('dc_modal').style.display='block'"
					class="w3-btn w3-black">Open Modal</button>

				리스트의 글들을 클릭하면 무조건 온클릭 이벤트가 발생해서 모달이 열리게 해야하고.
				그 투표글의 타입에 따라 다른 에이아웃의 코드가 분기되서 틀을 잡아야하고.
				
				해당 틀의 내용들은 모두 동적으로 DB에서 가져와야함.
				
				이를 구현하기 위해선 먼저, 글쓰기를 처리해야하는데, 글쓰기또한 모달에서 실행되어야함.
				
				그러면 새투표 등록버튼에서 어떤 모달을 띄우고, 그 모달안에 인풋폼이 들어가야함. -->


				<!-- 투표모달창 시작 -->
				<div id="writevoteform" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span
								onclick="document.getElementById('writevoteform').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>

							<%-- 투표 등록하는 폼 시작 --%>
							<form id="dc_form_write" class="dc_form w3-panel w3-card-4"
								action="votewrite.do" method="post">
								<h1>새 투표 등록하기</h1>

								<div>투표 제목을 입력해주세요.</div>
									<input class="w3-input" type="text" name="voteTitle" placeholder="투표제목">
								
								<br>
								
								<div>마감 기한을 선택해주세요.</div>
								<div>
									<input type="date" name="voteExDate" >
								</div>
								<br>
								<div>투표에대한 간략한 설명을 입력해주세요.</div>
									<textarea class="w3-input" placeholder="투표에 대한 기본 설명입력.." 
									name="voteContent"></textarea>
								
								<br>
								<div>중복체크 가능여부 설정(체크박스로 변경)</div>
								<input class="w3-check" type="checkbox" name="voteMultiCheck" value="1"> <label>중복체크 가능</label>
								
								<div>투표 선택지1의 이름.</div>
									<input class="w3-input" type="text" placeholder="항목을 입력하세요"
									name="menu" value="1">
								<br>
								<div>투표 선택지2의 이름.</div>
									<input class="w3-input" type="text" placeholder="항목을 입력하세요"
									name="menu" value="">
								<br>
								<div>투표 선택지3의 이름.</div>
									<input class="w3-input" type="text" placeholder="항목을 입력하세요"
									name="menu" value="">
								<br> <i class="fa fa-plus-square" aria-hidden="true"></i> <i
									class="fa fa-minus-square" aria-hidden="true"></i>

								<p>
									<input class="w3-check" type="checkbox" name="voteNotice"> <label>공지사항으로 적용</label>
								</p>
								<p>
									<input class="w3-check" type="checkbox" name="voteAnonymous"> <label>익명투표허용</label>
								</p>
								<br>
								<p>
									<button type="submit" class="w3-btn w3-blue">등록하기</button>
								</p>
								<br>
							</form>
						</div>
					</div>
				</div>
				<!-- 투표모달창 끝 -->



				<!-- 모달로 처리되는 부분 시작 -->
				<div id="dc_modal" class="w3-modal">
					<div class="w3-modal-content w3-card-4">
						<header class="w3-container w3-white">
							<span
								onclick="document.getElementById('dc_modal').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>

							<div class="w3-container w3-card w3-white w3-round"
								id="dc_modal_content">
								<h3>
									<공지>
									<익명>반장 선출 투표
								</h3>
								<i class="fa fa-info-circle" aria-hidden="true"></i>
								<div class="w3-panel w3-blue">
									<h5>반장 선출 투표</h5>
									<p>투표 결과는 익명처리됩니다.</p>
									<p>뽑고싶은 사람 이름을 선택하세요.</p>
									<br>
								</div>

								<!-- 셀렉트박스 -->
								<div class="w3-container w3-card w3-white">
									<form action="/action_page.php">
										<h3>투표하기</h3>

										<select class="w3-select" name="option">
											<option value="" disabled selected>선택해 주세요..</option>
											<option value="1">유승재</option>
											<option value="2">박남수</option>
											<option value="3">임진산</option>
											<option value="4">최우석</option>
											<option value="5">오동훈</option>
											<option value="6">신용환</option>
										</select> <br> <br> <br>
									</form>

								</div>
								<br>
								<p>
									<button type="submit" class="w3-btn w3-green">투표하기</button>
								</p>

							</div>
					</div>
				</div>
				<!-- 모달로 처리되는 부분 끝 -->
				
				<%-- 투표 리스트 출력시작 --%>
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach var="v" items="${list}">
							<div class="w3-panel w3-card-4 w3-round dc_listbox"
							onclick="location.href='/vote/votedetail.do?voteNo=${v.voteNo}'">
								<p>
									<c:if test="${v.voteNotice eq 'Y'}">
										<공지>
									</c:if>
									<c:if test="${v.voteAnonymous eq 'Y'}">
										<익명>
									</c:if>
									<div onclick="location.href'<c:url value="/vote/votedetail.do?voteNo=${v.voteNo}" />'">${v.voteTitle}</div>
								</p>
								<p>
									written by SBC
									<fmt:formatDate value="${v.voteRegDate}"
										pattern="yyyy년 MM월 dd일 hh시 mm분 " />
								</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="w3-panel w3-card-4 w3-round dc_listbox">
							<p>등록된 투표가 없습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>
				<%-- 투표 리스트 출력 끝 --%>
				

			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<!-- 푸터 -->
		<footer class="w1280">
			<p>Copyright &copy; 비트캠프 All rights reserved.</p>
		</footer>
		<!--// 푸터 끝-->




	</div>
	<script>
//   $(document).ready(alert());
  $(document).on("click", ".open-AddBookDialog", function () { var myBookId = $(this).data('id'); $(".modal-body #bookId").val(myBookId);
//   As pointed out in comments,
  // it is superfluous to have to manually call the modal. //
  $('#addBookDialog').modal('show'); });

    </script>
</body>

</html>