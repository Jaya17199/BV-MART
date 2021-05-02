<%-- 
    Document   : resetpassword
    Created on : 14 Mar, 2021, 12:16:46 AM
    Author     : agra
--%>
  
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import= "java.util.Date;"%>--%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title> 
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
                    padding: 20px;
                    background-color: rgba(0,0,0,0.6);
                    width: 100%;
                    font-size: 18px;
                    border-radius: 10px;
                    border: 1px solid rgba(255,255,255,255);
                    box-shadow: 2px 2px 15px rgba(0,0,0,0.3);
                    color: #fff;
                    margin-top: 40px;
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
                    width: 150px;
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
                    margin-left: 80px;
                   
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
       <%
            String stud=request.getParameter("stud");
            String table=request.getParameter("table");
        %>
    </head>
    <body>
        <div class="main">
    <div class="register">
<!--        <img src="images/logo.png" style= "width:150px; height:150px; border-radius:50%; margin-left: 130px" >-->
                <h2>RESET PASSWORD</h2>
                <form name="myform" onsubmit="return validateform()">
                    
                <label>User-ID : </label>
                <br>
                <input type="text" name="txtid" id="name" value="<%=stud%>" readonly>
                <br><br>
                <label>ROLE : </label>
                <br>
                <input type="text" name="txttable" value="<%=table%>" id="name" readonly>
                <br><br>
                <label>PASSWORD : </label>
                <br>
                <input type="password" name="password" id="name" placeholder="Enter Password" required>
                <br><br>
                <label>CONFIRM PASSWORD : </label>
                <br>
                <input type="password" name="confpass" id="name" placeholder="Re-Enter Password" required>
                <br><br>
                <input type="submit" value="Submit" name="btn_submit" id="submit">
                </form>
                <script>  
function validateform(){  
var password=document.myform.password.value; 
var confp=document.myform.confpass.value; 
    if(password.length<8){  
         alert("Password must be at least 8 characters long.");  
         return false;  
    }  
    if(password.localeCompare(confp))
    {
        alert("Password and confirm password not matched.");  
         return false; 
    }

      
}  
</script>  
    </div>
    </div>
    </body>
</html>

    <%  
            try{
              if(request.getParameter("btn_submit")!=null)
              {
                  String pass=request.getParameter("password");
                  String cpass=request.getParameter("confpass");
                  String sid1=request.getParameter("txtid");
                  String table1=request.getParameter("txttable");
                  
                      if(pass.equals(cpass))
                      {
                           Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                            PreparedStatement ps;
                            String query="";
                             if(table1.equals("seller"))
                                 query="UPDATE seller SET s_pass=? WHERE s_id=?";
                            else if(table1.equals("buyer"))
                                 query="UPDATE buyer SET b_pass=? WHERE b_id=?";
                            else if(table1.equals("admin"))
                                 query="UPDATE admin SET a_pass=? WHERE a_id=?";
                            ps=con.prepareStatement(query);
                             ps.setString(1,pass);
                             ps.setString(2,sid1);
                             int insertResult = ps.executeUpdate();
                             out.println(sid1);                            
                             if (insertResult>0)
                            {
                                if(table1.equals("seller"))
                                {
                                 %>
                                <script>
                                    alert("Password Changed Successfully");
                                    window.location= "login_s.jsp";
                                 </script>
                                 <%
                                  }
                                else if(table1.equals("buyer"))
                                {
                                 %>
                                <script>
                                    alert("Password Changed Successfully");
                                    window.location= "login_b.jsp";
                                 </script>
                                 <%
                                }
                                else if(table1.equals("admin"))
                                {
                                 %>
                                <script>
                                    alert("Password Changed Successfully");
                                    window.location= "login_a.jsp";
                                 </script>
                                 <%
                                  }
                            }
                            else
                            {
                                %>
                                <script>
                                    alert("Error in resetting password!!!Try Again...");
                                    window.location= "resetpassword.jsp?stud=<%=stud%>&table=<%=table%>";
                                 </script>
                                 <%
                            }
                        }

            }}
                  catch(Exception ex){ex.printStackTrace();}   
           %>
                
</html>
