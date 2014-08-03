<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
	Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Health Centers</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Health Center Name</td>
		<td>Description</td>
		<td>Woreda</td>
		<td>Kebele</td>
		<td>Gote</td>
		<td>Google Map</td>
	</tr>
	<%
		int ctr=1;
		while(healthCenterItr.hasNext()){
			HealthCenter healthCenter = healthCenterItr.next();
			HealthCenterLocation healthCenterLocation = HealthCenterLocation.getHealthCenterLocationForThisHealthCenter(healthCenter.getId());
			if(ctr % 2 == 0){
			%>
			<tr class='bg'>
			<%
			}else{
			%>
			<tr>
			<%
			}
			%>
				<td><%=ctr %></td>
				<td><%=healthCenter.getHealthCenterName() %></td>
				<td><%=healthCenter.getDescription() %></td>
				<td><%=healthCenterLocation.getWoreda() %></td>
				<td><%=healthCenterLocation.getKebele() %></td>
				<td><%=healthCenterLocation.getGote() %></td>
				<td>
					<a href="#.jsp" onclick="showGoogleMapForThisHealthCenter(<%=healthCenterLocation.getId() %>);">Click here to see google map</a> | 
					<a href="#.jsp" onclick="hideGoogleMap(<%=healthCenterLocation.getId() %>);">Hide Map</a>
				</td>
			</tr>
			<%
				String divId = "healthCenterDiv"+healthCenterLocation.getId();
			%>
			<tr>
				<td colspan="7">
					<div id="<%=divId %>"></div>
				</td>
			</tr>
			<%
			ctr++;
		}//end while loop
	%>
</table>