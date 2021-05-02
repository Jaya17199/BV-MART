<%-- 
    Document   : home6
    Created on : 1 Mar, 2021, 10:23:17 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html onload="preventBack()">
    <head>
     <script>
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);

            window.onunload = function () {
                null
            };
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>
            *{
                padding: 0px;
                margin: 0px;
                font-family: arial;
            }  
            nav{
                height: 135px;
                background: #2c3e50;
                box-shadow: 0 10px 15px rgba(0,0,0,0.1);
            } 
            .logo{
                float: left;
                width: 150px;
                height: auto;
                margin-left:20px;
            }
            .links {
	margin-right: 150px;
	float: right;
        margin-top: 30px;
        }
        
        .links li {
	display: inline-block;
	list-style: none;
	position: relative;
        font-size: 18px;
        }
        .links li a{
	display: inline-block;
	color: #fff;
	padding: 20px;
	text-decoration: none;
        }
        .links li:hover{
	background: #555;
        }
        .links li:hover .dropdown{
	display: block;
        }
        .dropdown {
	background: #111;
	position: absolute;
	display: none;
	top: 57px;
	left: 0px;
	width: 150px;
        }
        .dropdown li{
	border: 2px solid #222;
	display: block;
	color: #fff;
        }
     .title{
        position: absolute;
        top: 47%;
        left: 52%;
        transform: translate(-50%,-50%);
    }
    .title h1{
        color: #000000;
        font-size: 70px;
    }
    .subtitle{
        position: absolute;
        top: 54%;
        left: 31%
       
    }
    .subtitle p{
        color: #000000;
        font-size: 30px;
    }
    
        div.image {
   content:url("images/home.jpg");
    width: 100%;
    height: 595px;  
}​

        </style>
    </head>
    <body>
        <div class="header">
            <nav>
                <img class="logo" src="images/logo.png">
                <ul class="links">
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="#">Login</a>
                        <ul class="dropdown">
                            <li><a href="login_s.jsp">Seller</a></li>
                            <li><a href="login_b.jsp">Buyer</a></li>
                        </ul>  
                    </li>
                    <li><a href="AboutUs_home.jsp">About Us</a></li>
                    <li><a href="ContactUs_home.jsp">Contact Us</a></li>
                </ul>
            </nav>
            
        </div>
        <div class="main">
            <div class="image">
                
            </div>
            <div class="title">
                <h1>BV-MART</h1>
         </div>
          <div class="subtitle">
                <p>No need to go anywhere when everything is here</p>    
          </div>  
        </div>
    </body>
</html>
