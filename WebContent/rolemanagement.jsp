<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<div>
	<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "roleManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(role.isReadable() && role.isWritable() && role.isUpdateable() && role.isDeletable()){		 
	%>	
		<table border="0" width="100%">
		<tr>
			<th class="full" colspan="2">Role creation form</th>
		</tr>
		<tr style="background:#eeeeee">			
			<td colspan="1">
				Please select a user: 
				<%
					List<User> userList = null;
					Iterator<User> userItr = null;
					userList = User.getAllUsers();
					userItr = userList.iterator();
					out.print("<select name='slctuser' id='slctuser' onchange='showRoleForUser(this.value);' style='width:50%'>");
					out.print("<option value='' selected='selected'>--Select--</option>");
					while (userItr.hasNext()) {
						User user = userItr.next();						
						int userId = user.getId();
						Account acct = Account.getAccountForUser(userId);	
						String userFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
						%>
					<option value="<%=userId%>"><%=userFullName %></option> <%
 					}//end while loop
 					out.print("</select>");
					
					%>
					<div id="userSelectionDiv"></div>
					
 
				<hr />
				<div id="roleDetailForEmployee"></div>
			</td>
		</tr>
	</table>
	<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
	%>
</div>