<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String uname = request.getParameter("username");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String contact = request.getParameter("contact");
	%>
	<h1>
		Hi
		<%=uname%>, Successfully Register in.....
	</h1>
	<%
	String contactno = request.getParameter("contactno");
	String pssd = request.getParameter("password");
	%>
	<h1>
	<%=contactno%>, Successfully Logged in....
	</h1>
</body>
</html>