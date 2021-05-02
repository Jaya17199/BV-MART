<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>product</title>
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
/*     background-image: url("images/post_bg.jpg");*/
     background-repeat: no-repeat;
     background-size: cover;
     padding-top:2%;
    }
   
    .header_inside {
       width:100%;
       height: 10vh;
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
        text-align: center;
        background-color: #000033;
        color: black;
        height:5vh;
        font-size: 30px;
    }
    
    .card{
         width: 280px;
         height: 400px;
         background: #C0C0C0;    
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px; 
         margin-left: 75px;
         margin-top: 1.5%;
         position: relative;
         margin-bottom: 1%;
        }

    .image img{
      width: 100%;
      height: 250px;
      border-top-right-radius: 5px;
      border-top-left-radius: 5px;
     }

    .cardtitle{
    padding-left: 10px;
    padding-top: 15px;
    padding-bottom: 10px;
      height: 30px;

     }
     .pro{
            font-size: 30px;
            font-weight: 500;
            padding-left: 490px;
            padding-top: 190px;
            padding-bottom: 200px;
        }

    .addtofav {
  margin: 0;
  position: absolute;
  top: 93%;
  left: 27%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  
}
.cardprice{
    font-size: 20px;
    padding-bottom: 10px;
}
    label{
        color: white;
        font-size:40px;
        padding-left: 20px;
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
    String bid=request.getParameter("bid_");
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
    
    <div class="links1">
        <ul>
            <li ><a href="buyer_cardpage.jsp?bid=<%=bid%>">Category</a></li>
            <li><a href="favourites.jsp?bid=<%=bid%>">Favourites</a></li>
        </ul>
    </div>
    </div>
</div>
    <div class="main">
        
        <% 
            try
            {
                
                int cid=Integer.parseInt(request.getParameter("cid_"));
                int pageNumber = 0;
                int totalNumberOfRecords = 0;
                int recordPerPage = 8;
                int startIndex = 0;
                int numberOfPages = 0;
                String sPageNo = request.getParameter("pageno");
                pageNumber = Integer.parseInt(sPageNo);
                startIndex = (pageNumber * recordPerPage) - recordPerPage + 1;
                
                int pid=0;
                String pname="";
                String pimage="";
                int pprice=0,pstatus=0;
                query="select p_id,p_image,p_name,p_price,p_status from product where c_id="+cid+" order by p_id desc";
                
                int count=0;
                Statement st1 = conn.createStatement();
                ResultSet rst1 = st1.executeQuery("select count(*) from product where c_id="+cid+"");
		rst1.next();
		count = rst1.getInt(1);
		rst1.close();
                if(count==0){
                    %>
                    <table>
                    <tr>
                        <td class="pro">SORRY!! NO PRODUCTS AVAILABLE</td>
                        </tr></table>
                    <%
                }
                else{
                
                ResultSet rst=stmt.executeQuery(query);
                int i = 0;
                while(rst.next())
                {   i++;
                    if(i==startIndex)
                        break;
                   
                }
                i=0;
                do
                {   i++;
                    pid=rst.getInt(1);
                    pimage=rst.getString(2);
                    pname=rst.getString(3);
                    pprice=rst.getInt(4); 
                    pstatus=rst.getInt(5);
                    if(pstatus==0){ 
                    
%>
                    <div class="card">
<!--                        <input type="hidden" name="PID" value="<%=pid%>">-->
                          <div class="image">
                              <a href="zoom_product.jsp?pid=<%=pid%>&bid=<%=bid%>&cid=<%=cid%>"><img src=<%=pimage%>></a>
                          </div>
                          <div class="cardtitle">
                              <h2 align="center"><%=pname%></h2>
                          </div>
                          <div class="cardprice">
                              <h align="center">&emsp;&emsp;&emsp;&emsp;&emsp;Price: <%=pprice%></h>
                          </div>
<!--                          <div class="addtofav">
                              <button type="Submit" name="btn_addfav">Add to favourites</button>
                          </div>-->
                          <form action="buyer_favourites.jsp" method="post">
                            <input type="hidden" name="pid" value="<%=pid%>" />
                             <input type="hidden" name="cid" value="<%=cid%>" />
                            <input type="hidden" name="bid" value="<%=bid%>" />
                            <input type="submit" style="width:150px; height:40px;margin-left:23%;" value="Add to favourites"  />

                          </form>
        </div>
                    
                        
  <% }}while(rst.next()&&i!=recordPerPage);
            rst.close();
            ResultSet rs2 = stmt.executeQuery("select count(*) from product where c_id="+cid+"");
            rs2.next();
            totalNumberOfRecords = rs2.getInt(1);
            rs2.close();
            numberOfPages = totalNumberOfRecords / recordPerPage;
            if(totalNumberOfRecords > numberOfPages * recordPerPage) {
                numberOfPages = numberOfPages + 1;
            }
%>
<br>
<br>
 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
  <%
            int k;
            for(k = 1; k <= numberOfPages; k++) {
%>
            <b><a href="b_product.jsp?cid_=<%=cid%>&bid_=<%=bid%>&pageno=<%=k%>"><%=k%></a>
                &nbsp;&nbsp;&nbsp;&nbsp;</b>

<%
            }
}} catch (Exception e) {
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