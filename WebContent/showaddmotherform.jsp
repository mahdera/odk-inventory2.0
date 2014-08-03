<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "hewManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	User user = User.getUser(account.getUserId());
	
	if(role.isWritable()){
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Mother Full Name:</td>
			<td><input type="text" name="txtmotherfullname" id="txtmotherfullname"/></td>
		</tr>
		<tr>
			<td>House Number/Gote:</td>
			<td><input type="text" name="txthousenumbergote" id="txthousenumbergote"/></td>
		</tr>
		<tr>
			<td>Preferred Contraceptive Method:</td>
			<td><input type="text" name="txtpreferredcontraceptivemethod" id="txtpreferredcontraceptivemethod"/></td>
		</tr>
		<tr>
			<td>Phone Number:</td>
			<td><input type="text" name="txtmobilenumber" id="txtmobilenumber"/></td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveMother(document.getElementById('txtmotherfullname').value,
				document.getElementById('txthousenumbergote').value,document.getElementById('txtpreferredcontraceptivemethod').value,
				document.getElementById('txtmobilenumber').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>