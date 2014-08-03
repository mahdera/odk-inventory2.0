<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%
    session.setAttribute("account", null);
%>
<jsp:forward page="index.jsp">
    <jsp:param name="mahder" value="mahder"/>
</jsp:forward>
