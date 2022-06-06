<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK Test with BootStrap</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	 crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	 crossorigin="anonymous">

	<style type="text/css">
	.header,body{padding-bottom:20px}.header,.jumbotron{border-bottom:1px solid #e5e5e5}body{padding-top:20px}.footer,.header,.marketing{padding-right:15px;padding-left:15px}.header h3{margin-top:0;margin-bottom:0;line-height:40px}.footer{padding-top:19px;color:#777;border-top:1px solid #e5e5e5}@media (min-width:768px){.container{max-width:730px}}.container-narrow>hr{margin:30px 0}.jumbotron{text-align:center}.jumbotron .btn{padding:14px 24px;font-size:21px}.marketing{margin:40px 0}.marketing p+h4{margin-top:28px}@media screen and (min-width:768px){.footer,.header,.marketing{padding-right:0;padding-left:0}.header{margin-bottom:30px}.jumbotron{border-bottom:0}}
	</style>

</head>
<body>

	<div class="container">
		<div id="naverIdLogin">
		<a id="naverIdLogin_loginButton" href="#" role="button"><img src="https://static.nid.naver.com/oauth/big_g.PNG" width=320></a>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<script src="naveridlogin_js_sdk_2.0.2.js"></script>
	<script>
		
		var naverLogin = new naver.LoginWithNaverId(
			{

				clientId: "IVHxigYhnmEtUz62h74c",
				callbackUrl: "http://localhost:8081/NaverLogin/login.jsp",
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
			
			$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage +'" height=50 /> <p>' + uid + "-" + uName + '님 반갑습니다.</p>');
			});
		}
	</script>


</body>
</html>

