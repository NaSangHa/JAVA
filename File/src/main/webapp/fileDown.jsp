<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<style></style>
		<script type="text/javascript"></script>
	</head>

	<body>
<%-- <%
	String saveDir = application.getRealPath("/filenanari");

	System.out.println("[saveDir] : " + saveDir);
	
	
	File dir = new File(saveDir);
	
	System.out.println("[dir] : " + dir);
	
	String fName[] = dir.list();
	
	for(String fileName : fName )
	{
		System.out.println("[fileName] : " + fileName);
		System.out.println("================[request.getContextPath()] : " + request.getContextPath());
		// System.out.println("================[java.net.URLEncoder.encode(fileName, \"UTF-8\")] : " + java.net.URLEncoder.encode(fileName, "UTF-8"));

		
		// out.write("<a href=\"" + request.getContextPath() + "/Download?filename=" + java.net.URLEncoder.encode(fileName, "UTF-8") + "\">" + fileName + "</a><br>");
		
	}
%> --%>
	<a href="/File/Download?filename=1.jpg">파일11111</a>

	</body>
</html>