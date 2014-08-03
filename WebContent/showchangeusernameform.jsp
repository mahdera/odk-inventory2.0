<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "accountManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	
	if(role.isDeletable() && role.isUpdateable()){
%>
<div id="usernameErrorDiv"></div>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Current Username:</td>
			<td>
				<input type="text" name="txtcurrentusername" id="txtcurrentusername"/>
			</td>
		</tr>
		<tr>
			<td>New Username:</td>
			<td>
				<input type="text" name="txtnewusername" id="txtnewusername"/>
			</td>
		</tr>
		<tr>
			<td>Password:</td>
			<td>
				<input type="password" name="txtpassword" id="txtpassword"/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Change" onclick="changeUsername(document.getElementById('txtcurrentusername').value,
						document.getElementById('txtnewusername').value,document.getElementById('txtpassword').value)"/>
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