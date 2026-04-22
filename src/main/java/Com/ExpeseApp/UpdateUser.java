package Com.ExpeseApp;

import java.io.IOException;

import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/UpdateUser")
public class UpdateUser extends  HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String uid=req.getParameter("id");
	String uname=req.getParameter("uname");
	String Contact=req.getParameter("ucontact");
	String  amount=req.getParameter("amount");
	String password=req.getParameter("upass");
	
	double amount1=0.0;
	int id=Integer.parseInt(uid);
	amount1=Double.parseDouble(amount);
	
	UserDao ud=new UserDao();
	ud.setId(id);
	ud.setUname(uname);
	ud.setAmount(amount1);
	ud.setPassword(password);
	ud.setContact(Contact);
	ExpeseCrudopration crudopration=new ExpeseCrudopration();
	int update;
	try {
		update = crudopration.updateUser(ud);
		if(update>0) {
			resp.sendRedirect("UserRegisterHistory.jsp");
		}
		else {
			resp.sendRedirect("index.jsp");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
}
