<%@page import="com.registerExample.RegisterValidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Please Register....</title>

<script type="text/javascript">
    function register_required(field, alerttxt) {
        with (field) {
            if (value == null || value == "") {
                alert(alerttxt);
                return false;
            }
            else {
                return true;
            }
        }
    }

    function register_Registerform() {
        with (thisform) {
            if (register_required(username, "Please enter the username") == false)
            {
                username.focus();
                return false;
            }

            if (register_required(password, "Please enter the password") == false)
            {
                password.focus();
                return false;
            }
            if (register_required(address, "Please enter the address") == false){
            	
            	address.focus();
            	return false;
            }
            if (register_required(contact, "Please enter the contact") == false){
                	
                address.focus();
                return false;
            	
            }
          
            return true;
        }   
        
    }
</script>
</head>
<body>


	<%
	String msg = "";
	String uname = request.getParameter("username");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String contact = request.getParameter("contact");

	if (uname != null && password != null && address != null && uname.length() > 0 && password.length() > 0
			&& address.length() > 0 && contact.length() > 0) {
		RegisterValidate obj = new RegisterValidate();
		boolean flag = obj.validateUserRegister(uname, password, address, contact);
		if (flag) {
			request.getRequestDispatcher("success.jsp").forward(request, response);
		} else {
			msg = "User already exist";
		}
	}
	%>

	<form action="Register.jsp" method="post"
		onsubmit="return validate_Registerform(this)">
		<table width="40%" border="1" align="center">
			<tr>
				<th colspan="3" align="center" valign="top">Enter your Details</th>

			</tr>
			<tr height="50">
				<td valign="middle" align="right">User Name</td>
				<td align="left"><input type="text" name="username" size="20"
					value=""></td>
			</tr>
			<tr>
				<td valign="middle" align="right">Password</td>
				<td align="left"><input name="password" size="20" value=""
					type="password"></td>
			</tr>
			<tr>
				<td valign="middle" align="right">address</td>
				<td align="left"><input name="address" size="30" value=""
					type="text"></td>
			</tr>
			<tr>
				<td valign="middle" align="right">contactNo</td>
				<td align="left"><input name="contact" size="10" value=""
					type=" text"></td>
			</tr>
			<tr height="40">
				<td colspan="2" align="center"><input value="Register"
					name="B1" type="submit"></td>
					<td>
					<a href="/pages/login.jsp">Login</a>
					</td>
			</tr>
		</table>

		<br> <br> <br> <br>

		<p align="center">
			<b><font color="red"><%=msg%></font></b>
		</p>

	</form>
</body>
</html>