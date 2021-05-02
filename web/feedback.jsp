<%-- 
    Document   : feedback
    Created on : 3 Mar, 2021, 5:52:14 PM
    Author     : agra
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
        <style>
            *{
                padding: 0px;
                margin: 0px;
                font-family: arial;
            }
            nav{
                height: 135px;
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
    #email{
                    margin-left:5%;
                    width: 250px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    outline: 0;
                    padding: 7px;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }
                textarea{
                    width: 500px;
                    border: 1px solid #ddd;
                    outline: 0;
                    padding: 7px;
                    resize: none;
                    background-color: #fff;
                    box-shadow: inset 1px 1px 5px rgba(0,0,0,0.3);
                }
    .active,.links li:hover{
        background: #555;
        
        
    }
    

        </style>
    </head>
    <body>
        <div class="header">
            <nav>
                <img class="logo" src="images/logo.png">
            </nav>
            
        </div>
        <div class="main"> 
            <div class="title">
                <h1>Feedback Form</h1>
         </div>
            <div class="text">
                <h4>We would love to hear your thoughts,suggestions,concerns or problems with anything so we can improve!</h4><br><br>
                <form name="myform" id="feedback" method="POST" autocomplete="off" onsubmit="return validateform()">
                    <label><b>Feedback Type :</b></label>
                    &emsp;&emsp;<input type="radio" name="type" value="comment"checked/> Comments&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="type" value="suggestion"/> Suggestions&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" name="type" value="question"/> Questions<br><br><br>
                <label><b>Email ID :</b></label>
                <input type="text" name="email" id="email" placeholder="Enter your email id" required>
                <br><br><br>
                <p style="font-size:18px;"><textarea name="comment" rows=5 cols=30 placeholder="Enter Feedback" required></textarea></p><br>
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="reset" name="btn_reset" style="width:25%;padding:10px 50px;background:linear-gradient(to right,rgba(73,264,65,.5),rgba(13,255,245,.4));
                        border:0;outline:none;border-radius:30px">RESET</button>
                <button type="Submit" name="btn_submit" style="width:25%;padding:10px 30px;margin:10px 30px;background:linear-gradient(to right,rgba(73,264,65,.5),rgba(13,255,245,.4));
                        border:0;outline:none;border-radius:30px">SUBMIT</button>
                 </form>
                <script>
                function validateform(){  
var email=document.myform.email.value; 
 if (!(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(myform.email.value)))
  {
      alert("You have entered an invalid email address!");
    return (false);
  }
}  
</script>  
            </div>
        </div>
        
    </body>
</html>
<%
    if(request.getParameter("btn_submit")!=null )
    {
        String type=request.getParameter("type");
        String email=request.getParameter("email");
        String comment=request.getParameter("comment");
        try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        String query1="SELECT * FROM feedback WHERE f_id IN (SELECT MAX(f_id) FROM feedback)";
        ResultSet rs=stmt.executeQuery(query1);
        int fid=0;   
        while(rs.next())
        {
            fid=rs.getInt(1);
        }
        fid=fid+1;
        String query2="INSERT INTO feedback values (?,?,?,?)";
         PreparedStatement pst;
         pst=conn.prepareStatement(query2); 
          pst.setInt(1,fid);
           pst.setString(2,type);
           pst.setString(3,email);
           pst.setString(4,comment);
        int x=pst.executeUpdate();
//        if(x>0)
//            out.println("SUCCESS");
//        else
//            out.println("NOT SUBMITTED");
        conn.close();
        }
        catch(Exception ex)
        {
           out.println(ex); 
        }
    }
    %>