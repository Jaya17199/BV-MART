<%--
    Document   : viewmyproducts
    Created on : 28 Feb, 2021, 9:40:22 PM
    Author     : agra
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>My products</title>
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
    .main{
     background: #BFBFFF;
     background-repeat: no-repeat;
     background-size: cover;
     padding-bottom: 300px;
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
    .footer {
         padding: 20px;
        text-align: center;
        background-color: #000033;
        color: black;
        height:5vh;
        font-size: 30px;
        position:fixed;
        right: 0;
        left:0;
        bottom:0;
    }
    .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 490px;
            padding-top: 200px;
            
        }
    .btn1:hover{
        background:#8693ab;

    }
    .btn1 {
    background:blue;
    display: inline-block;
    list-style: none;
    position: relative;
    font-size: 20px;
    display: inline-block;
    color: black;
    padding: 20px;
    font-weight: 600;
    text-decoration: none;
    background-color: #9e8fb2 ;
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
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
            <% 
                 String sid=request.getParameter("sid");
                 String sname="";
                 String query="select s_name from seller where s_id='"+sid+"'";
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);
                boolean status=rs.next();
                if(status)
                {
                    sname=rs.getString(1);
                }
                
             %>
        </div>
<div class="header_inside">
    <div class="navbar">
        <label>Welcome <label><%=sname%></label></label>
        <div class="icons">
            <a href="seller_cardpage.jsp?sid=<%=sid%>">
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
                
                String sql1 = "SELECT * FROM category";
                ResultSet rst1 = st1.executeQuery(sql1);
                 
                int ID=0,cid=0,cflag=0;
                int count=0;
                Statement st3 = conn.createStatement();
                ResultSet rst3 = st3.executeQuery("select count(*) from product where s_id='"+sid+"'");
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
                    cflag=rst1.getInt(4);
                     String sql2 = "SELECT p_id,p_name,p_image,p_status FROM product where s_id='"+sid+"'and c_id="+cid+"";
                     ResultSet rst2 = st2.executeQuery(sql2);
                    if(cflag==0)
                    {
                        while (rst2.next()) {
                            ID=rst2.getInt(1);                 //productID
                            String pname = rst2.getString(2);

                            String path = rst2.getString(3);
                            int statuss=rst2.getInt(4);
                            String pro_status;
                            if(statuss==0)
                                pro_status="images/instock3.png";
                            else
                                pro_status="images/soldout3.png";
                   
        %>  
       
            <tr>
                <td align="center"width="20%" style="padding:5px;font-size: 20px"><i><b><%=pname%></b></i></td>
                <td align="center" width="40%" style="padding:5px;"><image src="<%=path%>" width="270px" height="200px"/></td>
                <td align="center" width="25%" style="padding:5px;"><image src="<%=pro_status%>" width="150" height="150"/></td>
                <td align="center" width="15%" style="padding:5px;"><a class="btn1" href="modifydetails.jsp?sid=<%=sid%>&ID=<%=ID%>">EDIT</a></td>
            </tr>
            
            
       
        <%
           }}}
                
            } }catch (Exception e) {
                out.println(e);
            }
        %>
         </table>
           
        </div>
    </div>  
 <div class="footer">
        <div class="links">
            <ul>
            <li style="float:left;margin-right:550px;position:relative;margin-top: -42px;"><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
    </div>
  </body>
</html>