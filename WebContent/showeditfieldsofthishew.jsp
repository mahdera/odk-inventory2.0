<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int hewId = Integer.parseInt(request.getParameter("hewId"));
	HEW hew = HEW.getHEW(hewId);
	HealthPost healthPost = HealthPost.getHealthPost(hew.getHealthPostId());
	///define the fields here below...
	String firstNameField = "txtfirstname"+hewId;
	String fatherNameField = "txtfathername"+hewId;
	String grandFatherNameField = "txtgrandfathername"+hewId;
	String mobileNumberField = "txtmobilenumber"+hewId;
	String healthPostField = "slcthealthpost"+hewId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>First Name:</td>
			<td>
				<input type="text" name="<%=firstNameField %>" id="<%=firstNameField %>" value="<%=hew.getFirstName() %>"/>
			</td>
		</tr>
		<tr>
			<td>Father Name:</td>
			<td><input type="text" name="<%=fatherNameField %>" id="<%=fatherNameField %>" value="<%=hew.getFatherName() %>"/></td>
		</tr>
		<tr>
			<td>Grand Father Name:</td>
			<td><input type="text" name="<%=grandFatherNameField %>" id="<%=grandFatherNameField %>" value="<%=hew.getGrandFatherName() %>"/></td>
		</tr>
		<tr>
			<td>Mobile Number:</td>
			<td><input type="text" name="<%=mobileNumberField %>" id="<%=mobileNumberField %>" value="<%=hew.getMobileNumber() %>"/></td>
		</tr>
		<tr>
			<td>Health Post:</td>
			<td>
				<select name="<%=healthPostField %>" id="<%=healthPostField %>" style="width:50%">
					<%
						List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost hPost = healthPostItr.next();
							if(hPost.getId() == healthPost.getId()){
								%>
								<option value="<%=hPost.getId() %>" selected="selected"><%=hPost.getHealthPostName() %></option>
								<%
							}else{
								%>
								<option value="<%=hPost.getId() %>"><%=hPost.getHealthPostName() %></option>
								<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateHEW(<%=hewId %>,
				document.getElementById('<%=firstNameField %>').value,document.getElementById('<%=fatherNameField %>').value,
				document.getElementById('<%=grandFatherNameField %>').value,document.getElementById('<%=mobileNumberField %>').value,
				document.getElementById('<%=healthPostField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>