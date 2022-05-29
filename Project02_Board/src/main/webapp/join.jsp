<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
* {
	text-align: center;
	font-size: 30px;
	font-family: 'Noto Sans KR';
	margin: 0px auto;
	padding: 0px auto;
}

#inner_form {
	text-align: center;
}

p {
	font-size: 20px;
	font-weight: bold;
}

img {
	height: 100px;
}

form {
	text-align: left;
	margin: 80px;
}

#button {
	background-color: rgb(130, 208, 130);
	border-radius: 5px;
	border: 0.5px solid black;
	width: 500px;
}

#button_align {
	text-align: center;
}

#main_box {
	text-align: left;
	width: 800px;
	padding: 50px;
}
p{
	text-align: left;
}

#pw_error, #id_error {
	font-size: 20px;
	color: red;
}

#id_correct {
	font-size: 20px;
	color: green;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function form_check() {
		if ($('#id').val().length == 0) {
			alert("아이디는 필수사항입니다.");
			$('#id').focus();
			return;
		}

		if ($('#id').val().length < 4) {
			alert("아이디는 4글자 이상이어야 합니다.");
			$('#id').focus();
			return;
		}

		if ($('#pw').val().length == 0) {
			alert("비밀번호는 필수사항입니다.");
			$('#pw').focus();
			return;
		}
		if ($('#pw').val() != $('#pw_check').val()) {
			//alert("비밀번호가 일치하지 않습니다.");
			$('#pw_error').text("비밀번호가 일치하지 않습니다.");
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

		submit_ajax();
	}

	function submit_ajax() {
		var queryString = $('#reg_frm').serialize();
		$.ajax({
			/* url : '/Jsp21-HW-DAO-Ajax/check/joinOk.jsp', */
			url : '/Jsp21-HW-DAO-Ajax/JoinProcess',
			type : 'POST',
			data : queryString,
			dataType : 'text',
			success : function(json) {

				var result = JSON.parse(json);

				if (result.code == "success") {
					alert(result.desc);
					window.location.replace("login.jsp");
				} else {
					alert(result.desc);
				}
			}
		});
	}

	function id_check() {
		// console.log("ID 시리얼라이즈: " + $('#id').serialize())
		var queryString = $('#reg_frm').serialize();

		$.ajax({
			url : '/Project02_Board/IdCheckProcess',
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
					//alert(result.desc);
					$('#id_correct').text("");
					$('#id_error').text("이미 사용중인 아이디 입니다.");
					$('#id').focus();
				}
			}
		});
	}
</script>

</head>
<body>
	<div id="main_box">
		<form id="reg_frm">
			<div id="inner_form">
				<img src="./logo.jpg"><a href="http://www.naver.com"></a>
			</div>
			<p>아이디</p>
			<input type="text" id="id" name="id" size="20" /> &nbsp;&nbsp; <input
				type="button" value="중복확인" onclick="id_check()" /> <br />
			<p id="id_error"></p>
			<p id="id_correct"></p>
			<p>비밀번호</p>
			<input type="text" id="pw" name="pw" size="20" /><br />
			<p>비밀번호 확인</p>
			<input type="text" id="pw_check" name="pw_check" size="20" />
			<p id="pw_error"></p>
			<p>이름</p>
			<input type="text" id="name" name="name" size="20" /><br />
			<p>메일</p>
			<input type="text" id="eMail" name="eMail" size="20" />&nbsp;@&nbsp;
			<select name="eMailSub">
				<option id="eMailSub" value="@naver.com" selected>naver.com</option>
				<option id="eMailSub" value="@daum.net">daum.net</option>
				<option id="eMailSub" value="@goolge.com">google.com</option>
			</select>
			<p>주소</p>
			<input type="text" id="address" name="address" size="30" />
		</form>
	</div>
	<p id="button_align">
		<input type="button" value="회원가입" id="button" onclick="form_check()" />
		<br>
		<br> <input type="button" value="로그인" id="button"
			onclick="javascript:window.location='login.jsp'" />
	</p>

</body>
</html>