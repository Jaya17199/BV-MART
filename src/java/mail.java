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

@WebServlet(name = "mail", urlPatterns = {"/mail"})
public class mail extends HttpServlet {

    String subject,msg;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try{
           
        
        String table=request.getParameter("table");
        String ID=request.getParameter("txtid");
        String mail=request.getParameter("txtemail");
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        String query1="",stud="";
        if(table.equals("seller"))
            query1="SELECT * FROM seller WHERE s_id='"+ID+"' and s_email='"+mail+"'"; 
        else if(table.equals("buyer"))
            query1="SELECT * FROM buyer WHERE b_id='"+ID+"' and b_email='"+mail+"'";
        else if(table.equals("admin"))
            query1="SELECT * FROM admin WHERE a_id='"+ID+"' and a_email='"+mail+"'";
        ResultSet rs1=stmt.executeQuery(query1);  
        boolean status=rs1.next();
        if(status)
        {
            stud=rs1.getString(1);
            subject="Reset Password";
            msg="Reset Password Link:\n http://localhost:8080/bv-mart/resetpassword.jsp?stud="+ID+"&table="+table;

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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
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
            out.println("<h2><b>Check your email to Reset your Password</b></h2></center>");
        }
        else
        {   out.println("<center><h1 style='color:red;'>ID and Email ID not matched!!!</h1></center>");
            out.println("<center><h2><b>Try Again!!!</b></h2></center>");
            
        }}catch (Exception e) {
            out.println(e);
        }
    }

}
