<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="result.jsp">
	<jsp:param value="FRIENDS, LOVERS, AND THE BIG TERRIBLE THING" name="title"/>
	<jsp:param value="1" name="edition"/>
	<jsp:param value="Auto-Biography" name="genre"/>
</jsp:forward>
</body>
</html>