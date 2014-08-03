<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long downloadsId = Long.parseLong(request.getParameter("downloadsId"));
	Downloads.deleteDownloads(downloadsId);
%>
<%@include file="showlistofdownloadsfordelete.jsp"%>
<p class="msg done">Downloads item deleted successfully!</p>