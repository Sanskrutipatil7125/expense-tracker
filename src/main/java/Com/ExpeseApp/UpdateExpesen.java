package Com.ExpeseApp;

import java.io.IOException;

import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateExpense")
public class UpdateExpesen extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("Id");
		String amount = req.getParameter("amount");
		String Cat = req.getParameter("Exptype");
		String info = req.getParameter("info");
		int id1=Integer.parseInt(id);
		double amount1 = Double.parseDouble(amount);
		ExpDao dao = new ExpDao();
		dao.setAmount(amount1);
		dao.setCategory(Cat);
		dao.setInfo(info);
		dao.setId(id1);
		ExpeseCrudopration crudopration = new ExpeseCrudopration();	
		int update;
		try {
			update = crudopration.UpdateExpense(dao);
			if(update>0) {
				resp.sendRedirect("ExpenseHistory.jsp");
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