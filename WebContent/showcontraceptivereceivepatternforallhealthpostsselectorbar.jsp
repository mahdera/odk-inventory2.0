<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>			
			<td>Starting From:</td>
			<td>
				<input type="text" name="txtstartingfrom" id="txtstartingfrom" size="13"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtstartingfrom');" />
			</td>
			<td>Up to:</td>
			<td>
				<input type="text" name="txtupto" id="txtupto" size="13"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtupto');" />
			</td>
			<td>
				<input type="button" value="Show" onclick="showAllContraceptiveReceivePatternReportForAllHealthPostsDuringThisPeriod(
						document.getElementById('txtstartingfrom').value,document.getElementById('txtupto').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="reportDetailDiv"></div>