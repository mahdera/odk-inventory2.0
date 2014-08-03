<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Full Name:</td>
			<td><input type="text" name="txtfullname" id="txtfullname"/></td>
		</tr>
		<tr>
			<td>Health Center:</td>
			<td>
				<select name="slcthealthcenter" id="slcthealthcenter" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
						Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
						while(healthCenterItr.hasNext()){
							HealthCenter healthCenter = healthCenterItr.next();
							%>
							<option value="<%=healthCenter.getId() %>"><%=healthCenter.getHealthCenterName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Job Description:</td>
			<td>
				<textarea name="textareajobdescription" id="textareajobdescription" rows="3" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td>Phone Brand:</td>
			<td><input type="text" name="txtphonebrand" id="txtphonebrand"/></td>
		</tr>
		<tr>
			<td>Apparatus Serial Number:</td>
			<td><input type="text" name="txtapparatusserialnumber" id="txtapparatusserialnumber"/></td>
		</tr>
		<tr>
			<td>Battery Serial Number:</td>
			<td><input type="text" name="txtbatteryserialnumber" id="txtbatteryserialnumber"/></td>
		</tr>
		<tr>
			<td>SIM PIN Number:</td>
			<td><input type="text" name="txtsimpinnumber" id="txtsimpinnumber"/></td>
		</tr>
		<tr>
			<td>PUK 1 Number:</td>
			<td><input type="text" name="txtpuk1number" id="txtpuk1number"/></td>
		</tr>
		<tr>
			<td>PUK 2 Number:</td>
			<td><input type="text" name="txtpuk2number" id="txtpuk2number"/></td>
		</tr>
		<tr>
			<td>Phone Number:</td>
			<td><input type="text" name="txtphonenumber" id="txtphonenumber"/></td>
		</tr>
		<tr>
			<td>Date Given on:</td>
			<td>
				<input type="text" name="txtdategivenon" id="txtdategivenon"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdategivenon');" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="textareadescription" id="textareadescription" rows="3" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="savePhoneResponsibility(document.getElementById('txtfullname').value,
						document.getElementById('slcthealthcenter').value,document.getElementById('textareajobdescription').value,
						document.getElementById('txtphonebrand').value,document.getElementById('txtapparatusserialnumber').value,
						document.getElementById('txtbatteryserialnumber').value,document.getElementById('txtsimpinnumber').value,
						document.getElementById('txtphonenumber').value,document.getElementById('txtdategivenon').value,
						document.getElementById('textareadescription').value,document.getElementById('txtpuk1number').value,
						document.getElementById('txtpuk2number').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table> 
</form>