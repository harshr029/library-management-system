<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE-edge'>
    <meta name='viewport' content='width=device-width,initial-scale=1.0'>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="s.css">
    <title>Readers Record</title>
</head>
<%@ page errorPage="Error.jsp" %>
<%@ page import="java.sql.*" %>
<body class="bg-blue-500 select-none">

    <h1 class="font-bold text-6xl text-violet-950 flex justify-center items-center mt-5">RECORD OF READERS</h1>
    <form action="AddReader.jsp" method="post" class="m-9 text-pink-950 w-[90%] mx-auto">
        <div class="m-5 flex w-[100%] justify-between ">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="fname" class="text-2xl">First Name : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="fname" id="fname" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="lname" class="text-2xl">Last Name : </label>
            <input type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="lname" id="lname" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="email" class="text-2xl">Email id: </label>
            <input  type="email" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="email" id="email" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="phone" class="text-2xl">Phone no : </label>
            <input type="tel" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="phone" id="phone" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="bookId" class="text-2xl">Book id : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="bookId" id="bookId" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="city" class="text-2xl">City : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="city" id="city" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="state" class="text-2xl">State : </label>
            <input type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="state" id="state" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="redId" class="text-2xl">Reader Id : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="redId" id="redId" required>
            </div>
        </div>

        <div class="ml-5">
            <input type="submit" class="text-white cursor-pointer bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2" value="Register Reader">
        </div>
        
    </form>

    <table class="w-[100%] mt-10 border-8 border-cyan-500 text-center text-white font-bold">
        <tr class="text-black font-bolder">
            <th>First Name</th>
            <th>Last Name</th>
            <th>Book id</th>
            <th>Title</th>
            <th>Issue date</th>
            <th>Return Date</th>
            <th>Phone Number</th>
            <th>Fine</th>
        </tr>
        
    <%
	//Getting info of all the readers issued a book
	try{
	//JDBC code
		
	//register driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//making tunnel
	String url = "jdbc:mysql://localhost:3306/Library";
	String user = "root";
	String pass = "H@rsH@2002";        //type your database password
	
	Connection con = DriverManager.getConnection(url,user,pass);
	
	//creating query
	String query = "select FirstName,LastName,BookId,Title,date_format(IssueDate, '%d-%m-%Y') as IssueDate,date_format(ReturnDate, '%d-%m-%Y') as ReturnDate,PhoneNo,Fine from Readers natural join PhoneNo natural join Books natural join Record";
	Statement stmt = con.createStatement();
	
	//fire query
	ResultSet set = stmt.executeQuery(query);
	
	String firstName = new String();
	String lastName = new String();
	String bookId = new String();
	String title = new String();
	String issueDate = new String();
	String returnDate = new String();
	String phoneNo = new String();
	String fine = new String();
	
	while(set.next()){
		firstName = set.getString("FirstName");
		lastName = set.getString("LastName");
		bookId = set.getString("BookId");
		title = set.getString("Title");
		issueDate = set.getString("IssueDate");
		returnDate = set.getString("ReturnDate");
		phoneNo = set.getString("PhoneNo");
		fine = set.getString("Fine");
		
		out.print("<tr> <td>"+firstName+"</td><td>"+lastName+"</td><td>"+bookId+"</td><td>"+title+"</td><td>"+issueDate+"</td><td>"+returnDate+"</td><td>"+phoneNo+"</td><td>"+fine+"</td> </tr>");
	}
	
	con.close();
	
}catch(Exception e){
	e.printStackTrace();
}
		
	%>

    </table>
</body>

</html>