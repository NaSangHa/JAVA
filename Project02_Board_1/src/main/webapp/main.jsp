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
		$('#notice_write').attr('style', "display:none;");	
	}
});            		     
</script>
<style>
	*{
		font-family: 'Hahmlet';
	}
	.title{
		font-family: 'Hahmlet';
		font-size: 35px;
	}
	.newBoard{
		color: rgb(0, 0, 255);
	}
	.hotBoard{
		color: rgb(255, 0, 0);
	}
	.top{
		font-weight: bold;
	}
</style>
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
	
	<div class="container ">
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
            <br><br>
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	    </div>
	  </div>
	</div>	
	<div class="container">
        <table class="table table-hover">
            <thead>
              <tr class="table text-left title newBoard">
                <th scope="col" colspan="5">신규 공지사항</th>
              </tr>
            </thead>
            <tbody>
            	<tr class="table-secondary top">
			      <th scope="row"></th>
			      <td class="text-center">작성자</td>
			      <td class="text-center">제목</td>
			      <td class="text-center">작성일</td>
			      <td class="text-center">조회수</td>
            </tbody>
			  <c:forEach items="${newNotice_dtos}" var="dto">
				  <tbody>
				    <tr>
				      <th scope="row" class="text-center"><span class="badge badge-primary">NEW</span></th>
				      <td class="text-center">${dto.bName}</td>
				      <td class="text-center"><a href="notice_view.board?bId=${dto.bId}&bName=${dto.bName}&loignName=<%= session.getAttribute("member_dto_name") %>" >${dto.bTitle}</a></td>
				      <td class="text-center">${fn:substring(dto.bDate, 0, 10)}</td>
				      <td class="text-center">${dto.bHit}</td>
				    </tr>
				  </tbody>
        	  </c:forEach>            
          </table>
	</div>
	
	

	<div class="container">
        <br><br>
	</div>	
	<div class="container">
        <table class="table table-hover">
            <thead>
              <tr class="table text-left title hotBoard">
                <th scope="col" colspan="5">인기 게시글</th>
              </tr>
            </thead>
            <tbody>
            	<tr class="table-secondary top">
			      <th scope="row"></th>
			      <td class="text-center">작성자</td>
			      <td class="text-center">제목</td>
			      <td class="text-center">작성일</td>
			      <td class="text-center">조회수</td>
            </tbody>         
			  <c:forEach items="${hotFreeBoard_dtos}" var="fdto">
				  <tbody>
				    <tr>
				      <th scope="row" class="text-center"><span class="badge badge-danger">HOT</span></th>
				      <td class="text-center">${fdto.fbName}</td>
				      <td class="text-center"><a href="freeBoard_view.board?fbId=${fdto.fbId}&fbName=${fdto.fbName}&loginName=<%= session.getAttribute("member_dto_name") %>" >${fdto.fbTitle}</a></td>
				      <td class="text-center">${fn:substring(fdto.fbDate, 0, 10)}</td>
				      <td class="text-center">${fdto.fbHit}</td>
				    </tr>
				  </tbody>
        	  </c:forEach>            
          </table>
	</div>	
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>