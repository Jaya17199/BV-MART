<%-- 
    Document   : post_product
    Created on : 26 Feb, 2021, 8:26:01 PM
    Author     : agra
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>Post product</title>
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
         height: 430px;
         background: #eecda3;    
         display: inline-block;
         box-shadow: 2px 2px 20px black;
         border-radius: 5px;
         margin-top: 1.6%;
         margin-bottom: 1.5%;
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
 <!--cards -->
        <div class="card">
            <div class="cardtitle">
                <h1 align="center">Product Details</h1>
            </div>
            <div>
                <form name="f1" action="FileUpload" method="POST" enctype="multipart/form-data" class="form" onsubmit="return validateform()">
                    <br>
                    <br>
            <table width='100%' align="center">
                
                <tr>
                    <input type="hidden" name="sid" value="<%=sid%>">
                     <td>Category:</td>
                     
        <%
          
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM category";
            ResultSet rst = st.executeQuery(sql);
            int cflag=0;
        %>
        <td><select name="drpCat" required>
         <option disabled selected value>Choose Category </option>
        <%  while(rst.next()){
                cflag=rst.getInt(4);
                if(cflag==0){
        %>
            <option><%= rst.getString(2)%></option>
        <% }} %>
                        </select></td>
                <tr><td><br></td></tr>
                <tr>
                    <td>Product Title:</td>
                    <td><input type="text" name="txttitle" value="" size="30" required/></td>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="text" name="txtprice" value="" size="30" required/></td>
                
                </tr>
                <tr><td><br></td></tr>
                 <tr>
                     <td>Product Description:</td>
<!--                    <td><input style="height:100px;" type="text" name="txtdesc" value="" required></td>-->
                        <td><textarea name="txtdesc" rows="6" cols="30"></textarea></td>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <td for="img">Select image:</td>
                    <td><input type="file" id="img" name="img" accept="image/*" required> </td>
                </tr>
                 <tr><td><br></td></tr>   
                <tr>
<!--                    <td colspan="3" align='center'><input type="submit" value="Upload" name="btn_upload" /></td>-->
                    <td><button type="submit" name="btn_upload" style="font-size:15px;margin-left:100px;" >Upload</button></td>
<!--                        <td align="right"> <input type="submit" name="btn_upload" value="Upload"/></td>-->
                   
                </tr>
            </table>
            </form>
            <script>  
function validateform(){  
var title=document.f1.txttitle.value; 
var price=document.f1.txtprice.value; 
var desc=document.f1.txtdesc.value;
    if(title.length>50){  
         alert("Product Title must be less than 50 Characters!!");  
         return false;  
    }  
  if(isNaN(price)){
        alert("Product Price must be in digits!!");
        return false;
        }
     if(desc.length>100){  
         alert("Product Description must be less than 100 characters!!");  
         return false;  
    }  
}  
</script> 
            </div>
        </div> 
 
    </div>
    <div class="footer">
        <div class="links">
            <ul>
            <li style="float:left;margin-right:550px;position:relative;margin-top: -42px;"><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>

    </div>
<!--cards -->
  </body>
</html>