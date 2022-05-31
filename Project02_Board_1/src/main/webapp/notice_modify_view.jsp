<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- BootStrap Css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<title>로그인</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function submit_modify() {
	
	var queryString = $('#notice_modify').serialize();
	$.ajax({
		url : '/Project02_Board_1/notice_modify.board',
		type : 'POST',
		data : queryString,
		dataType : 'text',
		success : function(json) {

			var result = JSON.parse(json);

			if (result.code == "success") {
				alert(result.desc);
				window.location.replace("notice_view.board?bId="+${notice_view.bId});
			} else {
				alert(result.desc);
			}
		}
	});
}
</script>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="main.jsp">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/profile.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		<%= session.getAttribute("member_dto_name") %> 님 반갑습니다!
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#">자유게시판</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#">Menu3</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#">Menu4</a>
	  </li>
	</ul>
	<hr>
	
	<div class="container">
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	    	<form id="notice_modify" name="notice_modify">
	    	    <input type="hidden" name="bId" value="${notice_view.bId}">
	    	    <input type="hidden" name="bName" value="${notice_view.bName}">
	    	    <%-- <input type="hidden" name="bTitle" value="${notice_view.bTitle}"> --%>
	    	    <%-- <input type="hidden" name="bContent" value="${notice_view.bContent}"> --%>
	    	    <input type="hidden" name="bDate" value="${notice_view.bDate}">
	    	    <input type="hidden" name="bHit" value="${notice_view.bHit}">
	    	    <input type="hidden" name="bGroup" value="${notice_view.bGroup}">
	    	    <input type="hidden" name="bStep" value="${notice_view.bStep}">
	    	    <%-- <input type="hidden" name="bFile" value="${notice_view.bFile}"> --%>
	    	    <input type="hidden" name="bLike" value="${notice_view.bLike}">
	    	    <input type="hidden" name="bHate" value="${notice_view.bHate}">

				<table class="table col-12 justify-content-center">
				  <thead class="">
				    <tr>
				      <th scope="col" colspan=2><button type="button" class="btn btn-secondary btn-lg btn-block" disable="disable">공지사항</button></th>
				    </tr>
				  </thead>			
				  <tbody>
				    <tr>
				        <th class="col-2" scope="row">번호</td>
				        <td class="col-6">${notice_view.bId}</td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">작성자</td>
				        <td class="col-6">${notice_view.bName}</td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">제목</td>
				        <th class="col-6">
				        	<input type="text" class="form-control" id="bTitle" name="bTitle" value="${notice_view.bTitle}" size="30"/>
				        </td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">첨부파일</td>
				        <th class="col-6">
					        <input type="file" class="form-control" id="bFile" name="bFile" value="${notice_view.bFile}" size="30"/>
				        </td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">내용</td>
				        <th class="col-6">
					        <textarea name="bContent" id="bContent" rows="10" cols="100">${notice_view.bContent}</textarea>
				        </td>
				    </tr>
				  </tbody>
				</table> 
	    	</form>
	    </div>
	  </div>
	  <hr>
	  <div class="row justify-content-end text-center">
		  <div class="col-2">
		  	<button type="button" class="btn btn-dark" onclick="submit_modify()">수정완료</button>	
		  </div>
	  </div>
	</div>
	    
  
    	
 
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>