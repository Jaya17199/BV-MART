<%-- 
    Document   : AboutUs
    Created on : 2 Mar, 2021, 11:36:08 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
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
        left: 32%;
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
    width: 830px;
    }
    .text{
        position: absolute;
        top:40%;
        left:5%;
        right: 40%;
        
    }
    p{
        font-size: 18px;
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
                <div class="icons">
            <a href="HomeFinal.jsp">
                <img class="try" src="images/main.png">
            </a>
            </div>
                
            </nav>
            
        </div>
        <div class="main">
            <div class="title">
                <h1>About Us</h1>
         </div>
            <div class="text">
            <p align="justify">
                BV-Mart is a second-hand goods trading application which facilitates students of Banasthali for buying and selling second-hand goods within
                the college campus.
                A common problem faced by students in Banasthali Vidyapith is getting second hand products
                like books, notes, trunk, cycle, lab coat etc. from other students. They have to find seniors 
                who are willing to sell these products.
A similar problem is faced by the student who want to sell their products as they have to cover
different hostels to make announcements which disturbs the entire hostel due to unavailability of a 
common platform to interact for the same. </p><br>
<p align="justify">BV-Mart resolve these problems by providing user 
friendly experience. With the broad range of product categories and price comparison, students get an 
ease for buying products and could interact with the seller via mail. As well as, seller's product reaches to wide range of students at the same time.
Thus BV-Mart provides a convenient interaction platform which makes the process of buying and selling of products faster and easier for banathalites.</p>    
            
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

