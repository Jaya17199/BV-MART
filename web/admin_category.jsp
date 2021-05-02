<%-- 
    Document   : admin_category
    Created on : 10 Mar, 2021, 6:35:25 PM
    Author     : agra
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Categories</title>
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
    .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 450px;
            padding-top: 150px;
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
    .active,.links li:hover{
        background: #555;  
    }
    .links1{
        float: right;
        margin-right: 100px;
        margin-top:8px;
     
    }
    .links1 li {
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 23px;
    }
    .links1 li a{
    display: inline-block;
    color: #fff;
    padding: 10px;
    text-decoration: none;
    
    }
    .links1 li:hover{
    background: #555;
    }
    .main{
/*     background-image: url("images/post_bg.jpg");*/
     background: #BFBFFF;
     background-repeat: no-repeat;
     background-size: cover;
     padding-bottom: 70px;
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
    .card{
         width: 80%;
         height: 80%;
         background: #E9E9E9;
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px; 
         margin-top: 2.25%;
         margin-left: 10%;
         margin-bottom: 2.25%; 
        }

    .image img{
      width: 100%;
      height: 250px;
      border-top-right-radius: 5px;
      border-top-left-radius: 5px;
     }


    .navi {
        align: center;
    }
    label{
        color: white;
        font-size:40px;
        padding-left: 20px;
    }

    
    .btn1 {
    background:#D61E29 ;
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 20px;
    display: inline-block;
    color: white;
    padding: 20px;
    text-decoration: none;
    font-weight: 600;


    }
    .btn1:hover{
        background:darkred;
    }
    .btn2 {
    background:#4cbb17 ;
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 20px;
    display: inline-block;
    color: white;
    padding: 20px;
    text-decoration: none;
    font-weight: 600;


    }
    .btn2:hover{
        background:darkgreen;
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
<body style=" background: #BFBFFF;">
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
        <label></label>
            <% 
                 String aid=request.getParameter("aid");               
             %>
   <div class="icons">
            <a href="admin_cardpage.jsp?aid=<%=aid%>">
                <img class="try" src="images/main.png">
            </a>
        </div>
    <div class="links1">
        <ul>
            <li ><a href="add_category.jsp?aid=<%=aid%>">Add Category</a></li>
        </ul>
        </div>
         </div>
</div>  
    <div class="main">
         <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
                
                String sql1 = "SELECT c_id,c_name,c_image,c_flag FROM category";
               
                ResultSet rst = st.executeQuery(sql1);
                int cid=0,cflag=0,p=0;
                String cname="";
                String cimage="";
                int count=0;
                Statement st2 = con.createStatement();
                ResultSet rst3 = st2.executeQuery("select count(*) from category");
		rst3.next();
		count = rst3.getInt(1);
		rst3.close();
                if(count==0){
                    %>
                    <table>
                    <tr>
                        <td class="pro">NO CATEGORIES AVAILABLE</td>
                        </tr></table>
                    <%
                }
                else{
                   %>
                    <div class="card">
           
        <table style="width:100%;padding:20px;border-style: groove;" border="5">
                    <%
                while (rst.next()) {
                    cid=rst.getInt(1);
                   cname=rst.getString(2);
                   cimage=rst.getString(3);
                   cflag=rst.getInt(4);
                   String sql2 = "SELECT p_id FROM product WHERE c_id="+cid+"";
                   ResultSet rst2 = st1.executeQuery(sql2);
                   p=0;
                   if(rst2.next())
                        p=1;
                   else
                        p=0;
                       
        %>  
            <tr>
                <td align="center"width="12%" style="padding:5px;font-size: 20px"><i><b><%=cname%></b></i></td>
                <td align="center" width="30%" style="padding:5px;"><img src="<%=cimage%>" width="270px" height="200px"/></td>
                 <%
                     if(cflag==0)
                     {
                         if(p==1)
                         {
                 %>
                    <td align="center" width="15%" style="padding:5px;"><a class="btn1" href="removecategory.jsp?cid_=<%=cid%>&cflag=<%=cflag%>&aid=<%=aid%>" onclick="return confirm('Products are available!!!Are You Sure you want to disable this category?')">DISABLE</a></td>
                 <%
                        }
                        else
                       {
                 %>
                        <td align="center" width="15%" style="padding:5px;"><a class="btn1" href="removecategory.jsp?cid_=<%=cid%>&cflag=<%=cflag%>&aid=<%=aid%>">DISABLE</a></td>
                        <%
                       }
                    }
                     else
                    {
                 %>
                    <td align="center" width="15%" style="padding:5px;"><a class="btn2" href="removecategory.jsp?cid_=<%=cid%>&cflag=<%=cflag%>&aid=<%=aid%>" onclick="return confirm('Are you sure?')">ENABLE</a></td>   
                    <%
                     }
                     %>
                 
            </tr>
       
        <% 
           }
                
            }} catch (Exception e) {
                out.println(e);
            }
        %>
       </table>
        
        </div>
    </div>  

<!--cards -->
  </body>
</html>
