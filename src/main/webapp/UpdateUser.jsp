
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.ExpeseApp.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
label {
	font-size: 12px;
}
</style>
<%
String userid=request.getParameter("id");
Connection con=DataBaseConnection.GetConneciton();
PreparedStatement ps=con.prepareStatement("select * from userDetails where id=?");
ps.setInt(1, Integer.parseInt(userid));
ResultSet rs=ps.executeQuery();
if(rs.next()){
	
%>
<body
	style="font-family: Arial, sans-serif; margin: 0; padding: 0; height: 80vh; display: flex; align-items: center; justify-content: center;">
	<fieldset style="border-radius: 10px;">
		<legend
			style="color: black; font-style: oblique; font-weight: bold; text-align: center;">
			Update User </legend>

		<form action="UpdateUser" method="post" 
			style="background-color: white; padding: 10px 10px; width: 350px; text-align: center;">
			<input type="hidden" value="<%=rs.getInt("id")%>" name="id">

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">UserName</label>
			<input type="text" value="<%=rs.getString("Username") %>" maxlength="100" required="required"
				placeholder="Full Name" name="uname" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

<%-- 			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">
				Select Photo</label> <input type="file" value="<%=rs.getBlob("userimage")%>" required="required"
				placeholder="Person Photo" name="Image" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

			</label> 
 --%>
 <%-- 				<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">
				Previous Image </label> <img  src="ImageServlet?id=<%=rs.getInt("id") %>" 
				style="height:70px; width:100px; border-radius:40%;   border: 1px solid #ccc; ">
			</label> 
 --%>			
			
			<br> <label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">User
				Contact</label> <input type="text" value="<%=rs.getString("ucontact") %>" name="ucontact" maxlength="10"
				required="required" placeholder="Enter Mobile" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">
				Wallet Amount</label> <input type="text"  value="<%=rs.getDouble("Uamount") %>" name="amount" maxlength="6"
				required="required" placeholder="Amount" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">User
				Password</label> <input type="text" value="<%=rs.getString("upass") %>" name="upass" maxlength="6"
				required="required" placeholder="Enter Password" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">

			<input type="submit" value="Update User"
				style="background-color: #5563DE; color: white; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; font-size: 12px; width: 60%;">

		</form>
		<%
}
		%>
	</fieldset>
</body>
</html>