<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
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

			if("<%= session.getAttribute("member_dto_id") %>" != 'admin')
			{
				$('#manage').attr('style', "display:none;");	
				$('#modify').attr('style', "display:none;");	
			}
			
			if("<%= session.getAttribute("member_dto_id") %>" == 'guest')
			{
				$('#myInfo').attr('style', "display:none;");	
				// $('#notice_write').attr('style', "display:none;");	
			} 
		}); 


function comments_check() {
	
    if ($('#cContent').val().length == 0) {
    	
      alert("내용을 입력해주세요.");
      $('#cContent').focus();
      return;
      
    }
    
    submit_comment();
}    

function submit_comment() {
	
	var queryString = $('#comments_form').serialize();
    $.ajax({
        url : '/Project02_Board_1/reg_comment.comments',
        type : 'POST',
        data : queryString,
        dataType : 'text',
        success : function(json) {
            var result = JSON.parse(json);

            if (result.code == "success") {
            	// alert(result.desc);
            	window.location.reload();
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
			<table class="table col-12 justify-content-center">
			  <thead class="">
			    <tr>
			      <th scope="col" colspan=2><button type="button" class="btn btn-secondary btn-lg btn-block" disable="disable">게시글</button></th>
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
			        <td class="col-6">${notice_view.bTitle}</td>
			    </tr>
			    <tr>
			        <th class="col-2" scope="row">첨부파일</td>
			        <td class="col-6"> 
			        	<a href="/Project02_Board_1/Download?filename=${notice_view.bFile}">
			        		${notice_view.bFile}
			        	</a>
			        </td>
			    </tr>
			    <tr>
			        <th class="col-2" scope="row">내용</td>
			        <td class="col-6">${notice_view.bContent}</td>
			    </tr>
			  </tbody>
			</table> 
	    </div>
	  </div>
	  <hr>
	  <div class="row justify-content-between text-center">
		  <div class="col-2">	
			<button type="button" class="btn btn-secondary justify-content-start" onclick="javascript:window.location='notice.board?page=<%= session.getAttribute("cpage") %>'">목록</button>	
		  </div>
		  <div class="col-3" id="modify">	
		  	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='notice_modify_view.board?bId=${notice_view.bId}&bName=0&loignName=0'">수정</button>	
		  	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='notice_delete.board?bId=${notice_view.bId}'">삭제</button>	
		  </div>
	  </div>
	</div>
	
    <div class="container"><br>
      <form id="comments_form" name="comments_form">
      	<input type="hidden" id="bId" name="bId" value="${notice_view.bId}" />
      	<input type="hidden" id="id" name="id" value="<%= session.getAttribute("member_dto_id") %>" />
        <div class="form-group">
          <label for="cContent">댓글</label>
          <textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
        </div>
        <div class="justify-content-end text-right">
          <button type="button" class="btn btn-outline-secondary" onclick="comments_check()">등록</button>
        </div>
        <br>
      </form>
    </div>
    
    <div class="container">
    <c:forEach items="${comments}" var="comments">
      <table class="table">
        <thead>
          <tr class="table-active">
            <th scope="col">작성자 : ${comments.id}</th>
            <th scope="col">작성일 : ${fn:substring(comments.cDate, 0, 10)}</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td scope="row" colspan="2">${comments.cContent}</td>
          </tr>
        </tbody>
      </table>
      <br>
    </c:forEach>    
    </div>  
  
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>