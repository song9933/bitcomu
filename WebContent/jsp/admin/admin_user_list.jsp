<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="유저관리" />
</c:import> 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datatables.min.css">
 <script src="${pageContext.request.contextPath}/resources/js/datatables.min.js"></script>
</head>
<style>
	table td:nth-child(5), table td:nth-child(6) {
    	width: 80px;
	}
	thead td:last-child {
    	text-align: center;
	}
	table {width: 80%}
	
	.pagination>li {
    	display: inline-block;
	}

	ul.pagination.nams {
	    width: 400px;
	    margin: 10px auto;
	    display: block;
	}

	.ns_search {
	    width: 280px;
	    display: block;
	    margin: 0px auto;
	}

	.ns_listlength {
		float: right;
	}
	
	.button_box_sj.box_email_sj {
		height: 40px;
	}
	
	
</style>
<body>
   <div class="wrapepr">
     
    <%@ include file="/jsp/include/header.jsp"%>
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
          <section class="content">
       <div class="tab-box sj">
	      <ul class="sj">
	      <li class="sj selected"><a href="${pageContext.request.contextPath}/admin/adminUserList.do">유저관리</a></li>
	      <li class="sj"><a href="${pageContext.request.contextPath}/admin/boardAllListForm.do">게시판 관리</a></li>
	      </ul>
	      
   		</div> 

		
		 <div>	
			  <button type="button" class="button_box_sj box_email_sj" id="delSelUser">유저선택삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <button type="button" class="button_box_sj box_email_sj" id="delAllUser">유저전체삭제</button>
          </div>
           


            <div class="ns_listlength">
              
                <select name="changeList" id="changeList">
                    <option value="10" selected>10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                </select>씩 보기
            </div>
  			<table id="table_id" class="display">
			    <thead>
			        <tr>
			            <td style="margin: 0 auto; padding: 10px;"><input type="checkbox" id="allChk"/></td>
			            <td><b>유저아이디</b></td>
			            <td><b>유저이름</b></td>
			            <td><b>권한</b></td>
			            <td colspan=2><b>관리</b></td>
			        </tr>
			    </thead>
			    <tbody>
			    <c:if test="${empty userList}">
			    <tr>
			    <td colspan="5" align="center">가입된 회원이 없습니다.
			    </td>
			    </tr>
			    </c:if>
		
			       <c:forEach var="member" items="${userList}">
                  <tr>
                  	  <td><input type="checkbox" name="delChk" class="delChk" value="${member.userNo}"/></td>
                      <td>${member.userId}</td>
                      <td>${member.userName}</td>
                      <td>
                      <c:choose>
                      	<c:when test="${member.userGrade eq '2'}">
                      		Y
                      	</c:when>
                      	<c:otherwise>
                      		N
                      	</c:otherwise>
                      </c:choose>
                      </td>
                      
                      <td>
                      <form method="POST" action="<c:url value="/admin/adminUserAuthUpdate.do"/>">
                      <input type="hidden" name="pageNo" value="${pr.pageNo}">
                      <input type="hidden" name="userNo" value="${member.userNo}">
                      <input type="hidden" name="userGrade" value="${member.userGrade}">
                     
                      <button type="submit" class="button_box_sj box_email_sj">
                      <c:choose>
                      	<c:when test="${member.userGrade eq '2'}">
                      		권한 뺏기
                      	</c:when>
                      	<c:otherwise>
                      		권한 부여
                      	</c:otherwise>                      	
                      </c:choose> 
                      </button>
                      </form>
                      </td>
                      <td>
                      <form method="POST" action="<c:url value="/admin/adminUserDelete.do"/>"> 
                   			<input type="hidden" name="userNo" value="${member.userNo}">
                   			<input type="hidden" name="pageNo" value="${pr.pageNo}">
                      		<button type="submit" class="button_box_sj box_email_sj">
                      				강제 탈퇴
                      		</button>
                      </form>              
                      </td>

                  </tr>
                </c:forEach>
              
			    </tbody>
			</table>
			<br />
		 
              <ul class="pagination nams">
                <c:if test="${pr.count ne 0}">
			  	<c:if test="${pr.prev}">
			    <li>
			      <a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${pr.beginPage -1}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if>" aria-label="previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			   
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    	<li 
			    		<c:if test="${pr.pageNo == i}">class="active"</c:if>
			    	><a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${i}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if>">${i}</a></li>
			    </c:forEach>
			  	<c:if test="${pr.next}">
			    <li>
			      	  <a href="${pageContext.request.contextPath}/admin/adminUserList.do?pageNo=${pr.endPage + 1}<c:if test="${!empty search.searchType}">&searchType=${search.searchType}&searchWord=${search.searchWord}</c:if><c:if test="${!empty pageList}">&pageList=${pageList}</c:if>" aria-label="next">
			        		<span aria-hidden="true">&raquo;</span>
			      	  </a>
			    </li>
			    </c:if>
		</c:if>
		</ul>
            
            
            <div class="ns_search">
                <select name="searchList" id="searchList">
                
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                    
                </select>
                <input type="text" name="search" id="searchValue" value="${search.searchWord}">
                <button type="button" id="doSearchUser" name="searchVal">검색</button>
            </div> 
<!--         </section>   -->
        

            </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <%-- <%@ include file="../include/footer.jsp"%> --%>
    <!--// 푸터 끝-->
    


  </div>

  <script>
  $(document).ready( function () {
	    $('#table_id').DataTable({
	    	 paging: false,
	    	 searching: false,
	    	 ordering:  false,
	    	 Showing: false,
	    	 bInfo: false
	    });
	   
	} );
  
  // $(document).ready(alert());
	let sList = document.querySelector("#searchList").value;
	let sValue = document.querySelector("#searchValue").value;
	let optVal = document.querySelectorAll("#searchList > option");
	let changeList = document.querySelector("#changeList");
	let doSearchUser = document.querySelector("#doSearchUser");
	let selectedValue = document.querySelector("#changeList").value;
	let changeVal = document.querySelectorAll("#changeList > option");
	
	let allChk = document.querySelector("#allChk");
	let delChk = document.querySelectorAll(".delChk");
	
	let delSelUser = document.querySelector("#delSelUser");
	let delAllUser = document.querySelector("#delAllUser");
	
	delSelUser.addEventListener("click", (e) => {
		let flag = true;
		delChk = document.querySelectorAll(".delChk");
		let arr = new Array();
		
		for (let i =0; i < delChk.length; i++) {
			if (delChk[i].checked) {
				flag = false;
				arr.push(delChk[i].value);
			}
		}
		if (flag) {
			alert('삭제할 유저를 선택하세요.');
			return false;
		}
		
		
		let result = confirm("정말 선택한 유저를 삭제하시겠습니까?");
		if (result) {
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
							alert("삭제 되었습니다.");
							location.href = '<c:url value="/admin/adminUserList.do"/>' ;
						} else {
							alert("시스템 오류입니다.")
						}
				}
			};	
			console.log(arr);
			xhr.open("POST", "userSelectDel.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("msg=" + arr);
		} else {
			alert("취소되었습니다.");
		}
		
	});
	
	
	delAllUser.addEventListener("click", (e) => {
		let flag = true;
		
		let result = confirm("정말 전체 유저를 삭제하시겠습니까?");
		if (result) {
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = (e) => {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
							alert("전체 삭제 되었습니다.");
							location.href = '<c:url value="/admin/adminUserList.do"/>' ;
						} else {
							alert("시스템 오류입니다.")
						}
				}
			};	
			xhr.open("POST", "userAllDel.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send();
		} else {
			alert("취소되었습니다.");
		}
		
	});
	
	
	
	allChk.addEventListener("click", (e) => {
		for (let i =0; i < delChk.length; i++) {
			delChk[i].checked = allChk.checked;
		}
	});
	
	
	for (let i = 0; i < optVal.length; i++) {
		if (optVal[i].value == '${search.searchType}') {
			optVal[i].selected = true;
			sList = optVal[i].value;
		}
	}
	for (let i = 0; i < changeVal.length; i++) {
		if (changeVal[i].value == '${pageList}') {
			changeVal[i].selected = true;
			selectedValue = changeVal[i].value;
		}
	}
	
	
	
	doSearchUser.addEventListener("click", function (e) {
		
		sList = document.querySelector("#searchList").value;
		sValue = document.querySelector("#searchValue").value;
		location.href='${pageContext.request.contextPath}/admin/adminUserList.do?searchType=' + sList + '&searchWord=' + sValue + '&pageList=' + selectedValue;
         
    });    


	
	changeList.addEventListener("change", function (e) {
		
	    selectedValue = changeList.options[changeList.selectedIndex].value;

		location.href='${pageContext.request.contextPath}/admin/adminUserList.do?searchType=' + sList + '&searchWord=' + sValue + "&pageList=" + selectedValue;
         
    });    

	
  </script>
</body>
</html>



