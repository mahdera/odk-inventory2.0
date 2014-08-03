<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long respoId = Long.parseLong(request.getParameter("respoId"));
	PhoneResponsibility respo = PhoneResponsibility.getPhoneResponsibility(respoId);
	//define the field names here...
	String fullNameField = "txtfullname" + respoId;
	String healthCenterField = "slcthealthcenter" + respoId;
	String jobDescriptionField = "textareajobdescription" + respoId;
	String phoneBrandField = "txtphonebrand" + respoId;
	String apparatusSerialNumberField = "txtapparatusserialnumber" + respoId;
	String batterySerialNumberField = "txtbatteryserialnumber" + respoId;
	String simPinNumberField = "txtsimpinnumber" + respoId;
	String puk1Field = "txtpuk1"+respoId;
	String puk2Field = "txtpuk2"+respoId;
	String phoneNumberField = "txtphonenumber" + respoId;
	String dateGivenOnField = "txtdategivenon" + respoId;
	String descriptionField = "textareadescription" + respoId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Full Name:</td>
			<td><input type="text" name="<%=fullNameField %>" id="<%=fullNameField %>" value="<%=respo.getFullName() %>"/></td>
		</tr>
		<tr>
			<td>Health Center:</td>
			<td>
				<select name="<%=healthCenterField %>" id="<%=healthCenterField %>" style="width:50%">					
					<%
						List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
						Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
						while(healthCenterItr.hasNext()){
							HealthCenter healthCenter = healthCenterItr.next();
							if(healthCenter.getId() == respo.getHealthCenterId()){
							%>
							<option value="<%=healthCenter.getId() %>" selected="selected"><%=healthCenter.getHealthCenterName() %></option>
							<%
							}else{
								%>
								<option value="<%=healthCenter.getId() %>"><%=healthCenter.getHealthCenterName() %></option>
								<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Job Description:</td>
			<td>
				<textarea name="<%=jobDescriptionField %>" id="<%=jobDescriptionField %>" rows="3" cols="70"><%=respo.getJobDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td>Phone Brand:</td>
			<td><input type="text" name="<%=phoneBrandField %>" id="<%=phoneBrandField %>" value="<%=respo.getPhoneBrand() %>"/></td>
		</tr>
		<tr>
			<td>Apparatus Serial Number:</td>
			<td><input type="text" name="<%=apparatusSerialNumberField %>" id="<%=apparatusSerialNumberField %>" value="<%=respo.getApparatusSerialNumber() %>"/></td>
		</tr>
		<tr>
			<td>Battery Serial Number:</td>
			<td><input type="text" name="<%=batterySerialNumberField %>" id="<%=batterySerialNumberField %>" value="<%=respo.getBatterySerialNumber() %>"/></td>
		</tr>
		<tr>
			<td>SIM PIN Number:</td>
			<td><input type="text" name="<%=simPinNumberField %>" id="<%=simPinNumberField %>" value="<%=respo.getSimPinNumber() %>"/></td>
		</tr>
		<tr>
			<td>PUK 1 Number:</td>
			<td><input type="text" name="<%=puk1Field %>" id="<%=puk1Field %>" value="<%=respo.getPuk1() %>"/></td>
		</tr>
		<tr>
			<td>PUK 2 Number:</td>
			<td><input type="text" name="<%=puk2Field %>" id="<%=puk2Field %>" value="<%=respo.getPuk2() %>"/></td>
		</tr>
		<tr>
			<td>SIM PIN Number:</td>
			<td><input type="text" name="<%=simPinNumberField %>" id="<%=simPinNumberField %>" value="<%=respo.getSimPinNumber() %>"/></td>
		</tr>
		<tr>
			<td>Phone Number:</td>
			<td><input type="text" name="<%=phoneNumberField %>" id="<%=phoneNumberField %>" value="<%=respo.getPhoneNumber() %>"/></td>
		</tr>
		<tr>
			<td>Date Given on:</td>
			<td>
				<input type="text" name="<%=dateGivenOnField %>" id="<%=dateGivenOnField %>" value="<%=respo.getDateGivenOn() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateGivenOnField %>');" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=descriptionField %>" id="<%=descriptionField %>" rows="3" cols="70"><%=respo.getDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updatePhoneResponsibility(<%=respoId %>,document.getElementById('<%=fullNameField %>').value,
						document.getElementById('<%=healthCenterField %>').value,document.getElementById('<%=jobDescriptionField %>').value,
						document.getElementById('<%=phoneBrandField %>').value,document.getElementById('<%=apparatusSerialNumberField %>').value,
						document.getElementById('<%=batterySerialNumberField %>').value,document.getElementById('<%=simPinNumberField %>').value,
						document.getElementById('<%=phoneNumberField %>').value,document.getElementById('<%=dateGivenOnField %>').value,
						document.getElementById('<%=descriptionField %>').value,document.getElementById('<%=puk1Field %>').value,
						document.getElementById('<%=puk2Field %>').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table> 
</form>