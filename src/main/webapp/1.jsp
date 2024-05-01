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
	<jsp:param value="SYSTEM COLLAPSE" name="title"/>
	<jsp:param value="7" name="edition"/>
	<jsp:param value="Sci-Fi" name="genre"/>
</jsp:forward>
</body>
</html>