
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Com.ExpeseApp.ExpeseCrudopration"%>
<%@page import="Com.ExpeseApp.ExpDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>

<%@ include file="header.jsp"%>

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
	font-size: 22px;
	font-weight: bold;
	margin-top: 5px;
	color: #333;
}
</style>

<%
String username = (String) session.getAttribute("username");
int expid = (int) session.getAttribute("id");
if (username == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
Connection con = DataBaseConnection.GetConneciton();
PreparedStatement ps = null;
ResultSet rs = null;
%>
<%
String date = request.getParameter("SearchDate");// 22-11-2025 -> String to sqldate ""/null
%>
<%
if (date != null && !date.isEmpty()) {
	java.sql.Date sqldate = java.sql.Date.valueOf(date);
	ps = con.prepareStatement(
	"select @row :=@row+1 as Srno,e.expid,e.expamount,e.expcat,e.expinfo,e.expdate from  exphistory e Join (select @row:=0)r where userid=? and expdate=? order by e.expid; ");
	ps.setInt(1, expid);
	ps.setDate(2, sqldate);
	rs = ps.executeQuery();

} else {

	ps = con.prepareStatement(
	"select @row :=@row+1 as Srno,e.expid,e.expamount,e.expcat,e.expinfo,e.expdate from  exphistory e Join (select @row:=0)r where userid=? order by e.expid; ");
	ps.setInt(1, expid);
	rs = ps.executeQuery();

}
%>
<div class="page-container">
	<h3 class="heading-title">User Expense Record History</h3>

	<form action="ExpenseHistory.jsp"
		style="display: block; font-weight: bold; margin-bottom: 5px; color: #444;">
		Select Date <input type="date" name="SearchDate" autocomplete="off"
			style="width: 20%; padding: 7px; border-radius: 8px; border: 1px solid #ccc;">
		<input type="submit" value="Search" class="btn-update">
	</form>

	<div class="expense-table-container"
		style="max-height: 400px; border-color:green; overflow-y: scroll;">
		<table class="expense-table">
			<tr>
				<th>Exp.id</th>
				<th>Amount</th>
				<th>Exp Type</th>
				<th>Exp Info</th>
				<th>Exp Date</th>
				<th>Actions</th>
			</tr>

			<%
			while (rs.next()) {
			%>

			<tr>
				<td style="padding: 10px;"><%=rs.getInt("Srno")%></td>

				<td><%=rs.getDouble("expamount")%></td>
				<td><%=rs.getString("expcat")%></td>
				<td><%=rs.getString("expinfo")%></td>
				<td><%=rs.getString("expdate")%></td>
				<td style="float: center;">
					<button class="btn-update">
						<a href="UpdateExpense.jsp?id=<%=rs.getInt("expid")%>"
							style="text-decoration: none; font-weight: bold; color: white;">
							Update </a>
					</button>
					<button class="btn-delete">
						<a href="DeleteExpesnse?id=<%=rs.getInt("expid")%>"
							style="text-decoration: none; font-weight: bold; color: white;">
							Delete </a>
					</button>
				</td>
			</tr>

			<%
			}
			%>

		</table>
	</div>

</div>

<%@ include file="footer.jsp"%>