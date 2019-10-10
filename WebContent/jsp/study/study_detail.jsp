<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
	<c:param name="msg" value="스터디게시판 | 상세" />
</c:import>
</head>
<body>
	<div class="wrapper sWrapDetail">
		<c:import url="/jsp/include/header.jsp" />
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
				<div class="container">
					<div class="top_box">
					<c:if test="${!empty sessionScope.user.userNo }">
						<a class="write" href="<c:url value="/study/studywriteform.do" />">
						<i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a>
					</c:if>
					</div>
					<article>
						<p class="completed" id="completed">${study.studyRecruitEnabled}</p>
						<h1>${study.studyPostTitle}</h1>
						<p>${study.userId}</p>
						<p class="info">
							<span><fmt:formatDate value="${study.studyRegDt}" pattern="yyyy-MM-dd HH:mm" /></span> 
							<span class="viewcount"><i class="fa fa-eye" aria-hidden="true"></i>${study.studyViewCnt}</span>
							<span class="commentcount"><i class="fa fa-comment-o" aria-hidden="true"></i>${studyCmtCnt}</span>
						</p>
						<div class="about">
							<h3>${study.studyLoc}</h3>
							<h3>${study.studyRecruitField}</h3>
							<h3>${study.studyRecruitMemMin} - ${study.studyRecruitMemMax} 명</h3>
						</div>
						<p class="text">${study.studyPostContent}</p>
					</article>
					<div class="bottom_box">
						<div style="margin-bottom: 10px">
						<c:if test="${!empty sessionScope.user.userNo }">
							<a href="#popup" class="floating comment">댓글 쓰기</a>
						</c:if>

							<!-- 댓글작성 폼 -->
							<form name="crForm" method="post" action="<c:url value="/study/studycommentwrite.do"/>" onsubmit ="return commentRegist()">
								<div id="popup" class="layer">
									<input type="hidden" name="boardPostNo" value="${study.studyPostNo}" />
									<div class="box clearboth">
										<textarea id="comment" name="cmtContent" cols="30" rows="10"
											placeholder="댓글을 입력해주세요"></textarea>
										<button type="button" onclick="location.href='#'" class="close">닫기</button>
										<button type="submit" class="close">등록</button>
									</div>
								</div>
							</form>


							<a href="<c:url value="/study/studyList.do"/>"
								class="floating comment">목록</a>
						</div>
						<c:if test="${sessionScope.user.userNo eq study.userNo || sessionScope.user.userGrade eq 3}">
						<a href="#popupDel" class="floating delete">삭제</a>
						<form method="post" action="<c:url value="/study/studydelete.do"/>">
						<input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
						<div id="popupDel" class=layer>
							<div class="box">
								<p class="text">삭제 하시겠습니까?</p>
								<button type="button" onclick="location.href='#'" class="close">닫기</button>
								<button type="submit" class="delete">삭제</button> 
							</div>
						</div>
						</form>
						</c:if>
						<c:if test="${sessionScope.user.userNo eq study.userNo }">
						<a href="<c:url value="/study/studyupdateform.do?studyPostNo=${study.studyPostNo}" />"
							class="floating modify">수정</a>
						</c:if>
					</div>
					<div class="comments">
						<div class="item parent">

							<c:forEach var="cmt" items="${cmtList}">
								<p class="profile">${cmt.userId}</p>
								<p class="text">${cmt.cmtContent}</p>
								<div class="info">
									<p>
										<fmt:formatDate value="${study.studyRegDt}"
											pattern="yyyy-MM-dd HH:mm" />
									</p>
									<c:if test="${sessionScope.user.userNo eq cmt.userNo}" >
									<a href="#popupMod">수정</a>
									<!-- 댓글수정 폼 팝업 -->
									<form method="post" action="<c:url value="/study/studycommentupdate.do"/>">
										<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
										<input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
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
									<form method="post" action="<c:url value="/study/studycommentdelete.do"/>">
										<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
										<input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />									
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
									</c:if>
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
	<script>
	
	let ele = document.getElementById("completed");
	if (ele.innerText == 'Y'){
		ele.innerText = '모집중';
		
	} else {
		ele.innerText  = '마감';
	}
	
	
	function commentRegist(){
		let f = document.crForm;
		if (f.cmtContent.value == "") {
			alert("내용을 입력해주세요.")
		return false;
		}
		return true;
	}
	
	</script>
</body>
</html>

