package Com.ExpeseApp;

import java.io.IOException;


import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteExpesnse")
public class DeleteExpense extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		ExpeseCrudopration crudopration = new ExpeseCrudopration();
		try {
			int delete = crudopration.DeleteExpense(id);
			if (delete > 0) {
				resp.sendRedirect("ExpenseHistory.jsp");
			} else {
				resp.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}