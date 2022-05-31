<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<style>

</style>

</head>
<body>

	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="main.jsp">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>	  
		<button type="button" class="btn btn-secondary justify-content-start" onclick="javascript:window.location='login.jsp'">
			로그인
		</button>	  
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
	
	<div class="container ">
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	      Main
	      <button type="button" class="btn btn-secondary" onclick="javascript:window.location='notice_write.jsp'" >글 작성</button>
	    </div>
	  </div>
	</div>	


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>