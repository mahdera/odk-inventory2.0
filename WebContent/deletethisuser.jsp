<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User.deleteUser(userId);
%>
<%@include file="showlistofusersfordelete.jsp"%>
<p class="msg done">User deleted successfully!</p>