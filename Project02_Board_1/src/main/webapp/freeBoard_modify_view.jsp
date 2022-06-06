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
<title></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Hahmlet:wght@300&family=Jua&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function()
{

	if("<%= session.getAttribute("member_dto_name") %>" != '관리자')
	{
		$('#manage').attr('style', "display:none;");	
	}
	
	if("<%= session.getAttribute("member_dto_id") %>" == 'guest')
	{
		$('#myInfo').attr('style', "display:none;");	
		// $('#notice_write').attr('style', "display:none;");	
	}
});  
 
function submit_modify() {
	
	if ($('#fbTitle').val().length == 0) {
		alert("제목은 필수사항입니다.");
		$('#fbTitle').focus();
		return;
	}
	
	// submit_write();
	$("#freeBoard_modify").submit();
}

function submit_ajax() {
	var queryString = $('#freeBoard_modify').serialize();
	$.ajax({
		url : '/Project02_Board_1/freeBoard_modify.board',
		type : 'POST',
		data : queryString,
		dataType : 'text',
		success : function(json) {

			var result = JSON.parse(json);

			if (result.code == "success") {
				alert(result.desc);
				window.location.replace("freeBoard_view.board?fbId="+${freeBoard_view.fbId});
			} else {
				alert(result.desc);
			}
		}
	});	
}
</script>
<style>
	*{
		font-family: 'Hahmlet';
	}
</style>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="main.board">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/profile.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		<%= session.getAttribute("member_dto_id") %> 님 반갑습니다. &nbsp;
	  	  		<button id="myInfo" type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='myInfo.member?id=<%= session.getAttribute("member_dto_id") %>'">내정보</button>&nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>&nbsp;
	  	  		<button type="button" id="manage" class="btn btn-success btn-sm" onclick="javascript:window.location='mMode.manage'">관리자모드</button>&nbsp;
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="main.board"><h4>홈</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="notice.board"><h4>공지사항</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="freeBoard.board?page=1"><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="chatRoom.chat"><h4>채팅방</h4></a>
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
	    	<form id="freeBoard_modify" name="freeBoard_modify" action="freeBoard_modify_command.jsp" method="post" enctype="multipart/form-data">
	    	    <input type="hidden" name="fbId" value="${freeBoard_view.fbId}">
	    	    <input type="hidden" name="fbName" value="${freeBoard_view.fbName}">
	    	    <%-- <input type="hidden" name="fbTitle" value="${freeBoard_view.fbTitle}"> --%>
	    	    <%-- <input type="hidden" name="fbContent" value="${freeBoard_view.fbContent}"> --%>
	    	    <input type="hidden" name="fbDate" value="${freeBoard_view.fbDate}">
	    	    <input type="hidden" name="fbHit" value="${freeBoard_view.fbHit}">
	    	    <input type="hidden" name="fbGroup" value="${freeBoard_view.fbGroup}">
	    	    <input type="hidden" name="fbStep" value="${freeBoard_view.fbStep}">
	    	    <%-- <input type="hidden" name="fbFile" value="${freeBoard_view.fbFile}"> --%>
	    	    <input type="hidden" name="fbLike" value="${freeBoard_view.fbLike}">
	    	    <input type="hidden" name="fbHate" value="${freeBoard_view.fbHate}">

				<table class="table col-12 justify-content-center">
				  <thead class="">
				    <tr>
				      <th scope="col" colspan=2><button type="button" class="btn btn-secondary btn-lg btn-block" disable="disable">공지사항</button></th>
				    </tr>
				  </thead>			
				  <tbody>
				    <tr>
				        <th class="col-2" scope="row">번호</td>
				        <td class="col-6">${freeBoard_view.fbId}</td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">작성자</td>
				        <td class="col-6">${freeBoard_view.fbName}</td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">제목</td>
				        <th class="col-6">
				        	<input type="text" class="form-control" id="fbTitle" name="fbTitle" value="${freeBoard_view.fbTitle}" size="30"/>
				        </td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">첨부파일</td>
				        <th class="col-6">
					        <input type="file" class="form-control" id="fbFile" name="fbFile" value="${freeBoard_view.fbFile}" size="30"/>
				        </td>
				    </tr>
				    <tr>
				        <th class="col-2" scope="row">내용</td>
				        <th class="col-6">
					        <textarea name="fbContent" id="fbContent" rows="10" cols="100">${freeBoard_view.fbContent}</textarea>
				        </td>
				    </tr>
				  </tbody>
				</table> 
	    	</form>
	    </div>
	  </div>
	  <hr>
	  <div class="row justify-content-between text-center">
		  <div class="col-2">
		  	<button type="button" class="btn btn-dark" onclick="javascript:window.location='freeBoard_view.board?fbId=${freeBoard_view.fbId}&fbName=0&loginName=0'">취소</button>	
		  </div>
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