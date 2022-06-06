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
<style>
	*{
		font-family: 'Hahmlet';
	}

	body{
	    background-color: rgba(125, 156, 255, 0.400);
	}
	.container{
		
	}
	th{
		font-size: 30px;
	}
	.number{
		font-size: 20px;
		font-weight: bold;
	}
	.title{
		font-weight: bold;
		background-color: rgba(125, 156, 255, 0.600);
	}	
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>    		     
</script>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="mMode.jsp">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/master.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		관리자 모드입니다. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>&nbsp;
	  	  		<button type="button" id="manage" class="btn btn-success btn-sm" onclick="javascript:window.location='main.board'">사용자모드</button>&nbsp;
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="mMode.manage"><h4>HOME</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="boardManage.manage"><h4>게시글관리</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="memberManage.manage"><h4>회원관리</h4></a>
	  </li>
	</ul>
	<hr>
	
	<div class="container">
	
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <thead>
			    <tr class="">
			      <th class="text-center">게시글</th>
			    </tr>
			  </thead>
			</table>	    	
	    </div>
	  </div>
	  
	  
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			    <tr class="title">
			      <td class="text-center">분류</td>
			      <td class="text-center">게시글 수</td>
			    </tr>
			    <tr class="table-light">
			      <td class="text-center">공지사항</td>
			      <td class="text-center number">${count_Board}</td>
			    </tr>
			    <tr class="table-light">
			      <td class="text-center">자유게시판</td>
			      <td class="text-center number">${count_FreeBoard}</td>
			    </tr>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-right">
	    <div class="col-12">
            <button type="button" class="btn btn-secondary" onclick="javascript:window.location='boardManage.manage'">게시글 관리</button>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-right">
	    <div class="col-10">
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <thead>
			    <tr class="">
			      <th class="text-center">회원</th>
			    </tr>
			  </thead>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			    <tr class="title">
			      <td class="text-center">등급</td>
			      <td class="text-center">회원 수</td>
			    </tr>
			    <tr class="table-light">
			      <td class="text-center"><img src="./img/bronze.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;Bronze 회원</td>
			      <td class="text-center number">${bronze_member}</td>
			    </tr>
			    <tr class="table-light">
			      <td class="text-center"><img src="./img/silver.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;Silver 회원</td>
			      <td class="text-center number">${silver_member}</td>
			    </tr>
			    <tr class="table-light">
			      <td class="text-center"><img src="./img/gold.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;Gold 회원</td>
			      <td class="text-center number">${gold_member}</td>
			    </tr>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-right">
	    <div class="col-12">
            <button type="button" class="btn btn-secondary" onclick="javascript:window.location='memberManage.manage'">회원관리</button>
	    </div>
	  </div>
	  		
	</div>
	
		
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>