<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.study.jsp.dao.FreeBoard_DAO"%>
<%@page import="com.study.jsp.dto.FreeBoard_DTO"%>

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
	    
    String fbName = multipartRequest.getParameter("fbName");
    String fbTitle = multipartRequest.getParameter("fbTitle");
    String fbFile = multipartRequest.getOriginalFileName("fbFile"); // 원래 파일
    String fbFile_server = multipartRequest.getFilesystemName("fbFile"); // 서버에 올라간 파일명
    String fbContent = multipartRequest.getParameter("fbContent");
 
    File file = multipartRequest.getFile("file");
    
    FreeBoard_DAO freeboard_dao = FreeBoard_DAO.getInstance();
	freeboard_dao.insertFreeBoard(fbName, fbTitle, fbContent, fbFile);
	
	System.out.println("글 등록 완료!");
%>
	<jsp:forward page="freeBoard.board?page=1" />
	
</body>
</html>