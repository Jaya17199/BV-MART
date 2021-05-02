<%-- 
    Document   : success1
    Created on : 12 Mar, 2021, 11:20:50 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%
            String sid=request.getParameter("sid");
        %>
       <script>
                alert("Record Inserted Successfully");
                window.location= "seller_cardpage.jsp?sid=<%=sid%>";
             </script>
</html>
