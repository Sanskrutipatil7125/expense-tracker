package Com.ExpeseApp;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginUser")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		String upass = req.getParameter("upass");
		try {
			Connection con = DataBaseConnection.GetConneciton();
			PreparedStatement ps= con.prepareStatement("select id,username,upass,ucontact from userDetails where username=? and upass=?");
			ps.setString(1, userid);
			ps.setString(2, upass);
			ResultSet rs=ps.executeQuery();

			if (rs.next()) {
				HttpSession httpSession = req.getSession();
				 httpSession.setMaxInactiveInterval(30 * 60);  
				 
				httpSession.setAttribute("id", rs.getInt("id"));
				httpSession.setAttribute("username", rs.getString("username"));
				httpSession.setAttribute("contact", rs.getString("ucontact"));
			
				resp.sendRedirect("UserIndex.jsp?message=Login+Succesfully");
			} else {
				resp.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}