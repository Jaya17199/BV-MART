<%-- 
    Document   : removecategory
    Created on : 10 Mar, 2021, 7:14:43 PM
    Author     : agra
--%>

<%@page import="java.sql.DriverManager,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            
            try{
                 
            int cid=Integer.parseInt(request.getParameter("cid_"));
            int cflag=Integer.parseInt(request.getParameter("cflag"));
            String aid=request.getParameter("aid");
            Class.forName("org.apache.derby.jdbc.ClientDriver");  //register the driver
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");  //create the connection object
        
//             Statement st1 = con.createStatement();
//             Statement st2 = con.createStatement();
//             Statement st3 = con.createStatement();
//             Statement st4 = con.createStatement();
//             String query1="select p_id from product where c_id="+cid+"";
//             int pid=0;
//             
//             ResultSet rst = st1.executeQuery(query1);
//             while(rst.next())
//             {
//                 pid=rst.getInt(1);
//                 String query2="delete from favourites where p_id="+pid+"";
//                 int i=st2.executeUpdate(query2);
//                 if(i>0)
//                 {
//                     
//                 }
//                 
//             }
//             
//             String query3="delete from product where c_id="+cid+"";
//                 int j=st3.executeUpdate(query3);
//                       
//            if(j>0)
//            {
//               
////                    response.sendRedirect("favourites.jsp?bid="+bid);
//            }
//           
//            String query4="delete from category where c_id="+cid+"";
//            int k=st4.executeUpdate(query4);
//            if(k>0)
//            {
//                response.sendRedirect("admin_category.jsp");
////                    response.sendRedirect("favourites.jsp?bid="+bid);
//            }   
//            else
//                 out.println("<script>alert('Error in Deleting Record')</script>");
//            
            PreparedStatement ps;
       
          ps= con.prepareStatement("UPDATE category SET c_flag=? WHERE c_id=?");
          if(cflag==0)
                ps.setInt(1,1);
          else
              ps.setInt(1,0);
          ps.setInt(2,cid);
          int insertResult = ps.executeUpdate();
            if (insertResult>0)
            {
		 %>
            <script>
                alert("Status Modified Successfully!!!");
                window.location= "admin_category.jsp?aid=<%=aid%>";
             </script>
            <%
        }
        else
        {
            %>
            <script>
                alert("Error!!!");
                window.location= "admin_category.jsp?aid=<%=aid%>";
             </script>
<%
        }}
            
            catch (Exception e) {
                out.println(e);
            }

        %>
            
    </body>
</html>
