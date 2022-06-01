<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		submit_myInfoModify();
}

function submit_myInfoModify() {
	
	var queryString = $('#myInfo_modify').serialize();
	$.ajax({
		url : '/Project02_Board_1/myInfo_modify.member',
		type : 'POST',
		data : queryString,
		dataType : 'text',
		success : function(json) {

			var result = JSON.parse(json);

			if (result.code == "success") {
				alert(result.desc);
				window.location.replace("myInfo.member?id=<%= session.getAttribute("member_dto_id")%>");
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
		<a class="navbar-brand" href="main.jsp">
		  <img src="./img/board.png" width="30" height="30" class="d-inline-block align-top justify-content-start" alt="">
		  NOTICE BOARD
		</a>
		<div class="justify-content-end">
			<img src="./img/profile.png" width="30" height="30" class="d-inline-block justify-content-end align-items-center" alt="">&nbsp;	
  	  		<div class="d-inline-block justify-content-end align-items-center">
	  	  		<%= session.getAttribute("member_dto_id") %> 님 반갑습니다. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">로그아웃</button>
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="main.jsp"><h4>홈</h4></a>
	  </li>	
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="notice.board"><h4>공지사항</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="freeBoard.board?page=1"><h4>자유게시판</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#"><h4>Menu3</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="#"><h4>Menu4</h4></a>
	  </li>
	</ul>
	<hr>
	
	<div class="container">
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
	      <button type="button" class="btn btn-secondary btn-lg btn-block">내 정보</button>
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
	  
	  <form id="myInfo_modify" name="myInfo_modify">
	  <input type="hidden" class="form-control" id="id" name="id" value="${myInfo.getId() }">
      <div class="container">
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="id">아이디</label> 
            <h4>${myInfo.getId() }</h4>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" value="${myInfo.getPw() }">
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="pw_check">비밀번호 확인</label>
            <input type="password" class="form-control" id="pw_check" name="pw_check" value="${myInfo.getPw() }">
            <div id="pw_correct"></div> <div id="pw_error"></div>            
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="name" value="${myInfo.getName() }">
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
                <input type="text" class="form-control" id="phone2" name="phone2" value="${fn:substring(myInfo.getPhone(),4,8) }">
              </div>
              <div>-</div>
              <div class="form-group col-4">
                <input type="text" class="form-control" id="phone3" name="phone3" value="${fn:substring(myInfo.getPhone(),9, 13) }">
              </div>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="form-group col-8">
            <label for="eMail">이메일</label><br>
            <div class="form-row">
              <div class="form-group col-5">
                <input type="text" class="form-control" id="eMail" name="eMail" value="${fn:substring(myInfo.geteMail(), 0, fn:indexOf(myInfo.geteMail(), '@'))}">
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
      </div>
    </form>
	  <div class="row justify-content-center">
	    <div class="col-4 text-left">
	    	<button type="button" class="btn btn-secondary" onclick="javascript:window.location='myInfo.member?id=<%= session.getAttribute("member_dto_id")%>'" >취소</button>
	    </div>
	    <div class="col-4 text-right">
	    	<button type="button" class="btn btn-secondary" onclick="form_check()" >정보 수정</button>
	    </div>
	  </div>	  
	</div>		
    
    

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>