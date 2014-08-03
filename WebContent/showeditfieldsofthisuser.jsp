<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User user = User.getUser(userId);
	////now create the input field unique names for each row
	String firstNameField = "txtfirstname"+userId;
	String middleNameField = "txtmiddlename"+userId;
	String lastNameField = "txtlastname"+userId;
	String userTypeField = "slctusertype"+userId;
	
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>First Name:</td>
			<td><input type="text" name="<%=firstNameField %>" id="<%=firstNameField %>" value="<%=user.getFirstName() %>"/></td>
		</tr>
		<tr>
			<td>Middle Name:</td>
			<td><input type="text" name="<%=middleNameField %>" id="<%=middleNameField %>" value="<%=user.getMiddleName() %>"/></td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td><input type="text" name="<%=lastNameField %>" id="<%=lastNameField %>" value="<%=user.getLastName() %>"/></td>
		</tr>
		<tr>
			<td>User Type:</td>
			<td>
				<select name="<%=userTypeField %>" id="<%=userTypeField %>" style="width:30%" onchange="showTheHEWManagesHealthPostDropDown(this.value);">
					<%
						if(user.getUserType().equalsIgnoreCase("Administrator")){
							%>
							<option value="" selected="selected">--Select--</option>
							<option value="Administrator" selected="selected">Administrator</option>
							<option value="Nurse">Nurse</option>
							<option value="HEW">HEW</option>				
							<option value="HC Administrator">HC Administrator</option>
							<%
						}else if(user.getUserType().equalsIgnoreCase("HEW Supervisor")){
							%>
							<option value="" selected="selected">--Select--</option>
							<option value="Administrator">Administrator</option>
							<option value="HEW Supervisor" selected="selected">HEW Supervisor</option>
							<option value="HEW">HEW</option>				
							<option value="HC Administrator">HC Administrator</option>
							<%
						}else if(user.getUserType().equalsIgnoreCase("hew")){
							%>
							<option value="" selected="selected">--Select--</option>
							<option value="Administrator">Administrator</option>
							<option value="Nurse">Nurse</option>
							<option value="HEW" selected="selected">HEW</option>				
							<option value="HC Administrator">HC Administrator</option>
							<%
						}else if(user.getUserType().equalsIgnoreCase("hc administrator")){
							%>
							<option value="" selected="selected">--Select--</option>
							<option value="Administrator">Administrator</option>
							<option value="Nurse">Nurse</option>
							<option value="HEW">HEW</option>				
							<option value="HC Administrator" selected="selected">HC Administrator</option>
							<%
						}
					%>					
				</select>
			</td>
		</tr>		
		<tr>			
			<td colspan="2">
				<div id="hcHpDiv"></div>
			</td>
		</tr>			
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateUser(<%=userId%>,document.getElementById('<%=firstNameField %>').value,
						document.getElementById('<%=middleNameField %>').value,document.getElementById('<%=lastNameField %>').value,
						document.getElementById('<%=userTypeField %>').value,document.getElementById('slcthealthinistitute').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>