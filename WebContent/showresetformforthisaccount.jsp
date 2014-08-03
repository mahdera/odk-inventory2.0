<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%
	int accountId = Integer.parseInt(request.getParameter("accountId"));	
	Account a = Account.getAccount(accountId);
	String defaultUsername = "user"+a.getAccountId();
	String defaultPassword = "pass"+a.getAccountId();
%>
<form style="background:#eeeeee">
<table width="100%">
	<tr>
		<td align="right">New username</td>
		<td>
			<input type="text" name="txtresetedusername" id="txtresetedusername" value="<%=defaultUsername %>"/>
		</td>
	</tr>
	<tr>
		<td align="right">New password</td>
		<td>
			<input type="password" name="txtresetedpassword" id="txtresetedpassword" value="<%=defaultPassword %>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="button" value="Reset Account" class="input-submit" onclick="resetThisAccount(<%=accountId%>,
			document.getElementById('txtresetedusername').value,document.getElementById('txtresetedpassword').value);"/>
			<input type="reset" value="Reset to default values" class="input-submit"/>
		</td>
	</tr>
</table>
</form>