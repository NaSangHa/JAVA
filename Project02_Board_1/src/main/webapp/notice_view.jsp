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
	  	  		<%= session.getAttribute("member_dto_id") %> 님 반갑습니다. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='myInfo.member?id=<%= session.getAttribute("member_dto_id") %>'">내정보</button>&nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="main.jsp"><h4>홈</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="notice.board"><h4>공지사항</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="freeBoard.board?page=1"><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#"><h4>Menu3</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#"><h4>Menu4</h4></a>
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
			        <td class="col-6">${notice_view.bFile}</td>
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
		  <div class="col-3">	
		  	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='notice_modify_view.board?bId=${notice_view.bId}'">수정</button>	
		  	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='notice_delete.board?bId=${notice_view.bId}'">삭제</button>	
		  </div>
	  </div>
	</div>
	    
  
    	
 
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>