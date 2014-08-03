<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="../sample/datetimepicker_css.js"></script>
</head>
<body>
	<form method="post" action="orderreport.jsp">
	<table border="0" width="100%">
		<tr>
			<td>Username:</td>
			<td>
				<input type="text" name="txtusername"/>
			</td>
		</tr>
		<tr>
			<td>Select Date:</td>
			<td>
				<input type="text" name="txtorderdate" id="txtorderdate" size="8"/>
				<img src="../sample/images/cal.gif" onclick="javascript:NewCssCal('txtorderdate');" />
			</td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="submit" value="go"/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="testfilewriting.jsp">Test file writing</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>