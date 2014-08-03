<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long respoId = Long.parseLong(request.getParameter("respoId"));
	PhoneResponsibility.deletePhoneResponsibility(respoId);
%>
<%@include file="showlistofphoneresponsiblityfordelete.jsp"%>
<p class="msg done">Phone responsibility deleted successfully!</p>