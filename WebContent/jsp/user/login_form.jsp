<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비트커뮤 | 로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
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
                    <form action="" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required="required">		
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
                    <a href="#">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>