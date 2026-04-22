package Com.ExpeseApp;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ExpeseCrudopration {
	public int SaveExpense(ExpDao dao) throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps=con.prepareStatement("update userDetails set uamount=uamount-? where id=?");
		ps.setDouble(1, dao.getAmount());
		ps.setInt(2, dao.getId());
		ps.executeUpdate();
		ps = con.prepareStatement("insert into Exphistory (expamount,expcat,expinfo,expdate,userid) values(?,?,?,?,?)");
		ps.setDouble(1, dao.getAmount());
		ps.setString(2, dao.getCategory());
		ps.setString(3, dao.getInfo());
		ps.setDate(4, dao.getToday());
		ps.setInt(5, dao.getId());		
		return ps.executeUpdate();
	}

	public int UpdateExpense(ExpDao dao) throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps = con
				.prepareStatement("update  Exphistory set expamount=?,expcat=?,expinfo=? where expid=?");
		ps.setDouble(1, dao.getAmount());
		ps.setString(2, dao.getCategory());
		ps.setString(3, dao.getInfo());
		ps.setInt(4, dao.getId());
		return ps.executeUpdate();
	}

	public int DeleteExpense(String id) throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps = con.prepareStatement("delete from Exphistory where expid=?");
		ps.setInt(1, (Integer.parseInt(id)));
		return ps.executeUpdate();
	}

	public int updateUser(UserDao ud) throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps = con
				.prepareStatement("update userDetails set username=?,ucontact=?,uamount=?,upass=? where id=?");
		ps.setString(1, ud.getUname());
		ps.setString(2, ud.getContact());
		ps.setDouble(3, ud.getAmount());
		ps.setString(4, ud.getPassword());
		ps.setInt(5, ud.getId());
		return ps.executeUpdate();
	}

	public int DeleteUser(String id) throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps = con.prepareStatement("delete from userDetails where id=?");
		ps.setInt(1, Integer.parseInt(id));
		return ps.executeUpdate();
	}
}