<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<%
	List<String> realMenu = (List) request.getAttribute("realMenu");
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
 h2.vote_modal_title{
    padding: 13px 15px 20px 0px;
    font-size: x-large;
}
.vote_submit_button{
    margin-top: 20px;
}
</style>
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- // 헤더 끝-->
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">

				<div class="w3-container w3-card w3-white w3-round vote_detail">
				<h3>투표상세보기</h3>
					<i class="fa fa-info-circle" aria-hidden="true"></i>
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
							<%-- 중복체크 가능한 체크박스형태  --%>
							<c:when test="${vote.voteType == 0}">
								<%--원래 메뉴의 이름을 입력할때 파악하기 위해 저장해놓는다. --%>
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="checkbox" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
							<%-- 중복체크 불가능한 라디오박스형태  --%>
							<c:when test="${vote.voteType == 1}">
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="radio" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					<input type="hidden" name="voteNo" value="${vote.voteNo}" />
					<button type="submit" class="w3-btn w3-green vote_submit_button">투표하기</button>
					</form>

				</div>
		</div>



		</section>
	</div>
	<!-- //width = 1280px 인 컨텐츠영역 끝-->

	<%@include file="/jsp/include/footer.jsp"%>




	</div>
	<script>
		//   $(document).ready(alert());
	</script>
</body>

</html>