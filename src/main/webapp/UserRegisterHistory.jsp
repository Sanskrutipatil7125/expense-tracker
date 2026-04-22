<%@ include file="header.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>

<style>

.page-container {
	width: 95%;
	margin: 30px auto;
}

.expense-table-container {
	width: 100%;
	margin-top: 10px;
}

.expense-table {
	text-align: center;
	width: 100%;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
	font-size: 14px;
	background: #fff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	border-radius: 6px;
	overflow: auto;
}

.expense-table th {
	background-color: #2c3e50;
	color: #fff;
	padding: 14px 12px;
	text-align: center;
}

.btn-update, .btn-delete {
	padding: 6px 12px;
	border: none;
	border-radius: 4px;
	color: #fff;
	cursor: pointer;
	margin-right: 5px;
	font-size: 13px;
}

.btn-update {
	background-color: #3498db;
}

.btn-update:hover {
	background-color: #217dbb;
}

.btn-delete {
	background-color: #e74c3c;
}

.btn-delete:hover {
	background-color: #c0392b;
}

.heading-title {
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	color: #333;
}
</style>
	<h5 class="heading-title">User Registration History</h5>

	<div class="page-container">
		<div class="expense-table-container"
			style="max-height: 400px; overflow-y: scroll;">
			<table class="expense-table">
				<tr>
					<th>id</th>
					<th>User Name</th>
					<th>User Photo</th>
					<th>User Contact</th>
					<th>User Amount</th>
					<th>User Regi. Date</th>
				</tr>

				<%
				Connection con = DataBaseConnection.GetConneciton();
				PreparedStatement ps = con.prepareStatement("select * from UserDetails");
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					int id = rs.getInt("id");
					String uname = rs.getString("Username");
					String contact = rs.getString("ucontact");
					double amount = rs.getDouble("Uamount");
					String date = rs.getString("regidate");
				%>

				<tr
					style="text-align: center; font-weight: bold; font-style: sans-serif;">
					<td><%=id%></td>
					<td><%=uname%></td>
					<td><img src="ImageServlet?id=<%=id%>"
						style="height: 40px; width: 40px; border-radius: 40%;"></td>
					<td><%=contact%></td>
					<td><%=amount%></td>
					<td><%=date%></td>
				</tr>

				<%
				}
				%>

			</table>
		</div>
	</div>
<%@ include file="footer.jsp" %>