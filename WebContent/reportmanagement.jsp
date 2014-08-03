<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Select a Report:</td>
			<td>
				<select name="slctreport" id="slctreport" style="width:100%" onchange="showReport(this.value);">
					<option value="" selected="selected">--Select--</option>
					<option value="contraceptiveConsumptionPattern">Contraceptive consumption pattern report</option>
					<option value="contraceptiveConsumptionPatternForAllHealthPosts">Contraceptive consumption pattern report for all health posts (GIV)</option>
					<option value="contraceptiveReceivePatternForAllHealthPosts">Contraceptive receive pattern report for all health posts (GRV)</option>
					<option value="contraceptiveOrderPatternForAllHealthPosts">Contraceptive order pattern report for all health posts (Order)</option>
					<option value="contraceptiveLostOrDamagePatternForAllHealthPosts">Contraceptive lost or damaged pattern report for all health posts (Lost or Damaged)</option>
					<option value="contraceptiveConsumptionPatternPercentage">Contraceptive consumption percentage report</option>
					<option value="stockOutReport">Stock out report</option>
				</select>
			</td>
		</tr>
	</table>
</form>
<div id="reportDiv"></div>