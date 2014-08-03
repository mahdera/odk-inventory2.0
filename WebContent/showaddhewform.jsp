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
			<td>First Name:</td>
			<td><input type="text" name="txtfirstname" id="txtfirstname"/></td>
		</tr>
		<tr>
			<td>Father Name:</td>
			<td><input type="text" name="txtfathername" id="txtfathername"/></td>
		</tr>
		<tr>
			<td>Grand Father Name:</td>
			<td><input type="text" name="txtgrandfathername" id="txtgrandfathername"/></td>
		</tr>
		<tr>
			<td>Mobile Number:</td>
			<td><input type="text" name="txtmobilenumber" id="txtmobilenumber"/></td>
		</tr>
		<tr>
			<td>Health Post:</td>
			<td>
				<select name="slcthealthpost" id="slcthealthpost" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthPost> healthPostList = null;
						if(user.getUserType().equalsIgnoreCase("HEW Supervisor")){
							HealthCenter hCenter = HealthCenter.getHealthCenter(NurseManagesHealthCenter.getNurseManagesHealthCenterForThisUser(user.getId()).getHealthCenterId());
							healthPostList = HealthPost.getAllHealthPostsUnderThisHealthCenter(hCenter.getId());
						}else
							healthPostList = HealthPost.getAllHealthPosts();
						
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost healthPost = healthPostItr.next();
							%>
							<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveHEW(document.getElementById('txtfirstname').value,
				document.getElementById('txtfathername').value,document.getElementById('txtgrandfathername').value,
				document.getElementById('txtmobilenumber').value,document.getElementById('slcthealthpost').value);"/>
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