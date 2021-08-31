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

@WebServlet("/register") //Servlet Annotation Configuration

public class RegisterServlet extends HttpServlet{

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		PrintWriter out = res.getWriter();
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		int age = Integer.parseInt(req.getParameter("age"));
		double height = Double.parseDouble(req.getParameter("height"));
		double weight = Double.parseDouble(req.getParameter("weight"));
		int id = Integer.parseInt(req.getParameter("id"));
		String blood_group = req.getParameter("bloodgroup");
		
        String url="jdbc:mysql://localhost:3306/PBL";
        String username = "root";
        String password = "";
        String query = "INSERT INTO tb_people(name,email_id,phone_number,age,height,weight,blood_camp_id,bloodgroup) VALUES(?,?,?,?,?,?,?,?)";
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(url,username,password);
        	PreparedStatement statement = con.prepareStatement(query);
        	statement.setString(1, name);
        	statement.setString(2, email);
        	statement.setString(3, phone);
        	statement.setInt(4, age);
        	statement.setDouble(5, height);
        	statement.setDouble(6, weight);
        	statement.setInt(7, id);
        	statement.setString(8, blood_group);

        	statement.executeUpdate();
        }        
		catch(Exception e) {
			e.printStackTrace();
		}
        RequestDispatcher rd = req.getRequestDispatcher("sendmail");
        rd.forward(req,res);
	}
}