<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DOMUS - House Automation</title>
</head>
<body>
	...wait...

	<jsp:useBean id="remote_object" scope="session" class="domus.client.Client" />
	<%
		try {
			String tmp = request.getParameter("hour");
			int h = Integer.parseInt(tmp);
			tmp = request.getParameter("minute");
			int m = Integer.parseInt(tmp);
			
			remote_object.setActivationTime(h, m);
		} catch (Exception e) {
		}
		response.sendRedirect("index.jsp");
	%>
</body>
</html>