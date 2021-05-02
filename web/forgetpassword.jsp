<%-- 
    Document   : forgetpassword
    Created on : 14 Mar, 2021, 12:04:42 AM
    Author     : agra
--%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import= "java.util.Date;"%>--%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title> 
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body {
                    background-image: url("images/login_bg.jpeg");
                    background-size: cover;
                    background-repeat: no-repeat;
                    font-family: 'Arimo', sans-serif;
                    margin: 0;
                    padding: 0;
                    height: 100%;
                    box-sizing: border-box;
                }
                div.main{
                    width: 400px;
                    margin: 10px auto 10px auto;
                    
                }
                h2{
                   text-align: center;
                   padding: 10px;
                   font-family: sans-serif;
                  
                   
                }
                div.register{
                    padding: 20px;
                    background-color: rgba(0,0,0,0.6);
                    width: 100%;
                    font-size: 18px;
                    border-radius: 10px;
                    border: 1px solid rgba(255,255,255,255);
                    box-shadow: 2px 2px 15px rgba(0,0,0,0.3);
                    color: #fff;
                    margin-top: 40px;
                }
                form#register{
                    margin: 40px;
                }
                input#name{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }
                input#submit{
                    width: 150px;
                    padding: 7px;
                    font-size: 16px;
                    font-family: sans-serif;
                    font-weight: 600;
                    border-radius: 3px;
                    background-color: rgba(250,100,0,0.8);
                    color: #fff;
                    cursor: pointer;
                    border: 1px solid rgba(255,255,255,0.3);
                    box-shadow: 1px 1px 5px rgba(0,0,0,0.3);
                    margin-left: 80px;
                   
                }
               textarea{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }

                select{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                    font-size: 15px;
                }
                
        
        </style>
       <%
        String table=request.getParameter("table");
        %>
    </head>
    <body>
        <div class="main">
    <div class="register">
                <h2>FORGOT PASSWORD</h2>
                <form name="myform" action="mail" method="post" onsubmit="return validateform()">
                    <input type="hidden" name="table" value="<%=table%>">
                <label>User-ID : </label>
                <br>
                <input type="text" name="txtid" id="name" placeholder="Enter User-ID" required>
                <br><br>
                <label>Email ID : </label>
                <br>
                <input type="text" name="txtemail" id="name" placeholder="Enter Email ID" required>
                <br><br>
                
                <input type="submit" value="Submit" name="btn_submit" id="submit">
                </form>
<!--                <script>  
function validateform(){  
var email=document.myform.txtemail.value;  
var id=document.myform.txtid.value;
 if(!(/\b(BTBT)[A-Z][0-9]{5}\b/.test(myform.sid.value)))
  {
      alert("Enter Valid SmartCardID"); 
      return false; 
  }
    if (!(/^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/.test(myform.email.value)))
    {
        alert("You have entered an invalid email address!");
      return (false);
    }
      
}  
</script>  -->
    </div>
    </div>
    </body>
</html>




