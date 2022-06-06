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
#textarea{
	width: 400px;
}
#messageBox{
	border: 1px solid black;
	overflow-y: scroll;
	background-color: rgba(125, 156, 255, 0.400);
	border-radius: 5px;
	height: 600px;
}
.me{
	border: 1px solid black;
	border-radius: 0px 8px 8px 8px;
	background-color: yellow;
	width: 500px; height: 50px auto;
	margin: 5px;
	
}
.you{
	border: 1px solid black;
	background-color: rgb(255, 255, 255);
	width: 500px; height: 50px auto;
	border-radius: 8px 0px 8px 8px;
	margin: 5px;
}
.send{
	margin: 20px;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function()
{
	openSocket();
	
	if("<%= session.getAttribute("member_dto_name") %>" != '관리자')
	{
		$('#manage').attr('style', "display:none;");	
	}
	
	if("<%= session.getAttribute("member_dto_id") %>" == 'guest')
	{
		$('#myInfo').attr('style', "display:none;");	
		$('#notice_write').attr('style', "display:none;");	
	}
});   
</script>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="main.board">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/profile.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		<%= session.getAttribute("member_dto_id") %> 님 반갑습니다. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='myInfo.member?id=<%= session.getAttribute("member_dto_id") %>'">내정보</button>&nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>&nbsp;
	  	  		<button type="button" id="manage" class="btn btn-success btn-sm" onclick="javascript:window.location='mMode.manage'">관리자모드</button>&nbsp;
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="main.board"><h4>홈</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="notice.board"><h4>공지사항</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="freeBoard.board?page=1"><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="chatRoom.chat"><h4>채팅방</h4></a>
	  </li>
	</ul>
	<hr>
	
	<div class="container">
	
	  <div class="row justify-content-center text-center">
	    <div class="col-4">
            <br><br>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-10 text-center">
	    	<form>
	    		<input type="text" id="textarea" name="textarea">
	    		<button type="button" class="btn btn-secondary" onclick="send()">전송</button>
	    	</form>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-10 text-center">
	    	<br><br>
	    </div>
	  </div> 
	</div>
	
	<div class="container"  id="messageBox">
		<div id="messages"></div>
	</div>
	
	<!-- WebSocket -->		
	<script type="text/javascript">
		var webSocket;
		var messages = document.getElementById("messages");
		
		function openSocket()
		{
			if(webSocket != undefined && webSocket.readyState != WebSocket.CLOSED)
			{
				writeResponse("WebSocket is already opened.");
				return;
			}
			
			webSocket = new WebSocket("ws://localhost:8081/Project02_Board_1/websocketendpoint");
			
			webSocket.onopen = function(event) {
				if(event.data == undefined)
				{
					return;				
				}
				
				writeResponse(event.data);
			};
			
			webSocket.onmessage = function(event) {
				writeResponse(event.data);
			};
			
			webSocket.onclose = function(event) {
				writeResponse("Connection closed!!!");
			};
		}
		
		function send() {
			
			if ($('#textarea').val().length == 0) {
				//alert("대화는 필수사항입니다.");
				$('#textarea').focus();
				return;
			}
			
			var id = "<%= session.getAttribute("member_dto_id") %>";
			var text = document.getElementById("textarea").value;
			webSocket.send(id+'@'+text);
		}
		function closeSocket() {
			webSocket.close();
		}
		
		function writeResponse(text) {
			
			var first = text.substr(0, 1);
			var str = text.substr(1, );
	
			var split = str.indexOf('@');		
			var name = text.substr(1, split);
			var message = text.substr(split+2, );
						
			
 			if(first == '나')
			{
 				//alert("내가 보냈어!");
 				$('#messages').after('<div class="row justify-content-start text-left send"><div></div><div class="col-5 me">'+ message +'</div></div>');
			}
			else if(first == '너')
			{
				//alert("너가 보냈어!");
				$('#messages').after('<div class="row justify-content-end text-right send"><div class="col-5 you">'+ message +'</div><div>&nbsp;'+ name +'</div></div>');
			}
			else
			{
				$('#messages').after('<div class="row justify-content-center text-center"><div class="col-5">'+ message +'</div></div>');
			}
		}

	</script>
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>