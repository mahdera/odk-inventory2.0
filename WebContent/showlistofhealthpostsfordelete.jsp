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
		<td>Delete</td>
	</tr>
	<%
		int ctr=1;
		while(healthPostItr.hasNext()){
			HealthPost healthPost = healthPostItr.next();
			HealthCenter healthCenter = HealthCenter.getHealthCenter(healthPost.getHealthCenterId());
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
				<td><%=(healthPostLocation != null ? healthCenter.getHealthCenterName() : "---")%></td>
				<td>
					<a href="#.jsp" onclick="deleteThisHealthPost(<%=healthPost.getId() %>);">Delete</a>
				</td>
			</tr>
			<%
				String divId = "healthPostEditDiv"+healthPost.getId();
			%>
			<tr>
				<td colspan="8">
					<div id="<%=divId %>"></div>
				</td>
			</tr>
			<%
			ctr++;
		}//end while loop
	%>
</table>