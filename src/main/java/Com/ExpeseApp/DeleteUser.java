package Com.ExpeseApp;

import java.io.IOException;


import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DelteUser")
public class DeleteUser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String id=req.getParameter("id");
	ExpeseCrudopration crudopration=new ExpeseCrudopration();
	try {
		int delete=crudopration.DeleteUser(id);
		if(delete>0) {
			resp.sendRedirect("UserRegisterHistory.jsp");
		}		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	}

}
