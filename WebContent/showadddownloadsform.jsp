<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "downloadsManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	
	if(role.isWritable()){
%>
<form style="background:#eeeeee" method="post" enctype="multipart/form-data" action="saveuploads.jsp">
	<table border="0" width="100%">
		<tr>
			<td>Title:</td>
			<td><input type="text" name="txttitle"/></td>
		</tr>
		<tr>
			<td>Date Uploaded:</td>
			<td>
				<input type="text" name="txtdateuploaded" id="txtdateuploaded"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdateuploaded');" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td><textarea name="textareadescription" cols="70" rows="3"></textarea></td>
		</tr>
		<tr>
			<td>Item to Upload:</td>
			<td><input type="file" name="fleitemtoupload"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="Upload"/>
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