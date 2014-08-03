<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String uri = request.getParameter("uri");
	//out.println(uri);
	if(RelateODKUserWithInventoryUser.isThisODKUserAlreadyRelatedToInventoryUser(uri)){
		%>
		<p class="msg warning">This ODK user is already related to inventory user!!</p>
		<%
	}else{
		out.print("");
	}
%>