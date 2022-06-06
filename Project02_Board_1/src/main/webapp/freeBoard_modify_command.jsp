<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.study.jsp.dao.FreeBoard_DAO"%>
<%@page import="com.study.jsp.dto.FreeBoard_DTO"%>

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
    
    String fbId = multipartRequest.getParameter("fbId");
    String fbName = multipartRequest.getParameter("fbName");
    String fbTitle = multipartRequest.getParameter("fbTitle");
    String fbContent = multipartRequest.getParameter("fbContent");
    String fbDate = multipartRequest.getParameter("fbDate");
    
    String fbHit = multipartRequest.getParameter("fbHit");
    String fbGroup = multipartRequest.getParameter("fbGroup");
    String fbStep = multipartRequest.getParameter("fbStep");
    String fbFile = multipartRequest.getOriginalFileName("fbFile");
    
    String fbLike = multipartRequest.getParameter("fbLike"); // 원래 파일
    
    File file = multipartRequest.getFile("file");
    
    FreeBoard_DAO freeboard_dao = FreeBoard_DAO.getInstance();
    freeboard_dao.freeBoard_modify(fbId, fbTitle, fbContent, fbFile);
  
	response.sendRedirect("freeBoard_view.board?fbId=" + fbId + "&fbName=0&loginName=0");
%>
	
</body>
</html>