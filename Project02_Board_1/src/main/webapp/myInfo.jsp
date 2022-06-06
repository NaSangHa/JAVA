<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function()
		{

			if("<%= session.getAttribute("member_dto_name") %>" != '관리자')
			{
				$('#manage').attr('style', "display:none;");	
			}
		}); 

</script>
<style>
	*{
		font-family: 'Hahmlet';
	}

</style>
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
	    <div class="col-12">
	      <button type="button" class="btn btn-secondary btn-lg btn-block" disable="disable">내 정보</button>
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	      <br><br>
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	      <img src="./img/profile.png" width="100" height="100" /> <br><br>
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-8">
			<table class="table">
			  <tbody>
			    <tr class="table-secondary">
			      <th scope="row">아이디</th>
			      <th scope="row">${myInfo.getId() }</th>
			    </tr>
			    <tr>
			    </tr>
			    <tr class="table-secondary">
			      <th scope="row">이름</th>
			      <th scope="row">${myInfo.getName() }</th>
			    </tr>
			    <tr>
			    </tr>
			    <tr class="table-secondary">
			      <th scope="row">등급</th>
			      <th scope="row">
			        <c:set var="grade" value="${myInfo.getGrade() }" scope="session"/>
				    <c:if test="${grade == '1'}">
				       Bronze
				    </c:if>			      
				    <c:if test="${grade == '2'}">
				       Silver
				    </c:if>			      
				    <c:if test="${grade == '3'}">
				       Gold
				    </c:if>     
				    <c:if test="${grade == '5'}">
				       Administrator
				    </c:if>     
			      </th>
			    </tr>
			    <tr>
			    </tr>
			    <tr class="table-secondary">
			      <th scope="row">연락처</th>
			      <th scope="row">${myInfo.getPhone() }</th>
			    </tr>
			    <tr>
			    </tr>
			    <tr class="table-secondary">
			      <th scope="row">이메일</th>
			      <th scope="row">${myInfo.geteMail() }</th>
			    </tr>
			    <tr>
			    </tr>
			    <tr class="table-secondary">
			      <th scope="row">성별</th>
			      <th scope="row">
			        <c:set var="grade" value="${myInfo.getGender() }" scope="session"/>
				    <c:if test="${grade == 'man'}">
				       남
				    </c:if>			      
				    <c:if test="${grade == 'woman'}">
				       여
				    </c:if>     
			      </th>
			    </tr>
			    <tr>
			    </tr>
			  </tbody>
			</table>	      
	    </div>
	  </div>
	  <div class="row justify-content-center">
	    <div class="col-4 text-left">
	    	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='main.board'" >메인 화면</button>
	    </div>
	    <div class="col-4 text-right">
	    	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='myContent.board?id=${myInfo.getId() }'" >내가 쓴 글</button> &nbsp;
	    	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='myInfo_modify_view.member?id=${myInfo.getId() }'" >정보 수정</button>
	    </div>
	  </div>	  
	</div>		
    
    

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>