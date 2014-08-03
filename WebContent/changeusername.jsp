<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String currentUsername = request.getParameter("currentUsername");
	String newUsername = request.getParameter("newUsername");
	String password = request.getParameter("password");
	
	if(Account.isThereAnAccountWithThisUsernameAndPassword(currentUsername,password)){
		//now i can change the username with the new username
		Account.changeUsername(currentUsername, newUsername, password);
		out.print("<p class='msg done'>Username changed successfully!</p>");
	}else{
		out.print("<p class='msg error'>There is no account with the specified username and password combination!</p>");
	}
%>