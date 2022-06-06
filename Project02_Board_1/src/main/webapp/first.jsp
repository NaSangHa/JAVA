<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	div .welcome{
		height: 250px; 
	}
    div .login {
        height: 600px;    
    }
	.btn{
		width: 500px; height: 200px;
		font-size: 70px;
		border-radius: 30px;
	}
	.first{
		font-size: 50px
	}
	
</style>
<script src="http://code.jquery.com/jquery.js"></script>

</head>
<body>

	<div class="container">
		<div class="row align-items-end text-center welcome">
			<div class="col">
				<a class="first" >
				  <img src="./img/board.png" width="100" height="100" class="d-inline-block align-top justify-content-start" alt="">
				  NOTICE BOARD
				</a>
			</div>
		</div>
		<br>
		<div class="row align-items-start text-center login">
			<div class="col">
				<button type="button" class="btn btn-primary" onclick="javascript:window.location='login.jsp'">시 작</button>
			</div>
		  </div>
	</div>
		    
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>