<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
	Iterator<HealthPost> healthPostItr = healthPostList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Health Posts</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Health Post Name</td>
		<td>Description</td>
		<td>Woreda</td>
		<td>Kebele</td>
		<td>Gote</td>
		<td>Health Center</td>
		<td>Google Map</td>
	</tr>
	<%
		int ctr=1;
		while(healthPostItr.hasNext()){
			HealthPost healthPost = healthPostItr.next();
			HealthCenter healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
			if(healthCenter != null){
				HealthPostLocation healthPostLocation = HealthPostLocation.getHealthPostLocationForThisHealthPost(healthPost.getId());
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
					<td><%=healthPost.getHealthPostName() %></td>
					<td><%=healthPost.getDescription() %></td>
					<td><%=(healthPostLocation != null ? healthPostLocation.getWoreda() : "---") %></td>
					<td><%=(healthPostLocation != null ? healthPostLocation.getKebele() : "---") %></td>
					<td><%=(healthPostLocation != null ? healthPostLocation.getGote() : "---") %></td>
					<td><%=(healthPostLocation != null ? healthCenter.getHealthCenterName() : "---") %></td>
					<td>
						<a href="#.jsp" onclick="showGoogleMapForThisHealthPost(<%=healthPost.getId() %>);">Click here to see google map</a> | 
						<a href="#.jsp" onclick="hideGoogleMap(<%=(healthPostLocation != null ? healthPostLocation.getId() : 0) %>);">Hide Map</a>
					</td>
				</tr>
				<%
					String divId = "healthPostDiv"+healthPostLocation.getId();
				%>
				<tr>
					<td colspan="7">
						<div id="<%=divId %>"></div>
					</td>
				</tr>
				<%
				ctr++;
			}//end if hC != null
		}//end while loop
	%>
</table>