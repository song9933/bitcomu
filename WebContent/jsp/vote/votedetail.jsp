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
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- // 헤더 끝-->
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
				<h2>투표상세보기페이지</h2>

				<div class="w3-container w3-card w3-white w3-round">
					<i class="fa fa-info-circle" aria-hidden="true"></i>
					<div class="w3-panel w3-blue">
						<h5>${vote.voteTitle}</h5>
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
										${vote.voteMenu}
									
									</c:when>
						</c:choose>
					</form>
					<button type="submit" class="w3-btn w3-green">투표하기</button>

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