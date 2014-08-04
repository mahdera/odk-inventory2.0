<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Type</td>
			<td>
				<select name="slcthelathfacility" id="slcthealthfacility" style="width:100%" onchange="showAllHealthFacilitiesOfThisType(this.value);">
					<option value="" selected="selected">--Select--</option>
					<option value="HP">Health Post</option>
					<option value="HC">Health Center</option>					
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
				<input type="button" id="showStockOutReportButton" value="Show"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="reportDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#showStockOutReportButton').click(function(){
			var healthFacilityType = $('#slcthealthfacility').val();
			var selectedHealthFacilityId = $('#slctfacility').val();
			var startingFrom = $('#txtstartingfrom').val();
			var upto = $('#txtupto').val();
			
			if(healthFacilityType !== "" && selectedHealthFacilityId !== "" &&
					startingFrom !== "" && upto !== ""){				
				$('#reportDetailDiv').load("showthecontraceptiveconsumptionstockoutanalysisforthisfacilityduringthisperiod.jsp?type="+healthFacilityType+
						"&facilityId="+selectedHealthFacilityId+"&fromDate="+startingFrom+"&toDate="+upto);
			}else{
				alert('Please fill out all the filter input data!');
			}
		});
	});//end document.ready function
</script>