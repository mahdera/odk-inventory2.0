<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int motherId = Integer.parseInt(request.getParameter("motherId"));
	//out.println(motherId);
	Mother mother = Mother.getMother(motherId);
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Mother Full Name:</td>
			<td><input type="text" name="txtmotherfullname" id="txtmotherfullname" value="<%=mother.getMotherFullName() %>"/></td>
		</tr>
		<tr>
			<td>House Number/Gote:</td>
			<td><input type="text" name="txthousenumbergote" id="txthousenumbergote" value="<%=mother.getHouseNumberGote() %>"/></td>
		</tr>
		<tr>
			<td>Preferred Contraceptive Method:</td>
			<td><input type="text" name="txtpreferredcontraceptivemethod" id="txtpreferredcontraceptivemethod" value="<%=mother.getPreferredContraceptiveMethod() %>"/></td>
		</tr>
		<tr>
			<td>Phone Number:</td>
			<td><input type="text" name="txtmobilenumber" id="txtmobilenumber" value="<%=mother.getPhoneNumber() %>"/></td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateMother(<%=motherId %>,document.getElementById('txtmotherfullname').value,
				document.getElementById('txthousenumbergote').value,document.getElementById('txtpreferredcontraceptivemethod').value,
				document.getElementById('txtmobilenumber').value);"/>
				<input type="reset" value="Reset"/>
			</td>
		</tr>
	</table>
</form>