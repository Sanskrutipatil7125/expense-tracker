<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
label {
	font-size: 11px;
}
#myform{
text-align: center;
margin: 0px auto;
margin-top: 5%;
border-style: solid;
border-radius: 10px; 
 width: 300px;
}
</style>
<body
	style="font-family: Arial, sans-serif; margin: 0; padding: 0;  display: flex; align-items: center; justify-content: center;">
	<div id="myform"> 
		<h4 style="color: black;">New User Form</h4>

	<form action="UserRegiser" method="post" enctype="multipart/form-data"
		style="background-color: white; padding: 8px 8px;  text-align: center;">

		<label
			style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">UserName</label>
		<input type="text" maxlength="100" required="required"
			placeholder="Full Name" name="uname" autocomplete="off"
			style="width: 85%; padding: 5px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 10px; outline: none; font-size: 13px;">


		<label
			style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">
			Select Photo</label> <input type="file" maxlength="100" required="required"
			placeholder="Person Photo" name="Image" autocomplete="off"
		style="width: 85%; padding: 5px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 10px; outline: none; font-size: 13px;">
		</label> 
	
		<label
			style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">User
			Contact</label> <input type="text" name="ucontact" maxlength="10"
			required="required" placeholder="Enter Mobile" autocomplete="off"
				style="width: 85%; padding: 5px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 10px; outline: none; font-size: 13px;">

		<label
			style="display: block; text-align: left; font-weight: bold; margin-bottom: 5px; color: #444;">
			Wallet Amount</label> <input type="text" name="amount" maxlength="6"
			required="required" placeholder="Amount" autocomplete="off"
		style="width: 85%; padding: 5px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 10px; outline: none; font-size: 13px;">

		<label
			style="display: block; text-align: left; font-weight: bold; margin-bottom: 2px; color: #444;">User
			Password</label> <input type="password" name="upass" maxlength="6"
			required="required" placeholder="Enter Password" autocomplete="off"
		style="width: 85%; padding: 5px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 10px; outline: none; font-size: 13px;">

		<input type="submit" value="Create User "
			style="background-color: #5563DE; color: white; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; font-size: 12px; width: 60%;">

		<p style="margin-top: 15px; font-size: 12px;">
			<a href="login.jsp"
				style="text-decoration: none; color: #5563DE; font-weight: bold;">Go
				To Login Page</a>
		</p>
	</form>
	</div>
</body>
</html>