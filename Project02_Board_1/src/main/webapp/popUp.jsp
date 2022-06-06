<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Hahmlet:wght@300&family=Jua&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function () {
	
	captcha();
})

function captcha() {
	// alert("캡차가 실행");
	
	$.ajax({
        url : '/Project02_Board_1/getCaptchaKey.manage',
        type : 'POST',
        data : 'a',
        dataType : 'text',
        success : function(json) {
            var result = JSON.parse(json);

            // alert(result.key);
            $("#captcha_img").attr("src","https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+result.key);
            $('#captcha_key').val(result.key);
        }
    });
}
function confirm_captcha() {
	
	var queryString = $('#captcha_form').serialize();
	$.ajax({
        url : '/Project02_Board_1/checkCaptcha.manage',
        type : 'POST',
        data : queryString,
        dataType : 'text',
        success : function(json) {
            
            var com = json.substr(10, 1);
            
            //alert(com);
            
            if (com == "t")
           	{
           		alert("확인되었습니다.")
           		window.location.replace("deleteMember.manage?id=<%= session.getAttribute("delete_id") %>");
           		window.close();
           	}
            else
           	{
            	alert("입력값이 다릅니다.")
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
	<div class="container">
	
	  <div class="row justify-content-center text-center">
		<br><br>
	  </div>
	  
	  <div class="row justify-content-center text-center">
		<img id="captcha_img" src="" width="500px"/><br>
	  </div>
	  
	  <div class="row justify-content-center text-center">
		<br>
	  </div>
	  
	  <div class="row justify-content-center text-center">
		<form id="captcha_form">
			<input type="hidden" id="captcha_key" name="captcha_key" value=""/>
			<label for="captcha_input">입력</label>
			<input type="text" id="captcha_input" name="captcha_input" class="form-control"/>
		</form>
	  </div>

	  <div class="row justify-content-center text-center">
		<form id="captcha_form">
			<br>
		</form>
	  </div>
	  
	  <div class="row justify-content-center text-center">
		<button type="button" class="btn btn-outline-secondary" name="captcha_text"onclick="confirm_captcha()">확인</button>&nbsp;
		<button type="button" class="btn btn-outline-secondary" onclick="captcha()">그림 새로고침</button>
	  </div>
	  
	</div>	
	
	

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>