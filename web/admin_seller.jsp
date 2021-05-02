<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>View All Seller</title>
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
    font-size: 23px;
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
     font-family: arial;
    }
   .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 450px;
            padding-top: 150px;
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
         margin-top: 10%;
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
   .circle{
        width: 170px;
        margin-top:-32%;
        margin-left:79%;
        height: 100px;
        background: linear-gradient(to right, #66ffff 0%, #00ccff 100%);
/*        margin:  auto;*/
        border-radius: 50%;
        top:20%;
        position: relative;
    }
    .content{
        position: absolute;
        width:inherit;
        height: auto;
        top:35%;
        transform:translate(-50%);
        text-align: center;
        padding-left: 94%;
        font-size: 20px;
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
        <% int scount=0; %>
        
<%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                Statement st = con.createStatement();
                
                String sql = "SELECT * FROM seller";
                ResultSet rst = st.executeQuery(sql);
                String sid="",sname="",semail="",sphone="",saddress="";
                int count=0;
                Statement st1 = con.createStatement();
                ResultSet rst1 = st1.executeQuery("select count(*) from seller");
		rst1.next();
		count = rst1.getInt(1);
		rst1.close();
                if(count==0){
                    %>
                    <table>
                    <tr>
                        <td class="pro">NO REGISTERED SELLER</td>
                        </tr></table>
                    <%
                }
                else{
                   %>
                   <div class="card">    
            
        <table style="width:100%;padding:20px;border-style: groove;" border="5">
            <tr style="height:40px;background-color:#cbb4d4;">
                       
                <th>ID</th>
<!--                <th>PASSWORD</th>        -->
                <th>NAME</th>
                <th>EMAIL ID</th>
                <th>PHONE NO.</th>
                <th>ADDRESS</th>
                
            </tr>
                    <%
                while (rst.next()) 
                {
                    sid=rst.getString(1);
                    sname=rst.getString(3);
                    semail=rst.getString(4);
                    sphone=rst.getString(5);
                    saddress=rst.getString(6);
                    scount++; 
        %>   
        
            <tr>
                <td align="center"width="10%" style="padding:5px;font-size: 18px"><i><b><%=sid%></b></i></td>
                <td align="center"width="10%" style="padding:5px;font-size: 18px"><i><b><%=sname%></b></i></td>
                <td align="center"width="10%" style="padding:5px;font-size: 18px"><i><b><%=semail%></b></i></td>
                <td align="center"width="10%" style="padding:5px;font-size: 18px"><i><b><%=sphone%></b></i></td> 
                <td align="center"width="10%" style="padding:5px;font-size: 18px"><i><b><%=saddress%></b></i></td> 
                 
            </tr>
       
        <% 
           }
                
            } }catch (Exception e) {
                out.println(e);
            }
        %>
       </table>
        
        </div>
       <div class="circle">
            <div class="content">
                <p style="color:black;"><b>Total Sellers: <%out.println(scount); %></b></p>  

            </div>
        </div>
    </div>  

<!--cards -->
  </body>
</html>

