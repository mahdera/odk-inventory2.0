<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Type</td>
			<td>
				<select name="slcthelathfacility" id="slcthealthfacility" style="width:100%" onchange="showAllHealthFacilitiesOfThisType(this.value);">
					<option value="" selected="selected">--Select--</option>
					<option value="HC">Health Center</option>
					<option value="HP">Health Post</option>
				</select>
			</td>
			<td>Facility:</td>
			<td>
				<div id="healthFacilityDiv"></div>
			</td>
			<td>Starting From:</td>
			<td>
				<input type="text" name="txtstartingfrom" id="txtstartingfrom" size="8"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtstartingfrom');" />
			</td>
			<td>Up to:</td>
			<td>
				<input type="text" name="txtupto" id="txtupto" size="8"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtupto');" />
			</td>
			<td>
				<input type="button" value="Show" onclick="showTheContraceptiveConsumptionPatternPercentageForThisFacilityDuringThisPeriod(
						document.getElementById('slcthealthfacility').value,document.getElementById('slctfacility').value,
						document.getElementById('txtstartingfrom').value,document.getElementById('txtupto').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="reportDetailDiv"></div>