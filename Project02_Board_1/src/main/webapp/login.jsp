<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    #login_fail{
        color: red;
    }
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
function form_check() {
	if ($('#id').val().length == 0) {
		alert("아이디를 입력해주세요.");
		$('#id').focus();
		return;
	}
	if ($('#pw').val().length == 0) {
		alert("비밀번호를 입력해주세요.");
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
				$('#login_fail').text("");
				// alert(result.desc);
				window.location.replace("main.board");
			} else {
				// alert(result.desc);
				$('#login_fail').text("비밀번호가 일치하지 않습니다.");
			}
		}
	});
}

function apiLogin()
{
	// alert("API로 로그인합니다.");
	window.location.replace("login.member?id=guest&pw=0");
}

function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	form_check();
    }
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
	    <a class="nav-link text-muted" "><h4>채팅방</h4></a>
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
            <input type="password" class="form-control" id="pw" name="pw" onkeyup="enterkey()" placeholder="비밀번호">
	        <span id="login_fail"></span>
          </div>
        </div><br><br>
        
        <div class="row justify-content-center">				
			<button type="button" class="btn btn-secondary btn-lg col-md-4 btn-block" onclick="form_check()">로그인</button>
        </div>
        
        <div class="row justify-content-center">				
			<br>
        </div>
        
        <div class="row justify-content-center">				
			<div id="naverIdLogin">
				<a id="naverIdLogin_loginButton" href="#" role="button"><img src="https://static.nid.naver.com/oauth/big_g.PNG" width=300></a>
			</div>
        </div>
        
        <div class="row justify-content-center">				
			<br> 
        </div>
        
        <div class="row justify-content-center">				
		    <a id="custom-login-btn" href="javascript:loginWithKakao()">
		    	<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
		    </a>
        </div>
        
       </div>
    </form>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<script src="naveridlogin_js_sdk_2.0.2.js"></script>
	
	<!-- 네이버 로그인 -->
	<script>
		
		var naverLogin = new naver.LoginWithNaverId(
			{

				clientId: "IVHxigYhnmEtUz62h74c",
				callbackUrl: "http://localhost:8081/Project02_Board_1/login.jsp",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 60}
			}
		);
		
		naverLogin.init();

		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());


		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) 
				{
					setLoginStatus();
				}
			});
		});

		function setLoginStatus() 
		{
			console.log(naverLogin.user);
			
			var uid = naverLogin.user.getId();
			var profileImage = naverLogin.user.getProfileImage();
			var uName = naverLogin.user.getName();
			var nickName = naverLogin.user.getNickName();
			var eMail = naverLogin.user.getEmail();
			
			
			naverLogin.logout();
			
			if(uid != null)
			{
				// alert("네이버 아이디로 로그인 되었습니다.");
				apiLogin();
			}			
				
		}
	</script>
	
	<!-- 카카오 로그인 -->
	<script type='text/javascript'>
    Kakao.init('4b01f291ea9a2eb0e29ade14fc807184');
    function loginWithKakao() {
      
      Kakao.Auth.login({
        success: function(authObj) 
        {
        	//alert("카카오로 로그인 합니다1");
        	signIn(authObj);
        },
        fail: function(err) 
        {
        	alert(JSON.stringify(err));
        }
      });
    };

    function signIn(authObj) {
        //console.log(authObj);
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                //console.log(res);
                console.log(res.id);
               	
                //alert("카카오로 로그인 합니다2");
               	apiLogin();
             }
         })
	} 
    
    function signOut() {
	    Kakao.Auth.logout(function () {
	    	
	    });
	}
    
	</script>
</body>
</html>