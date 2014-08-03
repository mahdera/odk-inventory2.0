<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	String type = request.getParameter("type");

	if(type.equalsIgnoreCase("hc")){
		List<HealthCenter> healthCenterList = HealthCenter.getAllHealthCenters();
		Iterator<HealthCenter> healthCenterItr = healthCenterList.iterator();
		%>
		<select name="slctfacility" id="slctfacility" style="width:100%">
			<option value="" selected="selected">--Select--</option>
			<%
				while(healthCenterItr.hasNext()){
					HealthCenter healthCenter = healthCenterItr.next();
					%>
					<option value="<%=healthCenter.getId() %>"><%=healthCenter.getHealthCenterName() %></option>
					<%
				}//end while loop
			%>
		</select>
		<%
	}else if(type.equalsIgnoreCase("hp")){
		List<HealthPost> healthPostList = HealthPost.getAllHealthPosts();
		Iterator<HealthPost> healthPostItr = healthPostList.iterator();
		%>
		<select name="slctfacility" id="slctfacility" style="width:100%">
			<option value="" selected="selected">--Select--</option>
			<%
				while(healthPostItr.hasNext()){
					HealthPost healthPost = healthPostItr.next();
					%>
					<option value="<%=healthPost.getId() %>"><%=healthPost.getHealthPostName() %></option>
					<%
				}//end while loop
			%>
		</select>
		<%
	}
%>