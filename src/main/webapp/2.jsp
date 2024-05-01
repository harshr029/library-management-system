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
	<jsp:param value="THE EDGE" name="title"/>
	<jsp:param value="2" name="edition"/>
	<jsp:param value="Thriller" name="genre"/>
</jsp:forward>
</body>
</html>