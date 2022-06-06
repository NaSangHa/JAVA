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
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function()
		{

			if("<%= session.getAttribute("member_dto_name") %>" != '관리자')
			{
				$('#manage').attr('style', "display:none;");	
			}
			
			if("<%= session.getAttribute("member_dto_id") %>" == 'guest')
			{
				$('#myInfo').attr('style', "display:none;");	
				// $('#notice_write').attr('style', "display:none;");	
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
	  	  		<button id="myInfo" type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='myInfo.member?id=<%= session.getAttribute("member_dto_id") %>'">내정보</button>&nbsp;
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
	    <a class="nav-link text-muted" href="freeBoard.board"><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="chatRoom.chat"><h4>채팅방</h4></a>
	  </li>
	</ul>
	<hr>
	
	<div class="container">
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	      <button type="button" class="btn btn-secondary btn-lg btn-block">자유게시판</button><br>
	    </div>
	  </div>
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table table-hover">
			  <thead>
			    <tr class="table-active">
			      <th scope="col" class="col-1">번호</th>
			      <th scope="col" class="col-3">작성자</th>
			      <th scope="col" class="col-5">제목</th>
			      <th scope="col" class="col-2">날짜</th>
			      <th scope="col" class="col-1">조회수</th>
			    </tr>
			  </thead>
			  
			  <c:forEach items="${list}" var="fdto">
			  <tbody>
			    <tr>
			      <th scope="row">${fdto.fbId}</th>
			      <td>${fdto.fbName}</td>
			      <td><a href="freeBoard_view.board?fbId=${fdto.fbId}" >${fdto.fbTitle}</a></td>
			      <td>${fn:substring(fdto.fbDate, 0, 16)}</td>
			      <td>${fdto.fbHit}</td>
			    </tr>
			  </tbody>
        	  </c:forEach>
			</table>	
	    </div>
	  </div>
  	  <div class="row justify-content-end text-center">
	  	<div class="col-2">
		</div>
	  </div>	  
	</div>
	
	<div class="container">
  	  <div class="row justify-content-end text-center">
	  	<div class="col-2">
	  		<button type="button" id="" class="btn btn-secondary" onclick="javascript:window.location='freeBoard.board?page=1'" >검색 초기화</button><br>
		</div>
	  </div>	  
	</div>	
	
  	<div class="container">
  		<div class="row justify-content-center text-center">
    	<div class="col-12">
		  <table class="table table-borderless">
	        <tr>
	            <td id="page" class="row justify-content-center col-12 align-items-center">
	                <!-- 처음 -->
	                <c:choose>
		                <c:when test="${(page.curPage-1) < 1}">
		                    <!-- [처음으로] -->
		                    <a class="page-link col-1 text-center"><<</a>
		                </c:when>
		                <c:otherwise>
		                    <!-- <a href="notice.board?page=1">[처음으로]</a> -->
		                    <a class="page-link col-1 text-center" href="search_freeBoard.board?page=1&search_method=<%= session.getAttribute("search_method") %>&search_content=<%= session.getAttribute("search_content") %>"><<</a>
		                </c:otherwise>
	                </c:choose>
	                &nbsp;&nbsp;
	    
	                <!-- 이전 -->
	                <c:choose>
	                <c:when test="${(page.curPage - 1) < 1}">
	                    <a class="page-link col-1 text-center"><</a>
	                </c:when>
	                <c:otherwise>
	                    <%-- <a href="notice.board?page=${page.curPage-1}">[뒤로]</a> --%>
	                    <a class="page-link col-1 text-center" href="search_freeBoard.board?page=${page.curPage-1}&search_method=<%= session.getAttribute("search_method") %>&search_content=<%= session.getAttribute("search_content") %>"><</a>
	                </c:otherwise>
	                </c:choose>
	    			&nbsp;&nbsp;
	    			
	                <!-- 개별페이지 -->
	                <c:forEach var="fEach" begin="${page.startPage}" end="${page.endPage}" step="1">
	                    <c:choose>
	                    <c:when test="${page.curPage == fEach}">
	                        <%-- [${fEach}] --%>
	                        <a class="btn btn-primary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">${fEach}</a>
	                    </c:when>
	                    
	                    <c:otherwise>
	                        <%-- <a href="notice.board?page=${fEach}">[${fEach}]</a> --%>
	                        <a class="page-link active" href="search_freeBoard.board?page=${fEach}&search_method=<%= session.getAttribute("search_method") %>&search_content=<%= session.getAttribute("search_content") %>">${fEach} <span class="sr-only">(current)</span></a>
	                    </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	    			&nbsp;&nbsp;
	    			
	                <!-- 다음 -->
	                <c:choose>
	                <c:when test="${(page.curPage + 1) > page.totalPage}">
	                    <a class="page-link col-1 text-center">></a>
	                </c:when>
	                <c:otherwise>
	                    <%-- <a href="notice.board?page=${page.curPage + 1}">[다음]</a> --%>
	                    <a class="page-link col-1 text-center" href="search_freeBoard.board?page=${page.curPage + 1}&search_method=<%= session.getAttribute("search_method") %>&search_content=<%= session.getAttribute("search_content") %>">></a>
	                </c:otherwise>
	                </c:choose>
	    			&nbsp;&nbsp;
	    			
	                <!-- 끝 -->
	                <c:choose>
	                <c:when test="${page.curPage == page.totalPage}">
	                    <a class="page-link col-1 text-center">>></a>
	                </c:when>
	                <c:otherwise>
	                   <%--  <a href="notice.board?page=${page.totalPage}">[끝으로]</a> --%>
	                    <a class="page-link col-1 text-center" href="search_freeBoard.board?page=${page.totalPage}&search_method=<%= session.getAttribute("search_method") %>&search_content=<%= session.getAttribute("search_content") %>">>></a>
	                </c:otherwise>
	                </c:choose>
	            </td>
	        </tr>	  
		  </table>
    	</div>
    	</div>	  
  	</div>	



		
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>