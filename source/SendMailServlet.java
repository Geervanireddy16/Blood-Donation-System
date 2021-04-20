package com.geervani;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@WebServlet("/sendmail") //Annotation

public class SendMailServlet extends HttpServlet{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		String email = req.getParameter("email");
		String name = req.getParameter("name");
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        // Get a Properties object
           Properties props = System.getProperties();
           props.setProperty("mail.smtp.host", "smtp.gmail.com"); // Setting up mail server 
           props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
           props.setProperty("mail.smtp.socketFactory.fallback", "false");
           props.setProperty("mail.smtp.port", "465");
           props.setProperty("mail.smtp.socketFactory.port", "465");
           props.put("mail.smtp.auth", "true");
           props.put("mail.debug", "true");
           props.put("mail.store.protocol", "pop3");
           props.put("mail.transport.protocol", "smtp");
           final String username1 = "blooddonationapplicationpbl@gmail.com"; // emailid of Sender
           final String password1 = "blooddonation@123";  //senders password
           try{ // creating session object to get properties 
             Session session = Session.getInstance(props, 
                                 new Authenticator(){
                                    protected PasswordAuthentication getPasswordAuthentication() {
                                       return new PasswordAuthentication(username1, password1);
                                    }});

             Message msg = new MimeMessage(session); // MimeMessage object

             msg.setFrom(new InternetAddress("blooddonationapplicationpbl@gmail.com")); // Adding senders email to from field.
             msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email,false)); // Adding recipient's email to from field.
             msg.setSubject("Successfully Registered to Donate Blood"); // Set subject of the email 
             msg.setText("Thank you "+name+" for registering to donate blood !!"); // set body of the email 
             msg.setSentDate(new Date());
             Transport.send(msg);// Send email
             System.out.println("Mail Sent Successfully");
           }catch (MessagingException e){ 
             System.out.println("Exception: " + e);
           }
           
           RequestDispatcher rd = req.getRequestDispatcher("thankyou.jsp");
           rd.forward(req,res);
         }
    }



