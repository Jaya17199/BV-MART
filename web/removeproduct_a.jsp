<%-- 
    Document   : removeproduct_a
    Created on : 10 Mar, 2021, 6:43:16 PM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            
            int pid=Integer.parseInt(request.getParameter("pid"));
             String aid=request.getParameter("aid");
            Class.forName("org.apache.derby.jdbc.ClientDriver");  //register the driver
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");  //create the connection object
            Statement stmt=con.createStatement();
            Statement stmt1=con.createStatement();
            Statement stmt2=con.createStatement();
            
             String query1="select p_id from product where p_id="+pid+"";
             
             ResultSet rst = stmt.executeQuery(query1);
             while(rst.next())
             {
                 pid=rst.getInt(1);
                 String query2="delete from favourites where p_id="+pid+"";
                 int i=stmt1.executeUpdate(query2);
                 if(i>0)
                 {
                     
                 }
                 
             }
             
             String query3="delete from product where p_id="+pid+"";
            int i=stmt.executeUpdate(query3);
            if(i>0)
            {
                response.sendRedirect("manage_products.jsp?aid="+aid);
            }
                
            else
                System.out.println("Error in deleting record ");
            

        %>
            
    </body>
</html>
