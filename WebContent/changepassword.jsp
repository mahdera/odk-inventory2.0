<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String username = request.getParameter("currentUsername");
	String currentPassword = request.getParameter("currentPassword");
	String newPassword = request.getParameter("newPassword");
	
	if(Account.isThereAnAccountWithThisUsernameAndPassword(username, currentPassword)){
		Account.changePassword(username, currentPassword, newPassword);
		out.print("<p class='msg done'>Password changed successfully!</p>");
	}else{
		out.print("<p class='msg error'>There is no account with the given username and password!</p>");
	}
%>