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
<body>
    <div class="wrapper login_form_wrap">
        <div class="modal-login">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="avatar">
                        <img src="${pageContext.request.contextPath}/resources/images/annyms.png" alt="Avatar">
                    </div>				
                    <h4 class="modal-title">Member Login</h4>	
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="location.href='index.html'">×</button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/user/userLogin.do" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="id" placeholder="Username" required="required">		
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required="required">	
                        </div>        
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath}/user/userIdFindForm.do">아이디 찾기</a>
                    <a href="${pageContext.request.contextPath}/user/userPWFindForm.do">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>