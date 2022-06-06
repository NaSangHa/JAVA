<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.study.jsp.dao.Board_DAO"%>
<%@page import="com.study.jsp.dto.Board_DTO"%>
<%@page import="com.study.jsp.dto.Board_DTO"%>


<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<style></style>
		<script type="text/javascript"></script>
	</head>
<body>
<%
	String saveDir = application.getRealPath("/file/");
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";

	MultipartRequest multipartRequest
	= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	    
    String bFile_server = multipartRequest.getFilesystemName("file"); // 서버에 올라간 파일명
    
    String bId = multipartRequest.getParameter("bId");
    String bName = multipartRequest.getParameter("bName");
    String bTitle = multipartRequest.getParameter("bTitle");
    String bContent = multipartRequest.getParameter("bContent");
    String bDate = multipartRequest.getParameter("bDate");
    
    String bHit = multipartRequest.getParameter("bHit");
    String bGroup = multipartRequest.getParameter("bGroup");
    String bStep = multipartRequest.getParameter("bStep");
    String bFile = multipartRequest.getOriginalFileName("bFile");
    
    String bLike = multipartRequest.getParameter("bLike"); // 원래 파일
    
    File file = multipartRequest.getFile("file");
    
    Board_DAO board_dao = Board_DAO.getInstance();
	board_dao.notice_modify(bId, bTitle, bContent, bFile);
  
	response.sendRedirect("notice_view.board?bId=" + bId +"&bName=0&loignName=0");
%>
	
</body>
</html>