<%-- 
    Document   : About Us
    Created on : 2 Mar, 2021, 12:49:31 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <style>
            *{
                padding: 0px;
                margin: 0px;
                font-family: arial;
            }
            nav{
                height: 135px;
                background: #2c3e50;
                box-shadow: 0 10px 15px rgba(0,0,0,0.1);
            } 
            .logo{
                float: left;
                width: 150px;
                height: auto;
                margin-left:20px;
            }
           
        .title{
        position: absolute;
        top: 30%;
        left: 31%;
        transform: translate(-50%,-50%);
    }
    .title h1{
        color: #000000;
        font-size: 45px;
    }
    .title:after{
    display: block;
    content: " ";
    border-bottom: 3px solid;
    flex: 1 1 auto;
    width: 800px;
    }
        
    .text{
        position: absolute;
        top:40%;
        left:5%;
        
    }
    .active,.links li:hover{
        background: #555;
        
        
    }
    .try{
        width: 80px;
        position: absolute;
        top:40px;
        left:90%;
        cursor: pointer;
        filter: brightness(2);
    }
    .icons a:hover img{   
    filter: brightness(8); 
    }
        </style>
    </head>
    <body>
        <div class="header">
            <nav>
                <img class="logo" src="images/logo.png">
                
            </nav>
            
            <div class="icons">
            <a href="HomeFinal.jsp">
                <img class="try" src="images/main.png">
            </a>
            </div>
            </div>
        </div>
        <div class="main"> 
            <div class="title">
                <h1>Contact Us</h1>
         </div>
            <div class="text">
                <p style="font-size:22px;">For any enquiry and help, contact the following :</p><br><br>
                <p style="font-size:18px;"><b>Mobile:</b> +91-6377668715 | +91-9455225124 | +91-6397338106 | +91-7906694527</p><br>
                <p style="font-size:18px;"><b>Email:</b> btbtc18160_kanishka@banasthali.in</p><br>
                <p style="font-size:18px;">&emsp;&emsp;&emsp;&nbsp;btbtc18064_jaya@banasthali.in</p><br>
                <p style="font-size:18px;"> &emsp;&emsp;&emsp;&nbsp;btbtc18077_kashish@banasthali.in</p><br>
                <p style="font-size:18px;">&emsp;&emsp;&emsp;&nbsp;btbti18027_khushi@banasthali.in</p><br>
                
            </div>
        </div>
       <img name="slide" height="300" width="340" style="margin-left: 70%;margin-top: 8%"/>
		<script>
            var i=0;
            var imag=[];
            var time=1000;
            imag[0]='images/1.jpg';
            imag[1]='images/2.jpg';
            imag[2]='images/3.jpeg';
            imag[3]='images/5.jpg';
            function changeimg(){
                document.slide.src=imag[i];
                if(i<imag.length-1){
                    i++;
                }
                else{
                    i=0;
                }
                setTimeout("changeimg()",time);
            }
            window.onload=changeimg;
        </script>
    </body>
</html>
 
    
