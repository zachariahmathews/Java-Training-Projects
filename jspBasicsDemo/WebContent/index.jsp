<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- MULTIPLICATION TABLE -->
	<%-- <h1 style="color: gray;">Multiplication Table</h1>
	<h2 style="color: gray;">Generate Table</h2>
	<form style="color: gray;">
		Table of number: <input type="text" name="number"> <input
			type="submit" value="Compute">
	</form>
	<br>
	<table>
		<%
			if (request.getParameter("number") != null) {
				int x = Integer.parseInt(request.getParameter("number"));
				for (int i = 1; i <= x; i++) {
		%>
		<tr>
			<%
				for (int j = 1; j <= x; j++) {
			%>
			<td style="width: 50px; text-align: center; color: gray;"><%=i * j%></td>
			<%
				}
			%>
		</tr>
		<%
			}
			}
		%>
	</table> --%>
	
	<form action="login_validate.jsp">
		Name: <input type="text" name="username">
		<% 
			if(request.getParameter("usr")==null){ }
			else if(!(request.getParameter("usr").equalsIgnoreCase("zach"))){ %>
		<span style="color:red;">Invalid username</span>
		<% } %><br>
		Password<input type="password" name="password">
		<% 
			if(request.getParameter("pss")==null){ }
			else if(!(request.getParameter("pss").equalsIgnoreCase("pass"))){ %>
		<span style="color:red;">Invalid password</span>
		<% } %><br>
		<input type="submit" value="Login">
	</form>
</body>
</html>