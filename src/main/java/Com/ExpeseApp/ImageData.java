package Com.ExpeseApp;

import java.io.IOException;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/ImageServlet")
public class ImageData extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String id=req.getParameter("id");

	try {
		Connection con=DataBaseConnection.GetConneciton();
		PreparedStatement ps=con.prepareStatement("select userimage from UserDetails where id=?");
		ps.setInt(1, Integer.parseInt(id));
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
			InputStream is=rs.getBinaryStream("userimage");
			OutputStream os=resp.getOutputStream();
			is.transferTo(os);
		}
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
}
}
