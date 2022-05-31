<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- BootStrap Css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<title>회원가입</title>
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
	if ($('#pw').val() != $('#pw_check').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw').focus();
		return;
	}
	if ($('#name').val().length == 0) {
		alert("이름은 필수사항입니다.");
		$('#name').focus();
		return;
	}
	if ($('#eMail').val().length == 0) {
		alert("메일은 필수사항입니다.");
		$('#eMail').focus();
		return;		
	}	
		submit_join();
}

function submit_join() {
	
	var queryString = $('#join_form').serialize();
	$.ajax({
		url : '/Project02_Board_1/join.member',
		type : 'POST',
		data : queryString,
		dataType : 'text',
		success : function(json) {

			var result = JSON.parse(json);

			if (result.code == "success") {
				alert(result.desc);
				window.location.replace("login.member");
			} else {
				alert(result.desc);
			}
		}
	});
}

$('#id').focusout(
        function id_check() {
        	alert("아이디 체크에 들어옴")
            var queryString = $('#join_form').serialize();
            $.ajax({
                url : '/Project02_Board_1/idCheck.member',
                type : 'POST',
                data : queryString,
                dataType : 'text',
                success : function(json) {
                    var result = JSON.parse(json);
        
                    if (result.code == "success") {
                        $('#id_error').text("");
                        $('#id_correct').text("사용가능한 아이디 입니다.");
                        $('#pw').focus();
                    } else {
                        $('#id_correct').text("");
                        $('#id_error').text("이미 사용중인 아이디 입니다.");
                        $('#id').focus();
                    }
                }
            });
        })
</script>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">	 	    	  
			<button type="button" class="btn btn-outline-dark justify-content-end" onclick="javascript:window.location='login.jsp'">
				로그인
			</button>	  	    	  
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
	<div class="container ">
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	      회원가입
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
	    </div>
	  </div>
	</div>		


    <form id="join_form" name="join_form">
      <div class="container">
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="id">아이디</label> 
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="pw">비밀번호</label>
            <input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호">
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="pw_check">비밀번호 확인</label>
            <input type="text" class="form-control" id="pw_check" name="pw_check" placeholder="비밀번호 확인">
            <div id="pw_correct"></div> <div id="pw_error"></div>            
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="이름">
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="phone1">휴대전화</label>
            <div class="form-row">
              <div class="form-group col-3">
                <select name="phone1" class="form-control">
                  <option id="phone1" value="010" selected>010</option>
                  <option id="phone1" value="011">011</option>
                  <option id="phone1" value="016">019</option>
                </select>
              </div>
              <div>-</div>
              <div class="form-group col-4">
                <input type="text" class="form-control" id="phone2" name="phone2">
              </div>
              <div>-</div>
              <div class="form-group col-4">
                <input type="text" class="form-control" id="phone3" name="phone3">
              </div>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="eMail">이메일</label><br>
            <div class="form-row">
              <div class="form-group col-5">
                <input type="text" class="form-control" id="eMail" name="eMail">
              </div>
              <div class="form-group col-1"><h4>@</h4></div>
              <div class="form-group col-5">
                <select name="eMail_sub" class="form-control">
                  <option id="eMail_sub" value="@naver.com" selected>naver.com</option>
                  <option id="eMail_sub" value="@google.com">google.com</option>
                  <option id="eMail_sub" value="@daum.net">daum.net</option>
                </select>
              </div>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="gender">성별</label><br>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="gender" value="man">
                <label class="form-check-label" for="gender">남</label>
              </div> &nbsp;&nbsp;&nbsp;
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="gender" value="woman">
                <label class="form-check-label" for="gender">여</label>
              </div>
          </div>
        </div><br><br>

        <div class="row justify-content-center">
          <button type="button" class="btn btn-secondary btn-lg col-md-5 btn-block" onclick="form_check()">가입하기</button>
        </div>
      </div>
    </form>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>