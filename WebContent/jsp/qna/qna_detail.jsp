<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="질문 답변 | 상세" />
</c:import>
</head>
<body>
	<div class="wrapper sWrapDetail">
		<c:import url="/jsp/include/header.jsp" />
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
				<div class="container">
				
					<div class="bottom_box">
						<div style="margin-bottom: 10px">
							<a href="#popup" class="floating comment">댓글 쓰기</a>

							<!-- 댓글작성 폼 -->
								<form method="post" action="<c:url value="/qna/qnacommentwrite.do"/>">
							<div id="popup" class="layer">
									<input type="hidden" name="boardPostNo" value="${b.qnaNo}" />
									<div class="box clearboth">
										<textarea id="comment" name="cmtContent" cols="30" rows="10"
											placeholder="댓글을 입력해주세요"></textarea>
										<button type="button" onclick="location.href='#'" class="close">닫기</button>
										<button type="submit" class="close">등록</button>
						
									</div>
							</div>
								</form>


							<a href="<c:url value="/qna/qnaList.do"/>"
								class="floating comment">목록</a>
						</div>

					</div>

					<div class="comments">
						<div class="item parent">

							<c:forEach var="cmt" items="${cmtList}">
								<p class="profile">${cmt.userId}</p>
								<p class="text">${cmt.cmtContent}</p>
								<div class="info">
									<p>
										<fmt:formatDate value="${cmt.cmtRegDt}"
											pattern="yyyy-MM-dd HH:mm" />
									</p>
									<a href="#popupMod">수정</a>
									<!-- 댓글수정 폼 팝업 -->
									<form method="post" action="<c:url value="/qna/qnacommentupdate.do"/>">
										<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
										<input type="hidden" name="qnaNo" value="${b.qnaNo}" />
										<div id="popupMod" class=layer>
											<div class="box">
												<textarea id="comment" name="cmtContent" cols="30" rows="10">${cmt.cmtContent}</textarea>
												<button type="button" onclick="location.href='#'" class="close">닫기</button>
												<!-- 
												<a href="#" class="close">닫기</a>
												 -->
												<button type="submit" class="close">등록</button>
												<!-- <input type="submit" class="close" value="등록"/>-->
												<!--<a href="#" class="close">등록</a>-->
											</div>
										</div>
									</form>
									<!-- 댓글 삭제 팝업-->	
									<a href="#popupDelCmt">삭제</a>
									<form method="post" action="<c:url value="/qna/qnacommentdelete.do"/>">
										<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
										<input type="hidden" name="qnaNo" value="${b.qnaNo}" />									
									<div id="popupDelCmt" class=layer>
										<div class="box">
											<p class="text">삭제 하시겠습니까?</p>
											<button type="button" onclick="location.href='#'" class="close">닫기</button>
											<!-- 
											 <a href="#" class="close">닫기</a>
											 -->
											<button type="submit" class="delete">삭제</button> 
											<!--<a class="delete">삭제</a>-->
										</div>
									</div>
									</form>
								</div>
							</c:forEach>
							<c:if test="${empty cmtList}">
								<p></p>
							</c:if>

						</div>
					</div>



				</div>
			</section>
		</div>
		<!-- //width = 1280px 인 컨텐츠영역 끝-->

		<%@include file="/jsp/include/footer.jsp"%>




	</div>
	
</body>
</html>

