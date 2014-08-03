<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	//out.println(_uri);
	GIV giv = GIV.getGIVWithURI(_uri);
	//now show the grv form so that inventory users can edit the grv...
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Pills Amount:</td>
			<td><input type="text" name="txtpillsamount" id="txtpillsamount" value="<%=giv.getPills_amount() %>"/></td>
		</tr>
		<tr>
			<td>Condom Amount:</td>
			<td><input type="text" name="txtcondomamount" id="txtcondomamount" value="<%=giv.getCondom_amount() %>"/></td>
		</tr>
		<tr>
			<td>Injectable Amount:</td>
			<td><input type="text" name="txtinjectableamount" id="txtinjectableamount" value="<%=giv.getInjectable_amount() %>"/></td>
		</tr>
		<tr>
			<td>Implant Amount:</td>
			<td><input type="text" name="txtimplantamount" id="txtimplantamount" value="<%=giv.getImplant_amount() %>"/></td>
		</tr>		
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" onclick="updateThisGIV('<%=_uri %>',document.getElementById('txtpillsamount').value,
				document.getElementById('txtcondomamount').value,document.getElementById('txtinjectableamount').value,
				document.getElementById('txtimplantamount').value,<%=healthPostId %>);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>