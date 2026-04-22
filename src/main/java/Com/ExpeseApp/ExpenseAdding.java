package Com.ExpeseApp;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmpAdding")
public class ExpenseAdding extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession httpSession = req.getSession();
		String id = (String) httpSession.getAttribute("contact");
		String amount = req.getParameter("amount");
		String ExpCat = req.getParameter("Exptype");
		String info = req.getParameter("info");
		double amount1 = Double.parseDouble(amount);
		try {
			Connection con = DataBaseConnection.GetConneciton();
			PreparedStatement ps = con.prepareStatement("select uamount,id from userdetails where ucontact=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int uid = rs.getInt("id");
				double expamount =rs.getDouble("uamount");

				LocalDate date = LocalDate.now();				
				java.sql.Date sqldate = java.sql.Date.valueOf(date);
				ExpDao exp = new ExpDao(amount1, ExpCat, info, sqldate, uid,expamount);
				if(exp.getAmount()<=exp.getExpamount()) {//27500<500
					ExpeseCrudopration crudopration = new ExpeseCrudopration();
					int save = crudopration.SaveExpense(exp);
					if (save > 0) {
						resp.sendRedirect("ExpenseAddForm.jsp");
					} else {
						resp.sendRedirect("ExpenseAddFrom.jsp");
					}
				}
				else {
					resp.sendRedirect("ExpenseAddForm.jsp");
				}		
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}