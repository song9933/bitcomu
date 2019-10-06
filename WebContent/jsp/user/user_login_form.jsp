<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="로그인" />
</c:import> 
</head>
<body style="overflow-y:hidden">
    <div class="wrapper login_form_wrap">
        <div class="modal-login">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="avatar">
                        <img src="${pageContext.request.contextPath}/resources/images/annyms.png" alt="Avatar">
                    </div>				
                    <h4 class="modal-title">Member Login</h4>	
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cls();">×</button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/user/userLogin.do" method="post" id="loginChk">
                        <div class="form-group">
                            <input type="text" class="form-control" name="id" placeholder="Username" required="required">		
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required="required">	
                        </div>        
                        <div class="form-group">
                            <button type="button" class="btn btn-primary btn-lg btn-block login-btn" id="sendLogin">Login</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="javascript:idFind()">아이디 찾기</a>
                    <a href="javascript:pwFind()">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    
	    let sendLogin = document.querySelector("#sendLogin");

				
	    sendLogin.addEventListener("click", function () {
	    		document.querySelector("#loginChk").submit();
	    		// 구현 해야 할 일 : ajax를 통하여 아이디, 비밀번호가 일치하는지에 따라서 alert 메세지가 바뀌어야 함.
	    		let msg = "로그인 되었습니다."
    			alert(msg);
		    	opener.parent.location.reload();
		    	self.close();

	    });
	    
	    function idFind() {

		    opener.location.href="${pageContext.request.contextPath}/user/userIdFindForm.do";
		    self.close();	

	    };
	    function pwFind() {

		    opener.location.href="${pageContext.request.contextPath}/user/userPWFindForm.do";
		    self.close();	

	    };
	    
	    

	    function cls() {
// 	    	setTimeout(cls(),2000);
// 	        opener.window.location.reload();
	    	self.close();
	    }
	</script>
    
</body>
</html>