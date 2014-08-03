<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
Account account = (Account) session.getAttribute("account");
String functionalityName = "downloadsManagement";
Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
Role role = Role.getRole(account.getAccountId(), functionalityO.getId());

if(role.isUpdateable()){
	List<Downloads> downloadsList = Downloads.getAllDownloads();
	if(downloadsList != null){
		Iterator<Downloads> downloadsItr = downloadsList.iterator();
		%>
		<table border="0" width="100%">
			<tr>
				<td>Ser.No</td>
				<td>Title</td>
				<td>Date Uploaded</td>
				<td>Description</td>
				<td>Click to Download</td>
				<td>Edit</td>
			</tr>
			<%
				int ctr=1;
				while(downloadsItr.hasNext()){
					Downloads downloads = downloadsItr.next();
					%>
					<tr>
						<td><%=ctr %></td>
						<td><%=downloads.getTitle() %></td>
						<td><%=downloads.getDateUploaded() %></td>
						<td><%=downloads.getDescription() %></td>
						<td>
							<a href="#.jsp" onclick="showDownloadsForThisParticularDownloadInANewWindow(<%=downloads.getId() %>);">Download</a>
						</td>
						<td>
							<a href="#.jsp" onclick="showEditFieldsOfThisDownloads(<%=downloads.getId() %>);">Edit</a>
						</td>
					</tr>
					<%
						String divId = "dowloadsEditDiv"+downloads.getId();
					%>
					<tr>
						<td colspan="6">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
					ctr++;
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg info">No item available for download!</p>
		<%
	}
}else{
	out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
}
%>