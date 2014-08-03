<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long downloadsId = Long.parseLong(request.getParameter("downloadsId"));
	Downloads d = Downloads.getDownloads(downloadsId);
%>
<form style="background:#eeeeee" method="post" enctype="multipart/form-data" action="updateuploads.jsp">
	<table border="0" width="100%">
		<tr>
			<td>Title:</td>
			<td>
				<input type="text" name="txttitle" value="<%=d.getTitle() %>"/>
				<input type="hidden" name="hiddendownloadsid" value="<%=downloadsId %>"/>
			</td>
		</tr>
		<tr>
			<td>Date Uploaded:</td>
			<td>
				<input type="text" name="txtdateuploaded" id="txtdateuploaded" value="<%=d.getDateUploaded() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdateuploaded');" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td><textarea name="textareadescription" cols="70" rows="3"><%=d.getDescription() %></textarea></td>
		</tr>
		<tr>
			<td>Item to Upload:</td>
			<td><input type="file" name="fleitemtoupload"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="Upload"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>