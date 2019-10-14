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
							<a class="write"
								href="<c:url value="/study/studywriteform.do" />"> 
								<i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a>
						</c:if>
					</div>
					<article>
						<p class="completed" id="completed">${study.studyRecruitEnabled}</p>
						<h1>${study.studyPostTitle}</h1>
						<p>${study.userId}</p>
						<p class="info">
							<span>${study.studyRegDt}</span> <span class="viewcount"><i
								class="fa fa-eye" aria-hidden="true"></i>${study.studyViewCnt}</span> <span
								class="commentcount"><i class="fa fa-comment-o"
								aria-hidden="true"></i>${studyCmtCnt}</span>
						</p>
						<div class="about">
							<h3>${study.studyLoc}</h3>
							<h3>${study.studyRecruitField}</h3>
							<h3>${study.studyRecruitMemMin}- ${study.studyRecruitMemMax}
								명</h3>
						</div>
						<p class="text">${study.studyPostContent}</p>
					</article>
					<div class="bottom_box">
						<div style="margin-bottom: 10px">
							<c:if test="${!empty sessionScope.user.userNo }">
								<a href="#popup" class="floating comment">댓글 쓰기</a>
							<!-- 댓글작성 폼 -->
							<form name="crForm" method="post" action="<c:url value="/study/studycommentwrite.do"/>" onsubmit="return commentRegist()">
								<div id="popup" class="layer">
									<input type="hidden" name="boardPostNo" value="${study.studyPostNo}" />
									<div class="box clearboth">
										<textarea id="comment" name="cmtContent" cols="30" rows="10" placeholder="댓글을 입력해주세요"></textarea>
										<button type="button" onclick="location.href='#'" class="close">닫기</button>
										<button type="submit" class="close">등록</button>
									</div>
								</div>
							</form>	
							</c:if>

							<a href="<c:url value="/study/studyList.do"/>"
								class="floating comment">목록</a>
						</div>
						<c:if
							test="${sessionScope.user.userNo eq study.userNo || sessionScope.user.userGrade eq 3}">
							<a href="#popupDel" class="floating delete">삭제</a>
							<form method="post"
								action="<c:url value="/study/studydelete.do"/>">
								<input type="hidden" name="studyPostNo"
									value="${study.studyPostNo}" />
								<div id="popupDel" class=layer>
									<div class="box">
										<p class="text">삭제 하시겠습니까?</p>
										<button type="button" onclick="location.href='#'"
											class="close">닫기</button>
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
					
					<!-- 댓글목록 시작 -->
					<div class="comments">
						<c:forEach var="cmt" items="${cmtList}">
					
							<div class="item parent" name="parent">
							<input type="hidden" name="pCmtNo" value="${cmt.parentCmtNo}"/>
								<p class="profile">${cmt.userId}</p>
								<p class="text">${cmt.cmtContent}</p>
								<div class="info">
								<p>${cmt.cmtRegDt}</p>
						<c:if test="${sessionScope.user.userNo eq cmt.userNo}">
						<a href="#popupMod${cmt.cmtNo}" >수정</a>
						
						<!-- 댓글 수정폼 팝업 -->
						<form method="post" action="<c:url value="/study/studycommentupdate.do"/>">
							<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" />
							<input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
							<div id="popupMod${cmt.cmtNo}" class=layer>
								<div class="box">
									<textarea id="comment" name="cmtContent" cols="30" rows="10">${cmt.cmtContent}</textarea>
									<button type="button" onclick="location.href='#'" class="close">닫기</button>
									<button type="submit" class="close">등록</button>							
								</div>
							</div>
						</form>	
						</c:if>
						
						<c:if
							test="${sessionScope.user.userNo eq study.userNo || sessionScope.user.userGrade eq 3}">
						<a href="#popupDelCmt${cmt.cmtNo}">삭제</a>
						
						<!-- 댓글 삭제 팝업-->
						<form method="post"	action="<c:url value="/study/studycommentdelete.do"/>">
							<input type="hidden" name="cmtNo" value="${cmt.cmtNo}" /> 
							<input type="hidden" name="studyPostNo" value="${study.studyPostNo}" />
									<div id="popupDelCmt${cmt.cmtNo}" class=layer>
											<div class="box">
												<p class="text">삭제 하시겠습니까?</p>
												<button type="button" onclick="location.href='#'" class="close">닫기</button>
												<button type="submit" class="delete">삭제</button>
											</div>
									</div>
						</form>		
						</c:if>
						
						</div>
						<!-- 대댓글 입력 -->
						<c:if test="${cmt.parentCmtNo eq 0}">
										<div class="item child">
											<a href="#popupR${cmt.cmtNo}">대댓글을 입력해주세요</a>
										</div>
									<form name="crrForm" method="post"
										action="<c:url value="/study/studyrecommentwrite.do"/>"
										onsubmit="return commentRegist2()">
										<div id="popupR${cmt.cmtNo}" class="layer">
											<input type="hidden" name="boardPostNo"
												value="${study.studyPostNo}" /> 
											<input type="hidden"
												name="parentCmtNo" value="${cmt.cmtNo}" />
											<div class="box clearboth">
												<textarea id="comment" name="cmtContent" cols="30" rows="10"
													placeholder="댓글을 입력해주세요"></textarea>
												<button type="button" onclick="location.href='#'"
													class="close">닫기</button>
												<button type="submit" class="close">등록</button>
											</div>
										</div>
									</form>
									</c:if>
								
							</div>
					</c:forEach>
					</div>

				</div>

			</section>
		</div>
	</div>
	<!-- //width = 1280px 인 컨텐츠영역 끝-->

	<%@include file="/jsp/include/footer.jsp"%>

	
	<script>
	let pEle = document.getElementsByName("parent");
	let pNo = document.getElementsByName("pCmtNo");
	for(let i = 0; i < pNo.length; i++){
	//console.log(pNo[i].value);
	if(pNo[i].value != '0'){
		pEle[i].style.marginLeft = 30 + "px";
	}
	}
	
/* 
	if(pNo.value != '0'){
		console.log(pNo.value);
		pEle.style.marginLeft = 20 + "px";
	}
 */
		let ele = document.getElementsByClassName("completed");
		for (let i = 0; i < ele.length; i++) {

			if (ele[i].innerText == 'Y') {
				ele[i].innerText = '모집중';
				ele[i].style.background = '#7D9EF8';
				ele[i].style.color = 'white';
			} else if (ele[i].innerText != '모집중') {
				ele[i].innerText = '마감';
			}
		}

		function commentRegist() {
			let f = document.crForm;
			if (f.cmtContent.value == "") {
				alert("내용을 입력해주세요.")
				return false;
			}
			return true;
		}
		
		function commentRegist2() {
			let f = document.crrForm;
			if (f.cmtContent.value == "") {
				alert("내용을 입력해주세요.")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>

