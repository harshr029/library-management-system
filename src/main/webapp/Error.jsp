<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ page isErrorPage="true" %>
<body class="bg-[#3B82F6] text-white text-3xl flex justify-center items-center h-[100vh] overflow-hidden select-none">

<%
	String check = (String)session.getAttribute("flag");
	if("1".equals(check)){
		out.print("<h1>Username already exist</h1>");
	}

	else if("2".equals(check)){
		out.print("<h1>Either Username or Password is incorrect</h1>");
	}

	else if("3".equals(check)){
		out.print("<h1>You're not authorized to visit this section</h1>");
	}

	else if("4".equals(check)){
		out.print("<h1>Entered Book id is not unique.<br>Maybe this book is already in the library or<br>you've entered a wrong book id.</h1>");
	}

	else if("5".equals(check) || "6".equals(check)){
		out.print("<h1>Entered book is not available in the library.</h1>");
	}

	else{
		out.print("<h1>Error Occured</h1>");
	}

	session.setAttribute("flag", null);
%>
</body>
</html>