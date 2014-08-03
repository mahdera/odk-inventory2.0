<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Main Store Name:</td>
			<td><input type="text" name="txtmainstorename" id="txtmainstorename"/></td>
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
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveMainStore(document.getElementById('txtmainstorename').value,
						document.getElementById('slcthealthcenter').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>