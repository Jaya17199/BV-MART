<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html style="font-size: 16px;">
  <head>
    <title>All Categories</title>
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
     background-repeat: no-repeat;
     background-size: cover;
    margin-bottom:30px;
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
         margin-left: 75px;
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
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
<%
    String bid=request.getParameter("bid");
    String bname="";
    String query="select b_name from buyer where b_id='"+bid+"'";
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    boolean status=rs.next();
    if(status)
    {
        bname=rs.getString(1);
    }
%>
<div class="header_inside">
    <div class="navbar">
        <label>Welcome <%=bname%></label>
    </div>
</div>
<div class="main">
      <!--cards -->
      <%    
        try{
            
           Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM category where c_flag=0";
            ResultSet rst = st.executeQuery(sql);
            int pageno=1;
                while(rst.next()){
                    int cid=rst.getInt(1);
                String cname=rst.getString(2);
                String name = cname.substring(0, 1).toUpperCase() + cname.substring(1);
                String cimage=rst.getString(3);
                
                
                
      %>
     
        <div class="card">
            <div class="image">
                <a href="b_product.jsp?cid_=<%=cid%>&bid_=<%=bid%>&pageno=<%=pageno%>"><img src=<%=cimage%>></a>
            </div>
            <div class="cardtitle">
                <h2 align="center"><%=name%></h2>
            </div>
        </div>
<%
            }
} catch (Exception e) {
        out.println(e);
    }       
%>
<br>
<br>
    </div>       
 <div class="footer">
        <div class="links">
            <ul>
            <li style="float:left;margin-right:550px;position:relative;margin-top: -42px;"><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
    </div>
<!--cards -->

</html>
            