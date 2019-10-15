<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
 
    <%@ include file="/jsp/include/head.jsp"%>
</head>
<body>
   <div class="wrapepr">
     <!-- 헤더 -->
   
    <!-- // 헤더 끝-->
     <%@ include file="/jsp/include/header.jsp"%>
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content ns_content">

            <h1 class="ns_Title">자유게시판</h1>


            <!--          
            <div class="ns_listlength">
              
                <select name="list">
                    <option value="10" selected>10개</option>
                    <option value="15">15개</option>
                    <option value="20">20개</option>
                    
                </select>씩 보기
            </div>
          -->

            
  
           
           
           <div class="ns_table_write">
		   		<form method='post' action="/bitcomu/talk/write.do" > <!-- enctype = "multipart/form-data"> -->
				 	<div>
			  		   제목 : <input type='text' name='title' size='70' />	 	
				 	</div>
				 	<div>
					     글쓴이 :${user.userId} <input type='hidden' value="${user.userId}" name='writer' size='30' />
				 	</div> 
				 	<div>
				            내용 : <textarea name='content' rows='7' cols='70' ></textarea>
				 	</div>
				 	
				 	
					<!-- <div>
						<form action="test05.do" method="post" enctype="multipart/form-data">
							
							<div><input type="file" name="attach" multiple /></div>
							
						</form>
					</div> -->
			  			  <input type='submit' value="등록"></input>
					<div>
					</div>
		              <a class="ns_write_do" > 
		              </a> 
				</form>
            </div>
          
           
           
                
            
          

              <a class="ns_to_list" href="<c:url value="/talk/talkList.do" />"> 
                <div> 
                  목록으로
                </div>
              </a>




              
                
  
  
            
            
            
            
          
        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->

    <!-- 푸터 -->
    <div id="ns_bottom"></div>
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

