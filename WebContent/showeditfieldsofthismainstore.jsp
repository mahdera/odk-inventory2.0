<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int mainStoreId = Integer.parseInt(request.getParameter("mainStoreId"));
	MainStore mainStore = MainStore.getMainStore(mainStoreId);
	HealthCenter healthCenter = HealthCenter.getHealthCenter(mainStore.getHealthCenterId());
	//define field names...
	String mainStoreNameField = "txtmainstorename"+mainStoreId;
	String healthCenterField = "slcthealthcenter"+mainStoreId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Main Store Name:</td>
			<td><input type="text" name="<%=mainStoreNameField %>" id="<%=mainStoreNameField %>" value="<%=mainStore.getMainStoreName() %>"/></td>
		</tr>
		<tr>
			<td>Health Center:</td>
			<td>
				<select name="<%=healthCenterField %>" id="<%=healthCenterField %>" style="width:30%">
					<%
						List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
						Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
						while(healthCenterItr.hasNext()){
							HealthCenter hCenter = healthCenterItr.next();
							if(healthCenter.getId() == hCenter.getId()){
								%>
								<option value="<%=hCenter.getId() %>" selected="selected"><%=hCenter.getHealthCenterName() %></option>
								<%
							}else{
								%>
								<option value="<%=hCenter.getId() %>"><%=hCenter.getHealthCenterName() %></option>
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
				<input type="button" value="Update" onclick="updateMainStore(<%=mainStoreId %>,
				document.getElementById('<%=mainStoreNameField %>').value,document.getElementById('<%=healthCenterField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>		
	</table>
</form>