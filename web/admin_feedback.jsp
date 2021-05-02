<%-- 
    Document   : admin_feedback
    Created on : 11 Mar, 2021, 9:20:43 PM
    Author     : agra
--%>
<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Feedback</title>
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
    .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 570px;
            padding-top: 230px;
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
    .btn2:hover{
        background:#9e8fb2;

    }
    .btn2 {
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
    background-color:  #8693ab;
    margin-left:20%;
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
                Statement st = con.createStatement();
                
                String sql = "SELECT * FROM feedback";
               
                ResultSet rst = st.executeQuery(sql);
                int fid=0;
                String ftype="",femail="",fdesc="";
                int count=0;
                Statement st1 = con.createStatement();
                ResultSet rst1 = st1.executeQuery("select count(*) from feedback");
		rst1.next();
		count = rst1.getInt(1);
		rst1.close();
                if(count==0){
                    %>
                    <table>
                    <tr>
                        <td class="pro">NO FEEDBACK AVAILABLE</td>
                        </tr></table>
                    <%
                }
                else{
                   %>
                   <div class="card">          
        <table style="width:100%;padding:20px;border-style: groove;" border="5">
            <tr style="height:40px;background-color:#cbb4d4;">
                       
                <th>ID</th>
                <th>FEEDBACK TYPE</th>        
                <th>MAIL ID</th>
                <th>DESCRIPTION</th>
                <th></th>
            </tr>
                    <%
                while (rst.next()) {
                    fid=rst.getInt(1);
                   ftype=rst.getString(2);
                   femail=rst.getString(3);
                   fdesc=rst.getString(4);
                       
        %>  
            <tr>
                <td align="center"width="3%" style="padding:5px;font-size: 20px"><i><b><%=fid%></b></i></td>
                <td align="center"width="5%" style="padding:5px;font-size: 20px"><i><b><%=ftype%></b></i></td>
                <td align="center"width="3%" style="padding:5px;font-size: 20px"><i><b><%=femail%></b></i></td>
                <td align="center"width="15%" style="padding:5px;font-size: 20px"><i><b><%=fdesc%></b></i></td>                
                 <td align="center" width="3%" style="padding:5px;"><a class="btn1" href="removefeedback.jsp?fid_=<%=fid%>" onclick="return confirm('Are you sure?')">REMOVE</a></td>
                 
            </tr>
       
        <% 
           }
                
            } }catch (Exception e) {
                out.println(e);
            }
        %>
       </table>
        </div>
    </div>  
  </body>
</html>

