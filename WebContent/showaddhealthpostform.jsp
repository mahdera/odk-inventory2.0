<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Health Post Name:</td>
			<td><input type="text" name="txthealthpostname" id="txthealthpostname"/></td>
		</tr>		
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="textareadescription" id="textareadescription" rows="3" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td>Woreda:</td>
			<td><input type="text" name="txtworeda" id="txtworeda"/></td>
		</tr>
		<tr>
			<td>Kebele:</td>
			<td><input type="text" name="txtkebele" id="txtkebele"/></td>
		</tr>
		<tr>
			<td>Gote:</td>
			<td><input type="text" name="txtgote" id="txtgote"/></td>
		</tr>
		<tr>
			<td>Google Map:</td>
			<td><textarea name="textareagooglemap" id="textareagooglemap" rows="3" cols="70"></textarea></td>
		</tr>
		<tr>
			<td>Health Center:</td>
			<td>
				<select name="slcthealthcenter" id="slcthealthcenter" style="width:30%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
						Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
						while(healthCenterItr.hasNext()){
							HealthCenter healthCenter = healthCenterItr.next();
							%>
							<option value="<%=healthCenter.getId() %>"><%=healthCenter.getHealthCenterName() %></option>
							<%
						}
					%>
				</select>
			</td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveHealthPost(document.getElementById('txthealthpostname').value,
						document.getElementById('textareadescription').value,document.getElementById('txtworeda').value,
						document.getElementById('txtkebele').value,document.getElementById('txtgote').value,
						document.getElementById('slcthealthcenter').value,document.getElementById('textareagooglemap').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table> 
</form>