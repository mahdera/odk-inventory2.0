<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils" %>
<%
	String _uri = StringEscapeUtils.escapeSql(request.getParameter("_uri"));
	System.out.println("using escapeSql : "+_uri);
	int userId = Integer.parseInt(request.getParameter("userId"));
	
	RelateODKUserWithInventoryUser relateUser = new RelateODKUserWithInventoryUser(userId,_uri);
	relateUser.addRelateODKUserWithInventoryUser();
%>
<%@include file="showrelateuserform.jsp"%>
<p class="msg done">ODK user and Inventory user related successfully!</p>