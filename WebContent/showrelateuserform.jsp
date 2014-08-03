<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>
				ODK User:<br/>
				<select name="slctodkuser" id="slctodkuser" style="width:100%" onchange="checkIfThisODKUserIsAlredayRelatedToInventoryUser(this.value);">
					<option value="" selected="selected">--Select--</option>
					<%
						List<RegisteredUsers> registerUsersList = RegisteredUsers.getAllRegisteredUsers();
						if(registerUsersList != null){
							Iterator<RegisteredUsers> registerUserItr = registerUsersList.iterator();
							while(registerUserItr.hasNext()){
								RegisteredUsers registerUser = registerUserItr.next();
								%>
								<option value="<%=registerUser.get_URI() %>"><%=registerUser.get_URI() %></option>
								<%
							}//end while loop
						}
					%>
				</select>
			</td>
			<td>
				Inventory User:<br/>
				<select name="slctuser" id="slctuser" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<User> userList = User.getAllUsers();
						if(userList != null){
							Iterator<User> userItr = userList.iterator();
							while(userItr.hasNext()){
								User user = userItr.next();
								%>
								<option value="<%=user.getId() %>"><%=user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName() %></option>
								<%
							}//end while loop
						}
					%>
				</select>
			</td>
			<td>
				<br/>
				<input type="button" value="Relate this user" onclick="relateThisUser(document.getElementById('slctodkuser').value,
						document.getElementById('slctuser').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div id="relationDiv"></div>
			</td>
		</tr>
	</table>
	<fieldset>
		<legend>List of Related Users</legend>
		<table border="0" width="100%">
			<tr style="background:#c8e5ff;font-weight:bolder;font-size:10pt">
				<td>Ser.No</td>
				<td>ODK User</td>
				<td>Inventory User</td>
				<td>User Type</td>
				<td>Health Center</td>
				<td>Health Post</td>
				<td>Edit</td>
			</tr>
			<%
				List<RelateODKUserWithInventoryUser> relatedUserList = RelateODKUserWithInventoryUser.getAllRelatedODKUserWithInventoryUsers();
				Iterator<RelateODKUserWithInventoryUser> relatedUserItr = relatedUserList.iterator();
				int ctr=1;
				if(relatedUserList != null){
					while(relatedUserItr.hasNext()){
						RelateODKUserWithInventoryUser relatedUser = relatedUserItr.next();
						User u = User.getUser(relatedUser.getUserId());
						HEWManagesHealthPost hewManagesHP = null;
						NurseManagesHealthCenter nurseManagesHC = null;
						//System.out.println("Andi garcia: "+u.getUserType());
						if(u != null){
							if(u.getUserType().equalsIgnoreCase("hew"))
								hewManagesHP = HEWManagesHealthPost.getHEWManagesHealthPostForUser(u.getId());
							else if(u.getUserType().equalsIgnoreCase("hew supervisor"))
								nurseManagesHC = NurseManagesHealthCenter.getNurseManagesHealthCenterForThisUser(u.getId());
							
							HealthPost healthPost = null;
							HealthCenter healthCenter = null;
							
							if(hewManagesHP != null)
								healthPost = HealthPost.getHealthPost(hewManagesHP.getHealthPostId());
							else if(nurseManagesHC != null)
								healthCenter = HealthCenter.getHealthCenter(nurseManagesHC.getHealthCenterId());
								
							
							if(healthPost != null && u.getUserType().equalsIgnoreCase("hew"))
								healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
							//else if(healthCenter != null && user.getUserType().equalsIgnoreCase("hc administrator"))
								
							String userFullName = u.getFirstName()+" "+u.getMiddleName()+" "+u.getLastName();
							RegisteredUsers registeredUser = RegisteredUsers.getRegisteredUser(relatedUser.get_uri());
							if(ctr%2==0){
							%>
							<tr class="bg">
							<%
							}else{
							%>
							<tr>
							<%
							}
							%>
								<td><%=ctr %></td>
								<td><%=relatedUser.get_uri() %></td>
								<td><%=userFullName %></td>
								<td><%=u.getUserType() %></td>
								<td><%=(healthCenter!=null?healthCenter.getHealthCenterName():"Not Specified") %></td>
								<td><%=(healthPost!=null?healthPost.getHealthPostName():"Not Specified") %></td>
								<td>
									Edit
								</td>
							</tr>
							<%
							ctr++;
						}//end while loop
					}
				}
			%>
		</table>
	</fieldset>
</form>