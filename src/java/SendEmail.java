//package com.java;

import java.io.*;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SendEmail", urlPatterns = {"/SendEmail"})
public class SendEmail extends HttpServlet {

    String name, subject, email, msg;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try{
           
        int PID=Integer.parseInt(request.getParameter("pid"));
        String BID=request.getParameter("bid");
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        String PNAME="",SID="",BNAME="",BEMAIL="",BPHONE="",BADDRESS="",SEMAIL="";
        int PPRICE=0,PSTATUS=0;
        String query1="SELECT p_name,p_price,p_status,s_id FROM product WHERE p_id="+PID+"";
        String query2="SELECT * FROM buyer WHERE b_id='"+BID+"'";
        
        ResultSet rs1=stmt.executeQuery(query1);  
        while(rs1.next())
        {
            PNAME=rs1.getString(1);
            PPRICE=rs1.getInt(2);
            PSTATUS=rs1.getInt(3);
            SID=rs1.getString(4);  
        }
         String query3="SELECT s_email FROM seller WHERE s_id='"+SID+"'";
        if(PSTATUS==0)
        {
            ResultSet rs2=stmt.executeQuery(query2);
             while(rs2.next())
            {
                BNAME=rs2.getString(3);
                BEMAIL=rs2.getString(4);
                BPHONE=rs2.getString(5);
                BADDRESS=rs2.getString(6);  
            }
              ResultSet rs3=stmt.executeQuery(query3);
               while(rs3.next())
                {
                    SEMAIL=rs3.getString(1);
                }
             
//             String price=String.valueOf(PPRICE).getClass().getName();
        
        name = BNAME;
        email =SEMAIL;
        subject ="Request to buy "+PNAME;  
        msg ="BUYER'S DETAILS:\nName: "+BNAME+"\nEmail: "+BEMAIL+"\nPhone No.: "+BPHONE+"\nAddress: "+BADDRESS+
                "\n\nPRODUCT DETAILS:\nName: "+PNAME+"\nPrice: "+PPRICE+"\n\n\n\n\nRegards\nTeam BV Mart\n";

        final String username = "bvmart123@gmail.com";//your email id
        final String password = "Banasthali@123";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text =msg;
            textPart.setText(final_Text);
            message.setSubject(subject);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
//            message.setSubject(subject);
            //out.println("Sending");
            Transport.send(message);
            out.println("<center><h1 style='color:green;'>Email Sent Successfully.</h1>");
            out.println("<h2><b>Thank you " + name + " for shopping from BV Mart</b></h2></center>");
        }
        else
        {   out.println("<center><h1 style='color:red;'>Sorry for the inconvenience!!!</h1></center>");
            out.println("<center><h2><b>Product is unavailable.</b></h2></center>");
            
        }}catch (Exception e) {
            out.println(e);
        }
    }

}
