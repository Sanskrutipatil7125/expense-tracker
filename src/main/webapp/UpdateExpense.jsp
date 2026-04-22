
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>

<style>
label {
	font-size: 12px;
}
#frm{
margin:0px auto;
text-align:center;
width:250px;
margin-top:7%;
border-radius: 15px; 
border-color: maroon;"
}
</style>
<%
String id = request.getParameter("id");
Connection con = DataBaseConnection.GetConneciton();
PreparedStatement ps = con.prepareStatement("select * from Exphistory where expid=?");
ps.setInt(1, Integer.parseInt(id));
ResultSet rs = ps.executeQuery();
if (rs.next()) {
%>

	<fieldset id="frm" >
		<legend
			style="color: black; font-style: oblique; font-weight: bold; text-align: center;">
			Update Expense </legend>
		<form action="UpdateExpense" method="post"
			style="background-color: white; padding: 10px 10px; width: 300px; text-align: center;">
			<input type="hidden" value="<%=rs.getInt("expid") %>" name="Id">
			

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">Exp
				Amount</label> <input type="text" maxlength="6" required="required"
				placeholder="Enter Amount" value="<%=rs.getDouble("expamount")%>"
				name="amount" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">
				Select Category</label> <select name="Exptype" required="required"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">
				<option selected value="" disabled="disabled"
					style="text-align: center;">----SELECT-----</option>
				<option value="Grocery"
					<%=rs.getString("expcat").equals("Grocery") ? "selected" : ""%>
					style="text-align: center;">Grocery</option>


				<option value="food" <%=rs.getString("expcat").equals("food")?"selected":"" %> style="text-align: center;">Food</option>


				<option value="General"
					<%=rs.getString("expcat").equals("General") ? "selected" : ""%>
					style="text-align: center;">General</option>
				<option value="Other"
					<%=rs.getString("expcat").equals("Other") ? "selected" : ""%>
					style="text-align: center;">Other</option>
			</select> <label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">Exp
				Info </label>
				
			<input type="text"  placeholder="Enter Info About Expense"
				required="required" value="<%=rs.getString("expinfo") %>" multiple="multiple" name="info" maxlength="200"
				style="width: 80%;padding-bottom:30px;padding-top:15px;   padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;"></textarea>

			<input type="submit" value="Update Expense"
				style="background-color: #5563DE; color: white; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; font-size: 12px; width: 60%;">

		</form>

	</fieldset>
	<%
	}
	%>
<%@ include file="footer.jsp"%>