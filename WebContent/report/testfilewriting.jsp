<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	FileManipulator.generateXMLFile("/report", "buki.xml");
	out.print("done wrting file");
%>