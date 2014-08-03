<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String _uri = request.getParameter("_uri");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	//out.println(_uri);
	GRV grv = GRV.getGRVWithURI(_uri);
	//now show the grv form so that inventory users can edit the grv...
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Pills Amount:</td>
			<td><input type="text" name="txtpillsamount" id="txtpillsamount" value="<%=grv.getPills_amount() %>"/></td>
		</tr>
		<tr>
			<td>Condom Amount:</td>
			<td><input type="text" name="txtcondomamount" id="txtcondomamount" value="<%=grv.getCondom_amount() %>"/></td>
		</tr>
		<tr>
			<td>Injectable Amount:</td>
			<td><input type="text" name="txtinjectableamount" id="txtinjectableamount" value="<%=grv.getInjectable_amount() %>"/></td>
		</tr>
		<tr>
			<td>Implant Amount:</td>
			<td><input type="text" name="txtimplantamount" id="txtimplantamount" value="<%=grv.getImplant_amount() %>"/></td>
		</tr>
		<tr>
			<td>Pills Expire Date:</td>
			<td>
				<input type="text" name="txtpillsexpiredate" id="txtpillsexpiredate" value="<%=grv.getPillsExpireDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtpillsexpiredate')" />
			</td>
		</tr>
		<tr>
			<td>Condom Expire Date:</td>
			<td>
				<input type="text" name="txtcondomexpiredate" id="txtcondomexpiredate" value="<%=grv.getCondomExpireDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtcondomexpiredate')" />
			</td>
		</tr>
		<tr>
			<td>Injectable Expire Date:</td>
			<td>
				<input type="text" name="txtinjectableexpiredate" id="txtinjectableexpiredate" value="<%=grv.getInjectableExpireDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtinjectableexpiredate')" />
			</td>
		</tr>
		<tr>
			<td>Implant Expire Date:</td>
			<td>
				<input type="text" name="txtimplantexpiredate" id="txtimplantexpiredate" value="<%=grv.getImplantExpireDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtimplantexpiredate')" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" onclick="updateThisGRV('<%=_uri %>',document.getElementById('txtpillsamount').value,
				document.getElementById('txtcondomamount').value,document.getElementById('txtinjectableamount').value,
				document.getElementById('txtimplantamount').value,document.getElementById('txtpillsexpiredate').value,
				document.getElementById('txtcondomexpiredate').value,document.getElementById('txtinjectableexpiredate').value,
				document.getElementById('txtimplantexpiredate').value,<%=healthPostId %>);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>