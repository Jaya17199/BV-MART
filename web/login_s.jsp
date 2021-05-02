<%-- 
    Document   : login_s
    Created on : 28 Feb, 2021, 7:08:07 PM
    Author     : hp
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
    <script type="text/javascript">
function noBack(){window.history.forward()}
noBack();
window.onload=noBack;
window.onpageshow=function(evt){if(evt.persisted)noBack()}
window.onunload=function(){void(0)}
</script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Login</title>
       
            
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
        <%! String table="seller";%>
    </head>
    <body>
        <div class="main">
    <div class="register">
        <img src="images/logo.png" style= "width:150px; height:150px; border-radius:50%; margin-left: 130px" >
                <h2>SELLER</h2>
                <form name="myform" id="register" method="post" onsubmit="return validateform()">
                <label>User-ID : </label>
                <br>
                <input type="text" name="txt_uid" id="name" placeholder="Enter User-ID" required>
                <br><br>
                <label>Password : </label>
                <br>
                <input type="password" name="txt_pass" id="name" placeholder="Enter Password" required>
                <br><br>
                <a href="forgetpassword.jsp?table=<%=table%>">Forget Password??</a>
                <input type="submit" value="Submit" name="btn_submit" id="submit">
                </form>
                <script>  
function validateform(){  
var password=document.myform.txt_pass.value;  
var uid=document.myform.txt_uid.value;  
     if(uid.length<10){  
         alert("User-ID must be atleast 10 characters long.");  
         return false;  
    }  
    if(password.length<8){  
         alert("Password must be at least 8 characters long.");  
         return false;  
    }  
}  
                </script>  
            </div>
        </div>
       
<%
   if(request.getParameter("btn_submit")!=null)
    { 
try
{
        String uid=request.getParameter("txt_uid");
        String pwd=request.getParameter("txt_pass");
        
        String query="select * from seller where s_id='"+uid+"' and s_pass='"+pwd+"'";
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        boolean status=rs.next();
        if(status)
        {
             %>
            <script>
                alert("Successfully Logged in");
                window.location= "seller_cardpage.jsp?sid=<%=uid%>";
             </script>
<!--            response.sendRedirect("seller_cardpage.jsp?sid="+uid);          -->
            <%
        }
        else
{
            %>
            <script>
                alert("Details are incorrect!!! Try again");
                window.location= "login_s.jsp";
             </script>
<!--            response.sendRedirect("login_s.jsp");-->
<%
    }}
catch(Exception ex){ex.printStackTrace();}

    }
%>
 </body>
</html>

