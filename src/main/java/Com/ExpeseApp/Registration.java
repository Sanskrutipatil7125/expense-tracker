package Com.ExpeseApp;

import java.io.IOException;


import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UserRegiser")
@MultipartConfig(maxFileSize = 16177215)

public class Registration extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uname = req.getParameter("uname");
		Part uimage = req.getPart("Image");// jpg
		String imagename = uimage.getSubmittedFileName();
		String imagetype = uimage.getContentType(); // jpg/png/
		String Contact = req.getParameter("ucontact");
		String amount = req.getParameter("amount");
		String password = req.getParameter("upass");
		String Date = req.getParameter("regidate");

		double amount1 = 0.0;
		amount1 = Double.parseDouble(amount);

		InputStream inputStream = null;
		PrintWriter pw = resp.getWriter();
		if (imagetype != null) {
			inputStream = uimage.getInputStream(); // byte/binary
		}
		try {
			Connection con = DataBaseConnection.GetConneciton();
			PreparedStatement ps = con.prepareStatement("select ucontact from UserDetails where ucontact=?");
			ps.setString(1, Contact);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				req.setAttribute("message", "User Already Created");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("Registration.jsp");
				requestDispatcher.forward(req, resp);
			} else {
				ps = con.prepareStatement(
						"insert into UserDetails (Username,imagetype,userimage,ucontact,Uamount,upass) values(?,?,?,?,?,?)");
				ps.setString(1, uname);
				ps.setString(2, imagetype);
				ps.setBlob(3, inputStream);
				ps.setString(4, Contact);
				ps.setDouble(5, amount1);
				ps.setString(6, password);
				int save = ps.executeUpdate();
				if (save > 0) {
					resp.sendRedirect("login.jsp?message=Record+Saved+Succesfully");
				} else {
					resp.sendRedirect("Registration.jsp?msg=Record+saved+failed");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}