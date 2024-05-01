<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE-edge'>
    <meta name='viewport' content='width=device-width,initial-scale=1.0'>
    <title>Welcome to the Library</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="./css/main.css">
</head>

<body class="bg-blue-500 select-none">
<%
	session.invalidate();
%>
	
    <div class="flex justify-evenly mt-8 overflow-x-hidden">
        <div>
            <img src="./images/LOGO.jpg" class="rounded-lg" height="75px" width="75px">
        </div>
        <div class="flex justify-between items-center gap-7 bg-blue-800 text-white py-1 px-5 rounded-lg ">
            <div><a href="signup.html" target="_self">Sign Up</a></div>
            <div><a href="login.html" target="_self">Log In</a></div>
            <div><a href="index.jsp">Home</a></div>
            <div><a href="result.jsp" target="_self">Books</a></div>
            <div><a href="MyProfile.jsp" target="_self">My Profile</a></div>
            <div><a href="StaffOnly.jsp">Record</a></div>
            <div><a href="#">About us</a></div>
            <div><a href="#">Contact us</a></div>
        </div>
        <div class="whatsapp">
            <a href="https://api.whatsapp.com/send?phone=+918401840142&text=Hi,+need+help!" target="_self"><img
                    src="./images/whatsapp.png" height="60x" width="80px"></a>
        </div>
    </div>

    <div class="flex mt-10 justify-evenly items-center">
        <div class="hover:animate-pulse ">
            <img src="./images/lib.jpg" class="ml-6 rounded-xl">
        </div>
        <div class="w-[50%]">
            <p class="font-semibold text-[30px]">
                Welcome to a heaven of wisdom and wonder - our beloved library! In a
                world increasingly dominated by digital information, libraries stand
                as timeless sanctuaries that bridge the past, present, and future.
            </p>
        </div>
    </div>

    <div class="mt-8">
        <div class="flex justify-center items-center text-[40px] text-yellow-900">
            <span>BEST SELLERS IN THE MARKET</span>
        </div>
        <table class="flex justify-center items-center m-10">
            <tr>
                <td class="w-[20%] flex-row bg-blue-950 text-slate-300 p-8">
                    <a href="login.html" target="_self">
                        <img src="./images/1.jpg" height="140px" width="240px">
                        <span class="font-mono ">SYSTEM COLLAPSE</span>
                        <span>by Martha Wells</span>
                        <p>The seventh book in the Murderbot Diaries series. The Barish-Estranza corporation might take
                            a colony of humans to use as a free workforce.
                        </p>

                    </a>
                </td>
                <td class="w-[20%] flex-row bg-blue-950 text-slate-300 p-8">
                    <a href="login.html" target="_self">
                        <img src="./images/2.jpg" height="150px" width="250px">
                        <h1 class="font-mono ">THE EDGE</h1>
                        <span>by David Baldacci</span>
                        <p>
                            The second book in the 6:20 Man series. Travis Devine investigates the murder of the C.I.A.
                            operative Jenny Silkwell in rural Maine.
                        </p>
                    </a>
                </td>
                <td class="w-[20%] flex-row bg-blue-950 text-slate-300 p-8">
                    <a href="login.html" target="_self">
                        <img src="./images/3.jpg" height="150px" width="250px">
                        <h1 class="font-mono">THE LITTLE LIAR</h1>
                        <span>by Mitch Albom</span>
                        <p>The actions of an 11-year-old boy help facilitate the delivery of Jewish residents, including
                            his family, to Auschwitz.
                        </p>
                    </a>
                </td>

                <td class="w-[20%] flex-row bg-blue-950 text-slate-300 p-8">
                    <a href="login.html" target="_self">
                        <img src="./images/4.jpg" height="150px" width="250px">
                        <h1>FRIENDS, LOVERS, AND THE BIG TERRIBLE THING</h1>
                        <span>by Matthew Perry</span>
                        <p>
                            The late actor, known for playing Chandler Bing on “Friends,” shares stories from his
                            childhood and his struggles with sobriety.
                        </p>
                    </a>
                </td>
            </tr>
            
        </table>

    </div>
    <footer class="bg-slate-400 pt-28 text-black flex justify-evenly items-center">
        <div>
            <ul>
                <li>Open Library</li>
                <li>Vision</li>
                <li>Partners</li>
                <li>Career</li>
                <li>Blog</li>
                <li>Terms of srvices</li>
                <li>Donate</li>
            </ul>
        </div>

        <div>
            <ul>
                <li>Discover</li>
                <li>Home</li>
                <li>Books</li>
                <li>Authors</li>
                <li>Subject</li>
                <li>Collections</li>
                <li>Advanced Search</li>
                <li>Return to Top</li>

            </ul>
        </div>

        <div>
            <ul>
                <li>Develop</li>
                <li>Developer Center</li>
                <li>API Documentation</li>
                <li>Bulk Data Dumps</li>
                <li>Writing Bots</li>

            </ul>
        </div>

        <div>
            <ul>
                <li>Help</li>
                <li>Help Center</li>
                <li>Report A Problem</li>
                <li>Suggesting Edits</li>
                <li>Add a Book</li>
            </ul>
        </div>

        <div>
            <ul>
                <li>Change website language</li>
                <li>>Čeština (cs)</li>
                <li>Deutsch (de)</li>
                <li>English (en)</li>
                <li>Español (es)</li>
                <li>Français (fr)</li>
                <li>Hrvatski (hr)</li>
                <li>Italiano (it)</li>
                <li>Português (pt)</li>
                <li>తెలుగు (te)</li>
                <li>Українська (uk)</li>
                <li>中文 (zh)</li>

            </ul>
        </div>


    </footer>
</body>

</html>