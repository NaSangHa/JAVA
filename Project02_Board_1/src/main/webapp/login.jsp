<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
function form_check() {
	if ($('#id').val().length == 0) {
		alert("아이디는 필수사항입니다.");
		$('#id').focus();
		return;
	}
	if ($('#pw').val().length == 0) {
		alert("비밀번호는 필수사항입니다.");
		$('#pw').focus();
		return;
	}
	
	submit_join();
}

function submit_join() {
	
	var queryString = $('#login_form').serialize();
	$.ajax({
		url : '/Project02_Board_1/login.member',
		type : 'POST',
		data : queryString,
		dataType : 'text',
		success : function(json) {

			var result = JSON.parse(json);

			if (result.code == "success") {
				//alert(result.desc);
				window.location.replace("main.jsp");
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
		<a class="navbar-brand">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">	  	  
			<button type="button" class="btn btn-outline-dark justify-content-end" onclick="javascript:window.location='join.jsp'">
				회원가입
			</button>	  	  
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" ><h4>홈</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" ><h4>공지사항</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" ><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" ><h4>Menu3</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" ><h4>Menu4</h4></a>
	  </li>
	</ul>
	<hr>
	<div class="container">
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	      로그인
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	      
	    </div>
	  </div>
	</div>		
    
    <form id="login_form" name="login_form">
      <div class="container">
      
        <div class="row justify-content-center">
          <div class="form-group col-md-6">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
          </div>
        </div>
        
        <div class="row justify-content-center">
          <div class="form-group col-md-6">
            <label for="pw">비밀번호</label>
            <input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호">
          </div>
        </div><br><br>
        
        <div class="row justify-content-center">				
		<button type="button" class="btn btn-secondary btn-lg col-md-5 btn-block" onclick="form_check()">로그인</button>
        </div>
       </div>
    </form>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>