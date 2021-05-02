<%-- 
    Document   : add_category
    Created on : 10 Mar, 2021, 6:48:38 PM
    Author     : agra
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Add Category</title>
  </head>
  <style type="text/css">
    *{
     margin: 0px;
     padding: 0px;
    }
    body{
     font-family: arial;
    }
    nav{
        height: 110px;
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
    font-size: 20px;
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
    color: #000000;
    }
    .title{
    position: absolute;
    top: 30%;
    left: 31%;
    transform: translate(-50%,-50%);
    }
    .title h1{
        color: #000000;
        font-size: 45px;
    }
    .title:after{
    display: block;
    content: " ";
    border-bottom: 3px solid;
    flex: 1 1 auto;
    width: 800px;
    }
       
    .text{
        position: absolute;
        top:40%;
        left:5%;
       
    }
    .active,.links li:hover{
        background: #555;  
    }
    .main{
     background-image: url("images/post_bg.jpg");
     background-repeat: no-repeat;
     background-size: cover;
    }
   
    .header_inside {
       width:100%;
       height: 8vh;
       background-color: #000033;
    }
    .navbar{
        width:85%;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .logo{
        width: 120px;
        position: absolute;
        top: 5px;
        left: 10px;
        cursor: pointer;
    }
    .navbar ul li{
        list-style: none;
        display: inline-block;
        margin: 0 20px;
    }
    .navbar ul li a{
        padding: 8px;
        border-radius: 10px;
        border: 2px #1abc9c solid;
        font-size: 25px;
    }
    .card{
         width: 550px;
         height: 350px;
         background: #eecda3;    
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px;
         margin-top: 6.5%;
         margin-bottom: 6.7%;
         margin-left: 32%;
         padding-left:2%;
        }
       

    .image img{
      width: 100%;
      height: 250px;
      border-top-right-radius: 5px;
      border-top-left-radius: 5px;
     }

    .cardtitle{
        padding-top: 20px;
    padding-left: 10px;
      height: 30px;

     }
     input.right {
        position: relative;
        right: 30px;
      }

    .navi {
        align: center;
    }
    label{
        color: white;
        font-size:40px;
        padding-left: 20px;
    }
    .header_inside {
       width:100%;
       height: 8vh;
       background-color: #000033;
    }
    .navbar{
        width:85%;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    button{
      font-weight: bold;
      margin-bottom: 10px;
      background-color: white;
      border: 1px solid black;
      border-radius: 5px;
      padding:10px;
    }
    button:hover{
      background-color: black;
      color: white;
      transition: .5s;
      cursor: pointer;
    }
    .try{
        width: 80px;
        position: absolute;
        top:110px;
        left:90%;
        cursor: pointer;
        filter: brightness(2);
    }
    .icons a:hover img{   
    filter: brightness(8); 
}
</style>
<div class="header">
            <nav>
                <img class="logo" src="images/logo.png">
                <ul class="links">
                    <li ><a href="AboutUs.jsp">About Us</a></li>
                    <li><a href="ContactUs.jsp">Contact Us</a></li>
                    <li><a href="logout_a.jsp">Logout</a></li>
                </ul>
            </nav>
           
        </div>
 <div class="header_inside">
    <div class="navbar">
            <% 
                 String aid=request.getParameter("aid");               
             %>
   <div class="icons">
            <a href="admin_cardpage.jsp?aid=<%=aid%>">
                <img class="try" src="images/main.png">
            </a>
        </div>
         </div>
</div>     
      <div class="main">
 <!--cards -->
        <div class="card">
            <div class="cardtitle">
                <h1 align="center">Add Category</h1>
            </div>
            <div>
                <form name="f1" action="UploadCategory" method="POST" enctype="multipart/form-data" class="form">
                    <br>
                    <br>
            <table width='100%' align="center">        
                <tr>
                    <td align="center">Category Name:</td>
                    <td><input type="text" name="txttitle" value="" size="30" required/></td>
                </tr>
                <tr><td><br></td></tr>
                <tr><td><br></td></tr>
               <input type="hidden" name="aid" value="<%=aid%>">
                <tr>
                    <td for="img" align="center">Select image:</td>
                    <td><input type="file" id="img" name="img" accept="image/*" required> </td>
                </tr>
                 <tr><td><br></td></tr>   
                 <tr><td><br></td></tr>
                 <tr><td><br></td></tr>
                <tr>
                    <td align="right"><button type="submit" name="btn_upload" style="font-size:15px;margin-left:100px;" >Upload</button></td>                  
                </tr>
            </table>
            </form>
                
            </div>
        </div> 
 <br>
    </div>
   
<!--cards -->
  </body>
</html>
