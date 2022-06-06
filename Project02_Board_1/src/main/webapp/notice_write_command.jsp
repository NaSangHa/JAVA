<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.study.jsp.dao.Board_DAO"%>
<%@page import="com.study.jsp.dto.Board_DTO"%>

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
	    
    String bName = multipartRequest.getParameter("bName");
    String bTitle = multipartRequest.getParameter("bTitle");
    String bFile = multipartRequest.getOriginalFileName("bFile"); // 원래 파일
    String bFile_server = multipartRequest.getFilesystemName("file"); // 서버에 올라간 파일명
    String bContent = multipartRequest.getParameter("bContent");
 
    File file = multipartRequest.getFile("file");
    
    Board_DAO board_dao = Board_DAO.getInstance();
	board_dao.insertNotice(bName, bTitle, bContent, bFile);
	
	System.out.println("글 등록 완료!");
%>
	<jsp:forward page="notice.board?page=1" />
	
</body>
</html>