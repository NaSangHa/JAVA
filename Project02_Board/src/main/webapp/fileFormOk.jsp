<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getRealPath("fileUpload");

	out.println(path + "<br>");
	
	int size = 1024 * 1024 * 10; // 10M
	String file = "";
	String oriFile = "";
	
	try
	{
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String name = multi.getParameter("bName");
		out.println(name + "<br>");
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		file = multi.getFilesystemName(str);
		out.println(file + "<br>");
		
		oriFile = multi.getOriginalFileName(str);
		out.println(oriFile + "<br>");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	file upload success!

</body>
</html>