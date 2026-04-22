<%@ include file="header.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

.page-container {
	width: 60%;
	margin: 15px auto;
}

.heading-title {
	text-align: center;
	font-size: 26px;
	font-weight: 700;
	margin-bottom: 5px;
	color: #2c3e50;
}

.expense-table-container {
	width: 100%;
	margin-top: 10px;
}

.expense-table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
	border-radius: 20px;
	overflow: hidden;
	font-size: 15px;
}

.expense-table th {
	background: #2c3e50;
	color: #fff;
	padding: 14px 13px;
	letter-spacing: 0.5px;
	text-align: left;
	width: 30%;
}

.expense-table td {
	padding: 14px 13px;
}

.expense-table tr:hover td {
	background: #f7faff;
}

.user-photo {
	height: 75px;
	width: 75px;
	border-radius: 50%;
	border: 2px solid #ddd;
	object-fit: cover;
}

.action-buttons {
	display: flex;
	gap: 20px;
	margin-top: 5px;
}

.btn-custom {
	padding: 8px 16px;
	border-radius: 6px;
	font-weight: 600;
	color: white;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
}

.btn-update {
	background: green;
}

.btn-update:hover {
	background: #1d6fa5;
}

.btn-delete {
	background: #e74c3c;
}

.btn-delete:hover {
	background: #c0392b;
}
</style>

<%
String contact=(String)session.getAttribute("contact");
if(contact==null){
	response.sendRedirect("login.jsp");
	return;
}
%>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	%>

	<div class="page-container">

		<h2 class="heading-title">User Profile/Account</h2>

		<%
		Connection con = DataBaseConnection.GetConneciton();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM UserDetails where ucontact=?");
		ps.setString(1, contact);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			int id = rs.getInt("id");
			String uname = rs.getString("Username");
			String ucontact = rs.getString("ucontact");
			double amount = rs.getDouble("Uamount");
			String date = rs.getString("regidate");
			String upass=rs.getString("upass");
		%>

		<div class="expense-table-container">
			<table class="expense-table">

				<tr>
					<th>User ID</th>
					<td><%=id%></td>
				</tr>

				<tr>
					<th>User Name</th>
					<td> <%=uname%></td>
				</tr>

				<tr>
					<th>User Photo</th>
					<td><img src="ImageServlet?id=<%=id%>" class="user-photo">
					</td>
				</tr>

				<tr>
					<th>Contact No</th>
					<td><%=ucontact%></td>
				</tr>

				<tr>
					<th> Wallet Amount</th>
					<td>₹ <%=amount%></td>
				</tr>

				<tr>
					<th>Register Date</th>
					<td><%=date%></td>
				</tr>
				<tr>
					<th>Account Pin </th>
					<td><%=upass%></td>
				</tr>


				<tr>
					<th>Actions</th>
					<td>
						<div class="action-buttons">
							<a class="btn-custom btn-update"
								href="UpdateUser.jsp?id=<%=rs.getInt("id")%>">Update Account</a> <a
								class="btn-custom btn-delete" href="DelteUser?id=<%=rs.getInt("id")%>">Close Account</a>
						</div>
					</td>
				</tr>

			</table>
		</div>

		<%
		}
		%>

	</div>

<%@ include file="footer.jsp" %>