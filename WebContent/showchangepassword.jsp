<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "accountManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	
	if(role.isDeletable() && role.isUpdateable()){
%>
<form style="background:#eeeeee">
	<div id="passwordErrorDiv"></div>
	<table border="0" width="100%">
		<tr>
			<td>Current Username:</td>
			<td><input type="text" name="txtcurrentusername" id="txtcurrentusername"/></td>
		</tr>
		<tr>
			<td>Current Password:</td>
			<td><input type="password" name="txtcurrentpassword" id="txtcurrentpassword"/></td>
		</tr>
		<tr>
			<td>New Password:</td>
			<td><input type="password" name="txtnewpassword" id="txtnewpassword"/></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><input type="password" name="txtconfirmpassword" id="txtconfirmpassword"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Change" onclick="changePassword(document.getElementById('txtcurrentusername').value,
					document.getElementById('txtcurrentpassword').value,document.getElementById('txtnewpassword').value,document.getElementById('txtconfirmpassword').value);"/>
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