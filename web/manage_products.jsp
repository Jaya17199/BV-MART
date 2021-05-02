<%-- 
    Document   : manage_products
    Created on : 10 Mar, 2021, 6:22:59 PM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Manage Product</title>
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
    .active,.links li:hover{
        background: #555;  
    }
    .links1{
        float: right;
        margin-right: 100px;
        margin-top:10px;
     
    }
    .links1 li {
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 20px;
    }
    .links1 li a{
    display: inline-block;
    color: #fff;
    padding: 15px;
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
         width: 70%;
         height: 80%;
         background: #E9E9E9;
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px; 
         margin-top: 2.25%;
         margin-left: 15%;
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

    .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 500px;
            padding-top: 220px;
        }
    .btn1 {
    background:#D61E29 ;
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 20px;
    display: inline-block;
    color: white;
    padding: 10px;
    text-decoration: none;
    font-weight: 600;


    }
    .btn1:hover{
        background:darkred;
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
         <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
                String sql1 = "SELECT c_id,c_flag FROM category";
                
                ResultSet rst1 = st1.executeQuery(sql1);
                
                String pro_status="";
                String pimage="";
                String pname="";
                int pid=0,cid=0,cflag=0;
                int count=0;
                Statement st3 = con.createStatement();
                ResultSet rst3 = st3.executeQuery("select count(*) from product p INNER JOIN category c ON p.c_id=c.c_id and c.c_flag=0");
		rst3.next();
		count = rst3.getInt(1);
		rst3.close();
                if(count==0){
                    %>
                    <table>
                    <tr>
                        <td class="pro">SORRY!! NO PRODUCTS AVAILABLE</td>
                        </tr></table>
                    <%
                }
                else{
                   %>
                   <div class="card">
                    <table style="width:100%;padding:20px;border-style: groove;" border="5">
                    <%
                while(rst1.next())
                {
                    cid=rst1.getInt(1);
                    cflag=rst1.getInt(2);
                    String sql2 = "SELECT p_id,p_name,p_image,p_status FROM product WHERE c_id="+cid+"";
                    ResultSet rst2 = st2.executeQuery(sql2);
                    if(cflag==0)
                    {
                        while (rst2.next()) {
                            pname=rst2.getString(2);              //productID
                            pimage = rst2.getString(3);
                                    int statuss=rst2.getInt(4);
                                    pid=rst2.getInt(1);
                                    if(statuss==0)
                                        pro_status="images/instock3.png";
                                    else
                                        pro_status="images/soldout3.png";
                       
        %>  
            <tr>
               <td align="center"width="20%" style="padding:5px;font-size: 20px"><i><b><%=pname%></b></i></td>
                <td align="center" width="40%" style="padding:5px;"><a href="zoom_product2.jsp?pid=<%=pid%>"><img src="<%=pimage%>" width="200px" height="150px"/></a></td>
                 <td align="center" width="20%" style="padding:5px;"><image src="<%=pro_status%>" width="100px" height="100px" /></td>
                 <td align="center" width="10%" style="padding:5px;"><a class="btn1" href="removeproduct_a.jsp?pid=<%=pid%>&aid=<%=aid%>" onclick="return confirm('Are you sure?')">REMOVE</a></td>
            </tr>
       
        <% 
           }}}}
                
            } catch (Exception e) {
                out.println(e);
            }
        %>
       </table>
        
        </div>
    </div>  

<!--cards -->
  </body>
</html>
