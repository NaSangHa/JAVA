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
	.untitle{
		font-weight: bold;
		background-color: rgba(125, 156, 255, 0.000);
	}	
	.head
	{
		margin: 0px;
	}
	#max{
		background-color: red;
		height: 15px;
	}
	#sum{
		background-color: green;
		height: 15px;
	}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function submit_summingFreeBoard() {
	
	$('#summingFreeBoard').submit();
}
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
	  	  		????????? ???????????????. &nbsp;
	  	  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript:window.location='logout.jsp'">????????????</button>&nbsp;
	  	  		<button type="button" id="manage" class="btn btn-success btn-sm" onclick="javascript:window.location='main.board'">???????????????</button>&nbsp;
  	  		</div>
		</div>  
	</nav>
	
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="mMode.manage"><h4>HOME</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="boardManage.manage"><h4>???????????????</h4></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-muted" href="memberManage.manage"><h4>????????????</h4></a>
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
            <h2>????????? ??????</h2>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
            <br><br>
	    </div>
	  </div>
	  
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<table class="table table-borderless head">
			  <thead>
			    <tr class="">
			      <th class="text-center"><button type="button" class="btn  btn-lg btn-block untitle" onclick="javascript:window.location='boardManage.manage'">????????????</button></th>
			      <th class="text-center"><button type="button" class="btn  btn-lg btn-block title" onclick="javascript:window.location='freeBoardManage.manage'">???????????????</button></th>
			    </tr>
			  </thead>
			</table>	    	
			<hr>
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-center">
	    <div class="col-12">
			<form id="summingFreeBoard" action="summingFreeBoard.manage" method="post">
			  <div class="form-row justify-content-center align-items-center text-center">
			 
			    <div class="form-group col-md-2">
			      <label for="startYear">??????</label>
			      <select id="startYear" name="startYear" class="form-control text-center">
			        <option value="2025">2025</option>
			        <option value="2024">2024</option>
			        <option value="2023">2023</option>
			        <option value="2022"selected>2022</option>
			        <option value="2021">2021</option>
			        <option value="2020">2020</option>
			      </select>
			    </div>
			    
			    <div class="form-group col-md-1">
			      <label for="startMonth">???</label>
			      <select id="startMonth" name="startMonth" class="form-control text-center">
			        <option value="12">12</option>
			        <option value="11">11</option>
			        <option value="10">10</option>
			        <option value="9">9</option>
			        <option value="8">8</option>
			        <option value="7">7</option>
			        <option value="6">6</option>
			        <option value="5">5</option>
			        <option value="4">4</option>
			        <option value="3">3</option>
			        <option value="2">2</option>
			        <option value="1" selected>1</option>
			      </select>
			    </div>
			    
			    
			    <div class="form-group col-md-1">
			      <label for="startDay">???</label>
			      <select id="startDay" name="startDay" class="form-control text-center">
			        <option value="31">31</option>
			        
			        <option value="30">30</option>
			        <option value="29">29</option>
			        <option value="28">28</option>
			        <option value="27">27</option>
			        <option value="26">26</option>
			        <option value="25">25</option>
			        <option value="24">24</option>
			        <option value="23">23</option>
			        <option value="22">22</option>
			        <option value="21">21</option>
			        
			        <option value="20">20</option>
			        <option value="19">19</option>
			        <option value="18">18</option>
			        <option value="17">17</option>
			        <option value="16">16</option>
			        <option value="15">15</option>
			        <option value="14">14</option>
			        <option value="13">13</option>
			        <option value="12">12</option>
			        <option value="11">11</option>
			        
			        <option value="10">10</option>
			        <option value="9">9</option>
			        <option value="8">8</option>
			        <option value="7">7</option>
			        <option value="6">6</option>
			        <option value="5">5</option>
			        <option value="4">4</option>
			        <option value="3">3</option>
			        <option value="2">2</option>
			        <option value="1" selected>1</option>
			      </select>
			    </div>
			    
			    <div class="col-md-1 align-items-center">~</div>
			    
			    <!-- ------------------------------------------------------------------------------------------------- -->
			    
			    <div class="form-group col-md-2">
			      <label for="endYear">??????</label>
			      <select id="endYear" name="endYear" class="form-control text-center">
			        <option value="2025">2025</option>
			        <option value="2024">2024</option>
			        <option value="2023">2023</option>
			        <option value="2022"selected>2022</option>
			        <option value="2021">2021</option>
			        <option value="2020">2020</option>
			      </select>
			    </div>
			    
			    <div class="form-group col-md-1">
			      <label for="endMonth">???</label>
			      <select id="endMonth" name="endMonth" class="form-control text-center">
			        <option value="12">12</option>
			        <option value="11">11</option>
			        <option value="10">10</option>
			        <option value="9">9</option>
			        <option value="8">8</option>
			        <option value="7">7</option>
			        <option value="6">6</option>
			        <option value="5">5</option>
			        <option value="4">4</option>
			        <option value="3">3</option>
			        <option value="2">2</option>
			        <option value="1" selected>1</option>
			      </select>
			    </div>
			    
			    
			    <div class="form-group col-md-1">
			      <label for="endDay">???</label>
			      <select id="endDay" name="endDay" class="form-control text-center">
			        <option value="31">31</option>
			        
			        <option value="30">30</option>
			        <option value="29">29</option>
			        <option value="28">28</option>
			        <option value="27">27</option>
			        <option value="26">26</option>
			        <option value="25">25</option>
			        <option value="24">24</option>
			        <option value="23">23</option>
			        <option value="22">22</option>
			        <option value="21">21</option>
			        
			        <option value="20">20</option>
			        <option value="19">19</option>
			        <option value="18">18</option>
			        <option value="17">17</option>
			        <option value="16">16</option>
			        <option value="15">15</option>
			        <option value="14">14</option>
			        <option value="13">13</option>
			        <option value="12">12</option>
			        <option value="11">11</option>
			        
			        <option value="10">10</option>
			        <option value="9">9</option>
			        <option value="8">8</option>
			        <option value="7">7</option>
			        <option value="6">6</option>
			        <option value="5">5</option>
			        <option value="4">4</option>
			        <option value="3">3</option>
			        <option value="2">2</option>
			        <option value="1" selected>1</option>
			      </select>
			    </div>
			    
			    <div class="form-group col-md-1">
				    <div class="col-12">
			            <button type="button" class="btn btn-secondary" onclick="submit_summingFreeBoard()">??????</button>
				    </div>
			    </div>

			  </div>
			</form>			    	
	    </div>
	  </div>
	  
	  <div class="row justify-content-center text-left">
	  	<hr>
	    <div class="col-12">
            <br><br><br>
	    </div>
	  </div>
	  
	  
	  <div class="row justify-content-center text-left">
	  	<hr>
	    <div class="col-12">
            <button type="button" class="btn btn-secondary" onclick="javascript:window.location='mMode.manage'">????????????</button>
	    </div>
	  </div>
	  
	</div>
	
		
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>