<%-- 
    Document   : registration
    Created on : 3 Mar, 2021, 5:13:28 PM
    Author     : agra
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script>
            
        </script>
            
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body {
                    background-image: url("images/login_bg.jpeg");
                    background-size: cover;
                    background-repeat: no-repeat;
                    font-family: 'Arimo', sans-serif;
                    margin: 0;
                    padding: 0;
                    height: 100%;
                    box-sizing: border-box;
                }
                div.main{
                    width: 400px;
                    margin: 10px auto 10px auto;
                    
                }
                h2{
                   text-align: center;
                   padding: 10px;
                   font-family: sans-serif;
                  
                   
                }
                div.register{
                    background-color: rgba(0,0,0,0.5);
                    width: 100%;
                    font-size: 18px;
                    border-radius: 10px;
                    border: 1px solid rgba(255,255,255,255);
                    box-shadow: 2px 2px 15px rgba(0,0,0,0.3);
                    color: #fff;
                }
                form#register{
                    margin: 40px;
                }
                input#name{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }
                input#submit{
                    width: 200px;
                    padding: 7px;
                    font-size: 16px;
                    font-family: sans-serif;
                    font-weight: 600;
                    border-radius: 3px;
                    background-color: rgba(250,100,0,0.8);
                    color: #fff;
                    cursor: pointer;
                    border: 1px solid rgba(255,255,255,0.3);
                    box-shadow: 1px 1px 5px rgba(0,0,0,0.3);
                    
                   
                }
               textarea{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }

                select{
                    width: 300px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                    font-size: 15px;
                }
                
        
        </style>
        
    </head>
    <body>
    <div class="main">
    <div class="register">
        <img src="images/logo.png" style= "width:150px; height:150px; border-radius:50%; margin-left: 130px" >
                <h2>Register Here</h2>
                <form name="myform" id="register" method="post" onsubmit="return validateform()">
                <label>Name : </label>
                <br>
                <input type="text" name="name" id="name" placeholder="Enter your name" required>
                <br><br>
                <label>Student ID : </label>
                <br>
                <input type="text" name="sid" id="name" placeholder="Enter Smart ID" required>
                <br><br>
                <label>Password : </label>
                <br>
                <input type="password" name="password" id="name" placeholder="Enter password" required>
                <br><br>
                <label>Contact Number : </label>
                <br>
                <input type="text" name="pno" id="name" placeholder="Enter contact number" required>
                <br><br>
                <label>Email ID : </label>
                <br>
                <input type="text" name="email" id="name" placeholder="Enter your email id" required>
                <br><br>
                <label>Address : </label>
                <br>
                <textarea name="address" rows="5" cols="35" id="mytextarea" placeholder="Hostel Name
                                                                         Room number
                                                                         Bed number" required></textarea>
                <br><br>
                <label>Role : </label>
                <br>
                <select name="drprole" class="myselect" required>
                <option disabled selected value>Choose role </option>
		<option value="Seller">Seller</option>
		<option value="Buyer">Buyer</option>
                </select> 
                <br><br>
                <input type="submit" value="Submit" name="submit" id="submit">
                </form>
                <script>  
function validateform(){  
var email=document.myform.email.value; 
var address=document.myform.address.value; 
var password=document.myform.password.value;  
var pno=document.myform.pno.value;  
var sid=document.myform.sid.value;
 if(!(/\b(BTBT)[A-Z][0-9]{5}\b/.test(myform.sid.value)))
  {
      alert("Enter Valid SmartCardID"); 
      return false; 
  }
 if (!(/^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/.test(myform.email.value)))
  {
      alert("You have entered an invalid email address!");
    return (false);
  }
    if(password.length<8){  
         alert("Password must be at least 8 characters long.");  
         return false;  
    }  
  if(!(/^\d{10}$/.test(myform.pno.value))){
        alert("Enter Valid Phone Number");
        return false;
        }
     if(address.length<8){  
         alert("Address must be atleast 10 characters long.");  
         return false;  
    }  
}  
</script>  
    </div>
    </div>
    </body>
</html>
<%
    if(request.getParameter("submit")!=null )
    {
        String n=request.getParameter("name");
        String i=request.getParameter("sid");
        String p=request.getParameter("password");
        String pnoo=request.getParameter("pno");
        String e=request.getParameter("email");
        String a=request.getParameter("address");
        String r=request.getParameter("drprole");
        if(r.equals("Seller"))
        {   
        
        try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        String query1="select s_id from seller where s_id='"+i+"'";
        ResultSet rs=stmt.executeQuery(query1);
        boolean status=rs.next();
        if(!status){
            String query="insert into seller(s_id,s_pass,s_name,s_email,s_phone,s_address)values('"+i+"','"+p+"','"+n+"','"+e+"','"+pnoo+"','"+a+"')";
            int x=stmt.executeUpdate(query);
            if(x>0)
            {
                %>
                <script>
                    alert("Successfully Registered");
                    window.location= "HomeFinal.jsp";
                 </script>
    <!--            response.sendRedirect("seller_cardpage.jsp?sid="+uid);          -->
                <%
            }
            else
            {
                %>
                <script>
                    alert("Error");
                    window.location= "registration.jsp";
                 </script>
    <!--            response.sendRedirect("login_s.jsp");-->
<%
            }
        }
        else
        {
             %>
                <script>
                    alert("Student ID is already registered");
                    window.location= "registration.jsp";
                 </script>
           <%
        }
  }
catch(Exception ex){ex.printStackTrace();}

    }


            
            
            
        else if(r.equals("Buyer"))
        {
            
        try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        String query1="select b_id from buyer where b_id='"+i+"'";
        String query="insert into buyer(b_id,b_pass,b_name,b_email,b_phone,b_address)values('"+i+"','"+p+"','"+n+"','"+e+"','"+pnoo+"','"+a+"')";
        ResultSet rs=stmt.executeQuery(query1);
        boolean status=rs.next();
        if(!status){
            int x=stmt.executeUpdate(query);
            if(x>0)
            {
                %>
                <script>
                    alert("Successfully Registered");
                    window.location= "HomeFinal.jsp";
                 </script>
    <!--            response.sendRedirect("seller_cardpage.jsp?sid="+uid);          -->
                <%
            }
            else
            {
                %>
                <script>
                    alert("Error");
                    window.location= "registration.jsp";
                 </script>
    <!--            response.sendRedirect("login_s.jsp");-->
<%
          }
        }
        else
        {
             %>
                <script>
                    alert("Student ID is already registered");
                    window.location= "registration.jsp";
                 </script>
           <%
        }
  }
catch(Exception ex){ex.printStackTrace();}

    }}
%>
