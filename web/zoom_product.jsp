<%-- 
    Document   : zoom_product
    Created on : 5 Mar, 2021, 4:41:41 PM
    Author     : agra
--%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
   <style>
            *{
                padding: 0px;
                margin: 0px;
                font-family: arial;
            }
            nav{
                height: 110px;
                background: #2c3e50;
                box-shadow: 0 10px 15px rgba(0,0,0,0.1);
            } 
            .logo{
                float: left;
                width: 120px;
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

        anv i{
            font-size: 1.3em;
            background: black;
            color:white;
            padding:10px 15px;
        }
        hr{
            background:#E1E1E1;
        }
        .preview img{
            position: fixed;
            left: -60px;
        }
        .parameter{
            padding-top:20px;
            text-align: left;
            padding-left: 200px;
        }
        .parameter h6{
            font-size:1.5em;
            font-weight: 440;
            letter-spacing: 3px;
        }
        .parameter h1{
            font-size:2.5em;
            font-weight: 700;
            letter-spacing: 5px;
            margin-top:10px;
        }
         .parameter h5{
            letter-spacing: 2px;
            margin-top:20px;
        }
        .parameter p{
            color:#a8a8a8;
        }
        .parameter h5 span{
            letter-spacing: 0;
            color:black;
            font-size: 1em; 
            margin-right: 10px;
            font-weight: 500;
        }
        .parameter h2{
            font-weight: 700;
            font-size: 3em;
        }
        .parameter h2 span{
            font-weight: 480;
            font-size: 0.8em;
        }
        .cart{
            margin-top: 20px;
        }
        .cart button{
            padding: 15px 20px;
            background: #474747;
            color: white;
            border-radius: 0;
            margin-left: 10px;
        }
        main{
            padding-top: -2%;
            background: #EBEBEB;
        }
        .img-fluid{
            padding-left: 100px;
            padding-top: 5px;
             padding-bottom: 10px;
            width: 500px;
            height: 420px;
        }
    .header_inside {
       width:100%;
       height: 8vh;
       background-color: #000033;
    } 
    label{
        color: white;
        font-size:40px;
        padding-left: 20px;
    }
        </style>
    
    <body>
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
        </div>
        <div class="header_inside">
    <div class="navbar">
        <label style="margin-left:200px;">Welcome<label><%=bname%></label></label>
    </div>
</div>
        <div class="main">               
            <table>
                 <%
            try {
               
               int pid = Integer.parseInt(request.getParameter("pid"));
               int cid = Integer.parseInt(request.getParameter("cid"));
               
               System.out.println(pid);
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM product where p_id="+pid+"";
                ResultSet rst = st.executeQuery(sql);
                String pname,pdesc,pimg,catname="",stname,sid,sname="",saddress="",sphone="";
                int pstatus=0,pcat=0,pprice=0;
                while (rst.next()) {
                    pname = rst.getString(2);
                    pprice=rst.getInt(3);
                    pdesc = rst.getString(4);
                    pimg = rst.getString(5);                    
                    pstatus=rst.getInt(6);
                    pcat=rst.getInt(7);
                    sid=rst.getString(8);
                     if(pstatus==0)
                        {
                            stname="INSTOCK";
                        }
                     else
                         stname="SOLDOUT";
                
                ResultSet rsts=st.executeQuery("select c_name from category where c_id="+pcat+"");
                while(rsts.next()){
                    catname=rsts.getString(1);  }
                
                    ResultSet rsts2=st.executeQuery("select s_name,s_phone,s_address from seller where s_id='"+sid+"'");
                    while(rsts2.next()){
                        sname=rsts2.getString(1); 
                        sphone=rsts2.getString(2); 
                        saddress=rsts2.getString(3); }
                    
         %>  
                <tr height=100% width=100%><td height=420px width=500px>
                    <div class="col-xl-3">
                        <img src=<%=pimg%> class="img-fluid" id="preview" width=500px height=420px alt="image of product"/>
                    </div>
                    </td>
                    <td height=100% width=50%>
                    <div class="col-xl-5">
                        <div class="parameter">
                            <h1 class="display-2"><%=pname%></h1><br>
                            
                                        <h6><b>CATEGORY:</b><%=catname%></h6>
                                    
                                        
                                    
                                <div class="detail">
                                    <h5><b>STATUS:</b><span><b><%=stname%></b></span></h5>
                                <h5><b>DESCRIPTION:</b>
                                    <span><%=pdesc%></span></h5>
                                    <br><hr><br>
                                <h6>Seller's Details</h6>
                                
                                <h5><b>NAME:</b><span><%=sname%></span></h5>
                                <h5><b>PHONE NO.:</b><span><%=sphone%></span></h5>
                                <h5><b>ADDRESS:</b>
                                    <span><%=saddress%></span></h5>
                                </div>
                                <br><hr><br>
                            <div class="price">
                                <h2><span>Rs.</span><%=pprice%></h2>
                            </div>
                            <div class="cart">
                                <div class="row no-gutters">
                                    <div class="col-xl-5"  style="margin-top:-20px;padding-bottom: 35px;padding-top: 5px;">
                                    <form action="SendEmail" method="post">
                                        <input type="hidden" name="pid" value="<%=pid%>" />
                                        <input type="hidden" name="bid" value="<%=bid%>" />
                                        <button class="btn">
                                            <i>CONTACT SELLER</i> 
                                        </button>
                                     </form>
                                        </div>
                                        <div class="col-xl-5" style="margin-top: -120px;margin-left: 200px;margin-bottom: 30px;padding-top: 35px;">
                                     <form action="buyer_favourites.jsp" method="post">
                                        <input type="hidden" name="pid" value="<%=pid%>" />
                                        <input type="hidden" name="bid" value="<%=bid%>" />
                                        <input type="hidden" name="cid" value="<%=cid%>" />
                                        <button class="btn">
                                            <i>ADD TO FAVOURITES</i> 
                                        </button>
                                     </form>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </td>
                </tr>
                <% }
        } catch (Exception e) {
                e.printStackTrace();
            }
%>
            </table>
        </div>
<!--        <div class="footer">
        <div class="links">
            <ul>
            <li style="float:left;margin-right:550px;position:relative;margin-top: -42px;"><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
    </div>-->
    </body>
</html>
