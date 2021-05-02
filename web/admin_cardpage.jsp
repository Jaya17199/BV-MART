<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html style="font-size: 16px;">
  <head>
    <title>Admin Main Page</title>
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
/*     background-image: url("images/abstract.jpg");*/
background-image: url("images/seller_cardbg.jpg");
     background-repeat: no-repeat;
     background-size: cover;
/*     opacity: 60%;*/
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
         width: 280px;
         height: 290px;
         background: #C0C0C0;    
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px; 
         margin-left: 11%;
         margin-top: 5.5%;

        }

    .image img{
      width: 100%;
      height: 250px;
      border-top-right-radius: 5px;
      border-top-left-radius: 5px;
     }

    .cardtitle{
    padding-left: 10px;
    padding-top: 5px;
      height: 30px;
      font-size: 18px;

     }
     input.right {
        position: relative;
        right: 30px;
      }

/*    .navi {
        align: center;
    }*/
    label{
        color: white;
        font-size:40px;
        padding-left: 20px;
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
    .footer {
        padding: 20px;
        background-color: #000033;
        color: black;
        height:5vh;
        font-size: 30px;
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
<%
    String aid=request.getParameter("aid");
    String aname="";
    String query="select a_name from admin where a_id='"+aid+"'";
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    boolean status=rs.next();
    if(status)
    {
        aname=rs.getString(1);
    }
%>
<div class="header_inside">
    <div class="navbar">
        <label>Welcome <%=aname%></label>
    </div>
</div>
<div class="main">
      <!--cards -->
     
        <div class="card">
            <div class="image">
                <a href="admin_category.jsp?aid=<%=aid%>">
                    <img src=images/manage_category.png></a>
            </div>
            <div class="cardtitle">
                <h2 align="center">Manage Category</h2>
            </div>
        </div>
      <div class="card">
            <div class="image">
                <a href="manage_products.jsp?aid=<%=aid%>">
                    <img src=images/manage_product.png></a>
            </div>
            <div class="cardtitle">
                <h2 align="center">Manage Products</h2>
            </div>
        </div>
      <div class="card">
            <div class="image">
                <a href="admin_buyer.jsp?aid=<%=aid%>">
                    <img src=images/view_buyer.jpg></a>
            </div>
            <div class="cardtitle">
                <h2 align="center">View Buyer</h2>
            </div>
        </div>
      <div class="card" style="margin-left:27%;">
            <div class="image">
                <a href="admin_seller.jsp?aid=<%=aid%>">
                    <img src=images/manage_seller.JPG></a>
            </div>
            <div class="cardtitle">
                <h2 align="center">View Seller</h2>
            </div>
        </div>
      <div class="card">
            <div class="image">
                <a href="admin_feedback.jsp?aid=<%=aid%>">
                    <img src=images/manage_feedback.JPG></a>
            </div>
            <div class="cardtitle">
                <h2 align="center">Manage Feedback</h2>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
</div>

    

<!--cards -->
  </body>
</html>
