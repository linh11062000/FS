<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello world
<%
 String url="home/index.htm"; 
/* String url="admin/flower.htm"; */
response.sendRedirect(url);
%>
</body>
</html>