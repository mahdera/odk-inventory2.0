<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	HealthCenter healthCenter = HealthCenter.getHealthCenter(healthCenterId);
	HealthCenterLocation healthCenterLocation = HealthCenterLocation.getHealthCenterLocationForThisHealthCenter(healthCenterId);
	int healthCenterLocationId = healthCenterLocation.getId();
	
	String healthCenterName = "txthealthcentername"+healthCenterId;
	String description = "textareadescription"+healthCenterId;
	String woredaName = "txtworeda"+healthCenterId;
	String kebeleName = "txtkebele"+healthCenterId;
	String goteName = "txtgote"+healthCenterId;
	String googleMapName = "textareagooglemap"+healthCenterId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Health Center Name:</td>
			<td>
				<input type="text" name="<%=healthCenterName %>" id="<%=healthCenterName %>" value="<%=healthCenter.getHealthCenterName() %>"/>
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=description %>" id="<%=description %>" cols="70" rows="3"><%=healthCenter.getDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td>Woreda:</td>
			<td>
				<input type="text" name="<%=woredaName %>" id="<%=woredaName %>" value="<%=healthCenterLocation.getWoreda() %>"/>
			</td>
		</tr>
		<tr>
			<td>Kebele:</td>
			<td>
				<input type="text" name="<%=kebeleName %>" id="<%=kebeleName %>" value="<%=healthCenterLocation.getKebele() %>"/>
			</td>
		</tr>
		<tr>
			<td>Gote:</td>
			<td>
				<input type="text" name="<%=goteName %>" id="<%=goteName %>" value="<%=healthCenterLocation.getGote() %>"/>
			</td>
		</tr>
		<tr>
			<td>Google Map:</td>
			<td>
				<textarea name="<%=googleMapName %>" id="<%=googleMapName %>" cols="70" rows="3"><%=healthCenterLocation.getGoogleMap() %></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateHealthCenter(<%=healthCenterId %>,
				document.getElementById('<%=healthCenterName %>').value,document.getElementById('<%=description %>').value,
				document.getElementById('<%=woredaName %>').value,document.getElementById('<%=kebeleName %>').value,
				document.getElementById('<%=goteName %>').value,document.getElementById('<%=googleMapName %>').value,
				<%=healthCenterLocationId%>);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>