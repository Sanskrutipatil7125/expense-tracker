<%@ include file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.Connection"%>

<style>
 
.username {
	position: fixed;
	top: 70px;
	left: 10px;
	font-weight: bold;
	font-size: 16px;
}

.username1 {
	position: fixed;
	top: 70px;
	right: 10px;
	font-weight: bold;
	font-size: 16px;
}

fieldset {
	border-radius: 15px;
	width: 320px;
	padding: 20px;
	margin:0px auto;
	display: flex;
	margin-top:5%;
	justify-content: center;
	align-items: center;
	
	background: white;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	text-align: center;
}

legend {
	color: black;
	font-weight: bold;
}

label {
	display: block;
	text-align: left;
	font-weight: bold;
	color: #444;
	margin-bottom: 5px;
	font-size: 12px;
}

input[type="text"], select, textarea {
	width: 100%;
	padding: 7px;
	border-radius: 8px;
	border: 1px solid #ccc;
	margin-bottom: 13px;
	outline: none;
	font-size: 13px;
}

textarea {
	resize: none;
	height: 80px;
}

input[type="submit"] {
	background-color: #5563DE;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 12px;
	width: 100%;
	margin-top: 10px;
}

input[type="submit"]:hover {
	background-color: #3c4ed6;
}
</style>
	<%
	String username = (String) session.getAttribute("username");
	String contact = (String) session.getAttribute("contact");
	if (username == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<span class="username">UserName: <%=username%></span>
	<%
	Connection con = DataBaseConnection.GetConneciton();
	PreparedStatement ps = con.prepareStatement("select uamount from userDetails where ucontact=?");
	ps.setString(1, contact);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
	%>
	<span class="username1">Wallet Amount: <%=rs.getDouble("uamount")%></span>
	<%
	}
	%>
	<fieldset>
		<legend>Add Expense</legend>

		<form action="EmpAdding" method="post">

			<label>Exp Amount</label> <input type="text" name="amount"
				maxlength="5" required placeholder="Enter Amount" autocomplete="off">

			<label>Select Category</label> <select name="Exptype" required>
				<option value="" disabled selected>--- SELECT ---</option>
				<option value="Grocery">Grocery</option>
				<option value="food">Food</option>
				<option value="General">General</option>
				<option value="Other">Other</option>
			</select> <label>Exp Info</label>
			<textarea name="info" maxlength="200" required
				placeholder="Enter Info About Expense (max 100 words)"></textarea>

			<input type="submit" value="Add Expense">

		</form>
	</fieldset>

<%@ include file="footer.jsp" %>