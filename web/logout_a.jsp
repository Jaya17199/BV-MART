<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
function goBack() {
  window.history.back();
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body onload="noBack()">
        <br>
        <br>
        <h1 align="center" style='color:green;'>Thankyou for using BV Mart :)</h1>
        <h3  align="center">We hope you stay safe and healthy through these unusual times!</h3>
        <h3  align="center">Team BV Mart</h3>
        <br>
        <br>
        <h3  align="center">Are you sure you want to logout?</h3>
        <a href="login_a.jsp">
            <input type="submit" style="width:70px; height:50px; margin-left: 40%;" value="Yes" >
            
        </a>
        
         <input onclick="goBack()" type="submit" style="width:70px; height:50px;margin-left: 5%;" value="No" >   
        
    </body>
   
</html>
