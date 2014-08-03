<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	HealthPost healthPost = HealthPost.getHealthPost(healthPostId);
	HealthPostLocation healthPostLocation = HealthPostLocation.getHealthPostLocationForThisHealthPost(healthPost.getId());
	HealthCenter healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
	///define the control names
	String healthPostNameField = "txthealthpostname"+healthPostId;
	String descriptionField = "textareadescription"+healthPostId;
	String woredaField = "txtworeda"+healthPostId;
	String kebeleField = "txtkebele"+healthPostId;
	String goteField = "txtgote"+healthPostId;
	String healthCenterField = "slcthealthcenter"+healthPostId;
	String googleMapLocationField = "textareagooglemap"+healthPostId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Health Post Name:</td>
			<td><input type="text" name="<%=healthPostNameField%>" id="<%=healthPostNameField%>" value="<%=healthPost.getHealthPostName() %>"/></td>
		</tr>
		<tr>
			<td>Description:</td>
			<td><textarea name="<%=descriptionField %>" id="<%=descriptionField%>" cols="70" rows="3"><%=healthPost.getDescription() %></textarea></td>
		</tr>
		<tr>
			<td>Woreda:</td>
			<td><input type="text" name="<%=woredaField %>" id="<%=woredaField%>" value="<%=healthPostLocation.getWoreda() %>"/></td>
		</tr>
		<tr>
			<td>Kebele:</td>
			<td><input type="text" name="<%=kebeleField%>" id="<%=kebeleField%>" value="<%=healthPostLocation.getKebele() %>"/></td>
		</tr>
		<tr>
			<td>Gote:</td>
			<td><input type="text" name="<%=goteField%>" id="<%=goteField%>" value="<%=healthPostLocation.getGote() %>"/></td>
		</tr>
		<tr>
			<td>Health Center:</td>
			<td>
				<select name="<%=healthCenterField %>" id="<%=healthCenterField%>" style="width:50%">
					<%
						if(healthPost.getHealthCenterId() == healthCenter.getId()){
							%>
							<option value="<%=healthPost.getHealthCenterId() %>" selected="selected"><%=healthCenter.getHealthCenterName() %></option>
							<%
						}else{
							%>
							<option value="<%=healthPost.getHealthCenterId() %>"><%=healthCenter.getHealthCenterName() %></option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Google Map:</td>
			<td>
				<textarea name="<%=googleMapLocationField %>" id="<%=googleMapLocationField %>" rows="4" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateHealthPost(<%=healthPostId %>,
				document.getElementById('<%=healthPostNameField %>').value,document.getElementById('<%=descriptionField %>').value,
				document.getElementById('<%=woredaField %>').value,document.getElementById('<%=kebeleField %>').value,
				document.getElementById('<%=goteField %>').value,document.getElementById('<%=healthCenterField %>').value,
				document.getElementById('<%=googleMapLocationField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>