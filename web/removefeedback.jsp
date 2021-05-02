<%-- 
    Document   : removefeedback
    Created on : 11 Mar, 2021, 9:27:33 PM
    Author     : agra
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
//            String fid=request.getParameter("fid");
            int fid=Integer.parseInt(request.getParameter("fid_"));
//             String aid=request.getParameter("aid");
            Class.forName("org.apache.derby.jdbc.ClientDriver");  //register the driver
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");  //create the connection object
            Statement stmt=con.createStatement();
             String query="delete from feedback where f_id="+fid+"";
            int i=stmt.executeUpdate(query);
            if(i>0)
            {
                System.out.println("<script>alert('Record Deleted Successfully!!!!!!')</script>");
                response.sendRedirect("admin_feedback.jsp");
            }
                
            else
                System.out.println("Error in deleting record ");
            

        %>
            
    </body>
</html>

