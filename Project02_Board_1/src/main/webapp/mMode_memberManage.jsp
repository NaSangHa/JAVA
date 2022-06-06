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

	body{
	    background-color: rgba(125, 156, 255, 0.400);
	}
	.container{
		
	}
	.title{
		font-weight: bold;
		background-color: rgba(125, 156, 255, 0.600);
	}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function noEvent() 
{
    if (event.keyCode == 116) {
	event.keyCode= 2;        
	return false;    
	}    
	else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))    
	{        
		return false;    
	}
}
document.onkeydown = noEvent;
</script>

</head>
<body>
	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="mMode.jsp">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/master.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		관리자 모드입니다. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>&nbsp;
	  	  		<button type="button" id="manage" class="btn btn-success btn-sm" onclick="javascript:window.location='main.board'">사용자모드</button>&nbsp;
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="mMode.manage"><h4>HOME</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="boardManage.manage"><h4>게시글관리</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="memberManage.manage"><h4>회원관리</h4></a>
	  </li>
	</ul>
	<hr>
	
	<div class="container ">
	
		
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <h2>회원 관리</h2>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <thead>
			    <tr class="">
			      <th class="text-left"><img src="./img/gold.png" width="50" height="50" class="d-inline-block justify-content-end align-items-center" alt="">골드 회원</th>
			    </tr>
			  </thead>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <tbody>
			    <tr class="title">
			      <td>아이디</td>
			      <td>이름</td>
			      <td>연락처</td>
			      <td>이메일</td>
			      <td>성별</td>
			      <td>가입일자</td>
			      <td></td>
			      <td></td>
			      <td></td>
			    </tr>
			    <c:forEach items="${goldMember}" var="gmember">
			    <tr class="table-light">
			      <td>${gmember.id}</td>
			      <td>${gmember.name}</td>
			      <td>${gmember.phone}</td>
			      <td>${gmember.eMail}</td>
			      <td>
					<c:set var="grade" value="${gmember.gender }"/>
		            <c:if test="${grade == 'man'}">
		            남
		            </c:if>			      
		            <c:if test="${grade == 'woman'}">
		            여
		            </c:if> 
				  </td>
			      <td>${fn:substring(gmember.joinDate, 0, 10)}</td>
			      <td><span class="badge badge-light">&nbsp;</span></td>
			      <%-- <td><a href="gradeDown.manage?id=${gmember.id}" class="badge badge-warning">강등</a></td> --%>
			      <td><button type="button" class="btn btn-warning btn-sm" onclick="javascript:window.location='gradeDown.manage?id=${gmember.id}'">강등</button></td>
			      <%-- <td><a href="deleteMember.manage?id=${gmember.id}" class="badge badge-danger">탈퇴</a></td> --%>
			      <td><button type="button" class="btn btn-danger btn-sm" value="탈퇴" onclick="javascript:window.open('popUp.manage?id=${gmember.id}', 'a', 'width=800, height=600, left=200, top=200');" />탈퇴</button></td>			      
			    </tr>
			    </c:forEach>  	  
			  </tbody>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  <!-- ------------------------------------------------------------------------------------------------------------------------------------------------- -->
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <thead>
			    <tr class="">
			      <th class="text-left"><img src="./img/silver.png" width="50" height="50" class="d-inline-block justify-content-end align-items-center" alt="">실버 회원</th>
			    </tr>
			  </thead>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <tbody>
			    <tr class="title">
			      <td>아이디</td>
			      <td>이름</td>
			      <td>연락처</td>
			      <td>이메일</td>
			      <td>성별</td>
			      <td>가입일자</td>
			      <td></td>
			      <td></td>
			      <td></td>
			    </tr>
			    <c:forEach items="${silverMember}" var="smember">
			    <tr class="table-light">
			      <td>${smember.id}</td>
			      <td>${smember.name}</td>
			      <td>${smember.phone}</td>
			      <td>${smember.eMail}</td>
			      <td>
					<c:set var="grade" value="${smember.gender }"/>
		            <c:if test="${grade == 'man'}">
		            남
		            </c:if>			      
		            <c:if test="${grade == 'woman'}">
		            여
		            </c:if> 
				  </td>
			      <td>${fn:substring(smember.joinDate, 0, 10)}</td>
			      <%-- <td><a href="gradeUp.manage?id=${smember.id}" class="badge badge-success">승급</a></td> --%>
			      <td><button type="button" class="btn btn-success btn-sm" onclick="javascript:window.location='gradeUp.manage?id=${smember.id}'">승급</button></td>
			      <%-- <td><a href="gradeDown.manage?id=${smember.id}" class="badge badge-warning">강등</a></td>	 --%>		      
			      <td><button type="button" class="btn btn-warning btn-sm" onclick="javascript:window.location='gradeDown.manage?id=${smember.id}'">강등</button></td>			      
			      <%-- <td><a href="deleteMember.manage?id=${gmember.id}" class="badge badge-danger">탈퇴</a></td> --%>	
			      <td><button type="button" class="btn btn-danger btn-sm" value="탈퇴" onclick="javascript:window.open('popUp.manage?id=${smember.id}', 'a', 'width=800, height=600, left=200, top=200');" />탈퇴</button></td>		      
			    </tr>
			    </c:forEach>  	  
			  </tbody>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  <!-- ------------------------------------------------------------------------------------------------------------------------------------------------- -->
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <thead>
			    <tr class="">
			      <th class="text-left"><img src="./img/bronze.png" width="50" height="50" class="d-inline-block justify-content-end align-items-center" alt="">브론즈 회원</th>
			    </tr>
			  </thead>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table">
			  <tbody>
			    <tr class="title">
			      <td>아이디</td>
			      <td>이름</td>
			      <td>연락처</td>
			      <td>이메일</td>
			      <td>성별</td>
			      <td>가입일자</td>
			      <td></td>
			      <td></td>
			      <td></td>
			    </tr>
			    <c:forEach items="${bronzeMember}" var="bmember">
			    <tr class="table-light">
			      <td>${bmember.id}</td>
			      <td>${bmember.name}</td>
			      <td>${bmember.phone}</td>
			      <td>${bmember.eMail}</td>
			      <td>
					<c:set var="grade" value="${bmember.gender }"/>
		            <c:if test="${grade == 'man'}">
		            남
		            </c:if>			      
		            <c:if test="${grade == 'woman'}">
		            여
		            </c:if> 
				  </td>
			      <td>${fn:substring(bmember.joinDate, 0, 10)}</td>
			      <%-- <td><a href="gradeUp.manage?id=${bmember.id}" class="badge badge-success">승급</a></td> --%>
			     <td><button type="button" class="btn btn-success btn-sm" onclick="javascript:window.location='gradeUp.manage?id=${bmember.id}'">승급</button></td>	
			      <td><span class="badge badge-light">&nbsp;</span></td>
			      <%-- <td><a href="deleteMember.manage?id=${gmember.id}" class="badge badge-danger">탈퇴</a></td>--%>
			      <td><button type="button" class="btn btn-danger btn-sm" value="탈퇴" onclick="javascript:window.open('popUp.manage?id=${bmember.id}', 'a', 'width=800, height=600, left=200, top=200');" />탈퇴</button></td>	
			    </tr>
			    </c:forEach>  	  
			  </tbody>
			</table>	    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-left">
	    <div class="col-12">
            <button type="button" class="btn btn-secondary" onclick="javascript:window.location='mMode.manage'">뒤로가기</button>
	    </div>
	  </div>
	  
	</div>
	
		
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>