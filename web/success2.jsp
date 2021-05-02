<%-- 
    Document   : success2
    Created on : 13 Mar, 2021, 8:12:14 PM
    Author     : agra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String aid=request.getParameter("aid");
     %>
       <script>
                alert("Record Inserted Successfully");
                window.location= "admin_category.jsp?aid=<%=aid%>";
             </script>
</html>
