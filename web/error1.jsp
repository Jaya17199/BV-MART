<%-- 
    Document   : error1
    Created on : 12 Mar, 2021, 11:21:05 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
            String sid=request.getParameter("sid");
        %>
       <script>
                alert("ERROR!! TRY AGAIN");
                window.location= "post_product.jsp?sid=<%=sid%>";
             </script>
</html>
