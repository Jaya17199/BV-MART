<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ADD TO FAVOURITES</title>
</head>

<body>
 <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
           
       
<%
    try{
         
        int PID = Integer.parseInt(request.getParameter("pid"));
         int CID = Integer.parseInt(request.getParameter("cid"));
        String BID = request.getParameter("bid");
         
         String query="insert into favourites values('"+BID+"',"+PID+")";
         String query1="select * from favourites where b_id='"+BID+"' and p_id="+PID+"";
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query1);
        boolean datapresent=rs.next();
        if(datapresent)
        {
            %>
            <script>
                alert("Already added to favourites");
                window.location= "b_product.jsp?bid_=<%=BID%>&cid_=<%=CID%>&pageno=<%=1%>";
             </script>
            <%
        }
        else
        {   int i=stmt.executeUpdate(query);
            if(i<0){
                    %>
                    <script>
                        alert("record cannot be updated.Try Again");
                        window.location= "b_product.jsp?bid_=<%=BID%>&cid_=<%=CID%>&pageno=<%=1%>";
                     </script>
                 <%

            }
            else{
                %>
                    <script>
                        alert("Record Added Successfully");
                        window.location= "b_product.jsp?bid_=<%=BID%>&cid_=<%=CID%>&pageno=<%=1%>";
                     </script>
                 <%
        }
    }}
    catch(Exception ex){
                ex.printStackTrace();
            }
        %>
</body>
</html>