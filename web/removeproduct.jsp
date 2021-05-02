<%-- 
    Document   : removeproduct
    Created on : 7 Mar, 2021, 7:19:37 PM
    Author     : agra
--%>
<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String bid=request.getParameter("bid");
            int pid=Integer.parseInt(request.getParameter("pid"));
            Class.forName("org.apache.derby.jdbc.ClientDriver");  //register the driver
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");  //create the connection object
            Statement stmt=con.createStatement();
             String query="delete from favourites where p_id="+pid+" and b_id='"+bid+"'";
            int i=stmt.executeUpdate(query);
            if(i>0)
            {
                response.sendRedirect("favourites.jsp?bid="+bid);
            }
                
            else
                System.out.println("Error in deleting record ");
            

        %>
            
    </body>
</html>
