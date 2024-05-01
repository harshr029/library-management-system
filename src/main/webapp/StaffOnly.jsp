<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff only section: Records</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ page errorPage="Error.jsp" %>
<body class="bg-[#3B82F6] text-white text-3xl flex justify-center items-center h-[100vh] overflow-hidden select-none">

<%
	if(session.getAttribute("USERNAME") == null){
		response.sendRedirect("login.html");
	}

	if("reader".equals(session.getAttribute("ROLE"))){
		session.setAttribute("flag","3");
		response.sendRedirect("Error.jsp");
	}
%>

<div class="w-[50%] h-[50%] mx-auto my-auto flex flex-col gap-10 justify-center items-center">
	<a href="Books.jsp" class="mt-[10px] bg-white text-black text-3xl text-bold p-[10px] rounded-lg w-[50%] text-center">Books</a>
	<a href="readers.jsp" class="mt-[10px] bg-white text-black text-3xl text-bold p-[10px] rounded-lg w-[50%] text-center">Readers</a>
</div>

</body>
</html>