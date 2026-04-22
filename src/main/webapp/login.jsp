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
String msg = request.getParameter("message");
if (msg != null) {
%>
<script>
        alert("<%=msg%>
	");
</script>
<%
}
%>

<body
	style="font-family: Arial, sans-serif; margin: 0; padding: 0; height: 80vh; display: flex; align-items: center; justify-content: center;">
	<fieldset style="border-radius: 10px;">
		<legend style="color: black; font-style: oblique; font-weight: bold;">Login
		</legend>

		<form action="LoginUser" method="post"
			style="background-color: white; padding: 10px 10px; width: 300px; text-align: center;">

			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">User
				Id</label> <input type="text" maxlength="50" name="userid"
				required="required" placeholder="Enter Userid" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">
			<label
				style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">User
				Password</label> <input type="password" name="upass" maxlength="6"
				required="required" placeholder="Enter Password" autocomplete="off"
				style="width: 80%; padding: 7px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 13px; outline: none; font-size: 13px;">


			<input type="submit" value="Login"
				style="background-color: #5563DE; color: white; border: none; padding: 10px; border-radius: 8px; cursor: pointer; font-size: 11px; width: 90%;">
			<div style="margin-top: 15px;">
				<label> <a href="Registration.jsp"
					style="text-decoration: none; color: #5563DE; font-weight: bold; margin-right: 10px;">New
						User Registration </a> <!-- <a href="Forgotpass.jsp"
				style="text-decoration: none; color: #5563DE; font-weight: bold;">Forgot
				Password?</a> -->
				</label>
			</div>
		</form>
	</fieldset>

</body>
</html>