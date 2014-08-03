<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	String firstName = request.getParameter("firstName");
	String middleName = request.getParameter("middleName");
	String lastName = request.getParameter("lastName");
	String userType = request.getParameter("userType");
	int healthInstituteId = Integer.parseInt(request.getParameter("healthInstituteId"));
	
	//update where the user is currently working...
	if(userType.equalsIgnoreCase("HEW")){
		HEWManagesHealthPost.updateHEWManagesHealthPost(userId,healthInstituteId);
	}else if(userType.equalsIgnoreCase("HC Administrator")){
		NurseManagesHealthCenter.updateNurseManagesHealthCenter(userId,healthInstituteId);
	}
	
	//now update the user...
	User.updateUser(userId, firstName, middleName, lastName, userType);
%>
<p class="msg done">User updated successfully!</p>