<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String userType = request.getParameter("userType");
	if(userType.equalsIgnoreCase("HEW")){
%>
	<table border="0" width="100%">
		<tr>
			<td width="38%">Health Post:</td>
			<td>
				<select name="slcthealthinistitute" id="slcthealthinistitute" style="width:30%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
						Iterator<HealthPost> healthPostItr = healthPostList.iterator();
						while(healthPostItr.hasNext()){
							HealthPost healthPost = healthPostItr.next();
							%>
							<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
	</table>
<%
	}else if(userType.equalsIgnoreCase("HEW Supervisor")){
		%>
	<table border="0" width="100%">
		<tr>
			<td width="38%">Health Center:</td>
			<td>
				<select name="slcthealthinistitute" id="slcthealthinistitute" style="width:30%">
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
	</table>
		<%
	}else if(userType.equalsIgnoreCase("Administrator")){
		%>
		<table border="0" width="100%">
		<tr>
			<td width="38%">Health Center:</td>
			<td>
				<select name="slcthealthinistitute" id="slcthealthinistitute" style="width:30%">
					<option value="0" selected="selected">All Health Centers</option>					
				</select>
			</td>
		</tr>
	</table>
	<%
	}
%>