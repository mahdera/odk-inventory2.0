

function showAllHealthFacilitiesOfThisType(healthFacilityType){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = "";
			document.getElementById("healthFacilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallhealthfacilitiesofthistype.jsp?type="+healthFacilityType, true);
	xmlhttp.send();
}

function showReorderLevelReminderForSystemAdministrator(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reorderLevelReminderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showreorderlevelreminderforsystemadministrator.jsp", true);
	xmlhttp.send();
}

function dismissThisItemReorderLevelReminder(itemReorderReminderId){
	if(window.confirm("Are you sure you want to dismiss this item reorder reminder?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("reorderLevelReminderDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "dismissthisitemreorderlevelreminder.jsp?itemReorderReminderId="+itemReorderReminderId, true);
		xmlhttp.send();
	}
}

function showAllContraceptiveConsumptionPatternReportForAllHealthPostsDuringThisPeriod(fromDate,toDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcontraceptiveconsumptionpatternforallhealthpostsduringthisperiod.jsp?fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function showAllContraceptiveReceivePatternReportForAllHealthPostsDuringThisPeriod(fromDate,toDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcontraceptivereceivepatternforallhealthpostsduringthisperiod.jsp?fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function showAllContraceptiveOrderPatternReportForAllHealthPostsDuringThisPeriod(fromDate,toDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcontraceptiveorderpatternforallhealthpostsduringthisperiod.jsp?fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function showAllContraceptiveLostOrDamagedPatternReportForAllHealthPostsDuringThisPeriod(fromDate,toDate){
	
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcontraceptivelostordamagedpatternforallhealthpostsduringthisperiod.jsp?fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function showTheContraceptiveConsumptionPatternForThisFacilityDuringThisPeriod(type,facilityId,fromDate,toDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showthecontraceptiveconsumptionpatternforthisfacilityduringthisperiod.jsp?type="+type+
			"&facilityId="+facilityId+"&fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function checkIfThisODKUserIsAlredayRelatedToInventoryUser(uri){
	//alert(uri);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("relationDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "checkifthisodkuserisalreadyrelatedtoinventoryuser.jsp?uri="+encodeURIComponent(uri), true);
	xmlhttp.send();	
}

function showTheContraceptiveConsumptionPatternPercentageForThisFacilityDuringThisPeriod(type,facilityId,fromDate,toDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showthecontraceptiveconsumptionpatternpercentageforthisfacilityduringthisperiod.jsp?type="+type+
			"&facilityId="+facilityId+"&fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();	
}
/*
function showReport(rpt){
	
}*/

function showGoogleMapForThisHealthCenter(healthCenterLocationId){
	var divId = "healthCenterDiv"+healthCenterLocationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showgooglemapforthishealthcenter.jsp?healthCenterLocationId="+
			healthCenterLocationId, true);
	xmlhttp.send();
}

function showGoogleMapForThisHealthPost(healthPostLocationId){
	var divId = "healthPostDiv"+healthCenterLocationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showgooglemapforthishealthpost.jsp?healthPostLocationId="+
			healthPostLocationId, true);
	xmlhttp.send();
}

function hideGoogleMap(healthCenterLocationId){
	var divId = "healthCenterDiv"+healthCenterLocationId;
	document.getElementById(divId).innerHTML = "";
}

function selectAllCheckBoxes(totalNumFun) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = true;
		document.getElementById(canWriteChk).checked = true;
		document.getElementById(canUpdateChk).checked = true;
		document.getElementById(canDeleteChk).checked = true;
	}
}

function disselectAllCheckBoxes(totalNumFun) {
	// alert(totalNumFun);
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = false;
		document.getElementById(canWriteChk).checked = false;
		document.getElementById(canUpdateChk).checked = false;
		document.getElementById(canDeleteChk).checked = false;
	}
}

function updateAllRoles(totalNumFun, accountId) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";
	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;
	hiddenRoleId = "";
	hiddenRolIdVal = "";
	hiddenFunctionalityId = "";
	hiddenFunctionalityIdVal = "";

	// now i need to loop tru each check boxes....read thier value and save it
	// to the database...
	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenFunctionalityId = "hiddenfunctionalityid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		hiddenFunctionalityIdVal = document.getElementById(hiddenRoleId).value;

		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;

		if (document.getElementById(canReadChk).checked == true)
			hasReadAccess = true;
		if (document.getElementById(canWriteChk).checked == true)
			hasWriteAccess = true;
		if (document.getElementById(canUpdateChk).checked == true)
			hasUpdateAccess = true;
		if (document.getElementById(canDeleteChk).checked == true)
			hasDeleteAccess = true;
		// /////////now update the role value in the database...
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				// document.getElementById("content").innerHTML =
				// xmlhttp.responseText;
				// document.getElementById("roleDetailForEmployee").innerHTML =
				// "<strong><font color='green'>Role updated
				// successfully!</font></strong>";
			}
		}
		xmlhttp
				.open("GET", "updaterole.jsp?roleId=" + hiddenRoleIdVal
						+ "&accountId=" + accountId + "&functionalityId="
						+ hiddenFunctionalityIdVal + "&hasReadAccess="
						+ hasReadAccess + "&hasWriteAccess=" + hasWriteAccess
						+ "&hasUpdateAccess=" + hasUpdateAccess
						+ "&hasDeleteAccess=" + hasDeleteAccess, true);
		xmlhttp.send();
		hasReadAccess = false;
		hasWriteAccess = false;
		hasUpdateAccess = false;
		hasDeleteAccess = false;
	}// end for loop

	document.getElementById("content").innerHTML = xmlhttp.responseText;
	document.getElementById("roleDetailForEmployee").innerHTML = "<strong><font color='green'>Role updated successfully!</font></strong>";
}

function updateRole(roleId, accountId, functionalityId, chkRead, chkWrite,
		chkUpdate, chkDelete) {
	// now compose the check box names to get the actual selected item from the
	// list
	// alert(roleId+":"+accountId+":"+functionalityId+":"+chkRead+":"+chkWrite+":"+chkUpdate+":"+chkDelete);

	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;

	if (chkRead.checked == true)
		hasReadAccess = true;
	if (chkWrite.checked == true)
		hasWriteAccess = true;
	if (chkUpdate.checked == true)
		hasUpdateAccess = true;
	if (chkDelete.checked == true)
		hasDeleteAccess = true;
	// ///////////////////////////////////////now comes the ajax...
	// alert("role id: "+roleId+"account id: "+accountId+" operation id:
	// "+operationId+" read : "+hasReadAccess+" : write : "+hasWriteAccess+" :
	// update : "+hasUpdateAccess+" : delete : "+hasDeleteAccess);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("content").innerHTML = xmlhttp.responseText;
			document.getElementById("roleDetailForEmployee").innerHTML = "<strong><font color='green'>Role updated successfully!</font></strong>";
		}
	}
	xmlhttp.open("GET", "updaterole.jsp?roleId=" + roleId + "&accountId="
			+ accountId + "&functionalityId=" + functionalityId
			+ "&hasReadAccess=" + hasReadAccess + "&hasWriteAccess="
			+ hasWriteAccess + "&hasUpdateAccess=" + hasUpdateAccess
			+ "&hasDeleteAccess=" + hasDeleteAccess, true);
	xmlhttp.send();
}

function showRoleForUser(userId) {
	// alert(userId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("roleDetailForEmployee").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showroleforuser.jsp?userId=" + userId, true);
	xmlhttp.send();
}

function showAddHEWForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddhewform.jsp", true);
	xmlhttp.send();
}

function showAddMotherForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddmotherform.jsp", true);
	xmlhttp.send();
}

function showAddScheduleForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddscheduleform.jsp", true);
	xmlhttp.send();
}

function saveSchedule(motherId,lastVisitDate,nextScheduledDate,actualVisitDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveschedule.jsp?motherId="+motherId+"&lastVisitDate="+lastVisitDate+"&nextScheduledDate="+
			nextScheduledDate+"&actualVisitDate="+actualVisitDate, true);
	xmlhttp.send();
}

function saveMother(motherFullName,houseNumberGote,preferredContraceptiveMethod,phoneNumber){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savemother.jsp?motherFullName="+motherFullName+"&houseNumberGote="+houseNumberGote+
			"&preferredContraceptiveMethod="+preferredContraceptiveMethod+"&phoneNumber="+phoneNumber, true);
	xmlhttp.send();
}

function showAddOrderForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddorderform.jsp", true);
	xmlhttp.send();
}

function showAddGRVForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddgrvform.jsp", true);
	xmlhttp.send();
}

function showAddDownloadsForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadddownloadsform.jsp", true);
	xmlhttp.send();
}

function showEditFieldsOfThisDownloads(downloadsId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisdownloads.jsp?downloadsId="+downloadsId, true);
	xmlhttp.send();
}

function showListOfDownloads(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdownloads.jsp", true);
	xmlhttp.send();
}

function showListOfDownloadsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdownloadsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfDownloadsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdownloadsfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisDownloads(downloadsId){
	if(window.confirm("Are you sure you want to delete this downloads item?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisdownloads.jsp?downloadsId="+downloadsId, true);
		xmlhttp.send();
	}
}

function showDownloadsForThisParticularDownloadInANewWindow(downloadsId){	
		var msgWin = window
				.open(
						'showimage.jsp?id=' + downloadsId,
						'msgWin',
						'toolbar=no,status=no,width=500,height=350,left=420,top=250,fullscreen=yes,titlebar=no,scrollbars=yes');	
}

function showListOfGRVs(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvs.jsp", true);
	xmlhttp.send();
}

function showListOfGIVs(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivs.jsp", true);
	xmlhttp.send();
}

function showListOfGRVsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfGIVsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfGRVsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvsfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfGIVsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivsfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfGRVsForThisHealthPost(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("grvDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvsforthishealthpost.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfGIVsForThisHealthPost(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("givDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivsforthishealthpost.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfGRVsForThisHealthPostForEdit(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("grvDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvsforthishealthpostforedit.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfGIVsForThisHealthPostForEdit(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("givDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivsforthishealthpostforedit.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfGRVsForThisHealthPostForDelete(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("grvDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgrvsforthishealthpostfordelete.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfGIVsForThisHealthPostForDelete(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("givDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofgivsforthishealthpostfordelete.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function deleteThisGRV(_uri,healthPostId){
	if(window.confirm("Are you sure you want to delete this GRV?")){
		var divId = "grvEditDiv" + _uri;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisgrv.jsp?_uri="+_uri+"&healthPostId="+healthPostId, true);
		xmlhttp.send();
	}
}

function deleteThisGIV(_uri,healthPostId){
	if(window.confirm("Are you sure you want to delete this GIV?")){
		var divId = "grvEditDiv" + _uri;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisgiv.jsp?_uri="+_uri+"&healthPostId="+healthPostId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisGIV(_uri,healthPostId){
	var divId = "givEditDiv" + _uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisgiv.jsp?_uri="+_uri+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showEditFieldsOfThisGRV(_uri,healthPostId){
	var divId = "grvEditDiv" + _uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisgrv.jsp?_uri="+_uri+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function updateThisGIV(_uri,pillsAmount,condomAmount,injectableAmount,implantAmount,healthPostId){
	var divId = "givEditDiv" + _uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisgiv.jsp?_uri="+_uri+"&pillsAmount="+pillsAmount+"&condomAmount="+
			condomAmount+"&injectableAmount="+injectableAmount+"&implantAmount="+implantAmount+"&healthPostId="
			+healthPostId, true);
	xmlhttp.send();
}

function updateThisGRV(_uri,pillsAmount,condomAmount,injectableAmount,implantAmount,pillsExpireDate,
		condomExpireDate,injectableExpireDate,implantExpireDate,healthPostId){
	var divId = "grvEditDiv" + _uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisgrv.jsp?_uri="+_uri+"&pillsAmount="+pillsAmount+"&condomAmount="+
			condomAmount+"&injectableAmount="+injectableAmount+"&implantAmount="+implantAmount+
			"&pillsExpireDate="+pillsExpireDate+"&condomExpireDate="+condomExpireDate+"&injectableExpireDate="+
			injectableExpireDate+"&implantExpireDate="+implantExpireDate+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfOrders(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistoforders.jsp", true);
	xmlhttp.send();
}

function showListOfOrdersForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofordersfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfOrdersForThisHealthPost(healthPostId){
	//alert(healthPostId+":"+status);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("orderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofordersforthishealthpostandstatus.jsp?healthPostId="+
			healthPostId, true);
	xmlhttp.send();
}

function showListOfApprovedOrdersForThisHealthPost(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("orderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapprovedordersforthishealthpostandstatus.jsp?healthPostId="+
			healthPostId, true);
	xmlhttp.send();
}

function showListOfOrdersForThisHealthPostToDelete(healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("orderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofordersforthishealthpostandstatustodelete.jsp?healthPostId="+
			healthPostId, true);
	xmlhttp.send();
}

function showOrderProcessPageForThisOrder(_uri,healthPostId){
	//alert(_uri);
	var divId = "processDiv"+_uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showorderprocesspageforthisorder.jsp?_uri="+
			_uri+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function deleteThisOrderOfThisHealthPost(_uri,healthPostId){
	if(window.confirm("Are you sure you want to delete this order?")){
		var divId = "processDiv"+_uri;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisorderofthishealthpost.jsp?_uri="+_uri+"&healthPostId="+healthPostId, true);
		xmlhttp.send();
	}
}

function hideOrderProcessPageForThisOrder(_uri){
	var divId = "processDiv"+_uri;
	document.getElementById(divId).innerHTML = "";
}

function approveThisOrderForThisHealthPost(_uri,healthPostId,pillsAmount,condomAmount,injectableAmount,implantAmount){
	//alert(_uri+":"+healthPostId+":"+pillsAmount+":"+condomAmount+":"+injectableAmount+":"+implantAmount);
	var divId = "processDiv"+_uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "approvethisorderforthishealthpost.jsp?_uri="+
			_uri+"&healthPostId="+healthPostId+"&pillsAmount="+pillsAmount+"&condomAmount="+condomAmount+
			"&injectableAmount="+injectableAmount+"&implantAmount="+implantAmount, true);
	xmlhttp.send();
}

function updateThisOrderForThisHealthPost(_uri,healthPostId,pillsAmount,condomAmount,injectableAmount,implantAmount){
	var divId = "processDiv"+_uri;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisorderforthishealthpost.jsp?_uri="+
			_uri+"&healthPostId="+healthPostId+"&pillsAmount="+pillsAmount+"&condomAmount="+condomAmount+
			"&injectableAmount="+injectableAmount+"&implantAmount="+implantAmount, true);
	xmlhttp.send();
}

function showListOfHEWs(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhews.jsp", true);
	xmlhttp.send();
}

function showListOfMothers(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmothers.jsp", true);
	xmlhttp.send();
}

function showListOfSchedules(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofschedules.jsp", true);
	xmlhttp.send();
}

function showListOfSchedulesForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofschedulesforedit.jsp", true);
	xmlhttp.send();
}

function showListOfSchedulesForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofschedulesfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisSchedule(scheduleId){
	if(window.confirm("Are you sure you want to delete this schedule?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisschedule.jsp?scheduleId="+scheduleId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisSchedule(scheduleId){
	var divId = "scheduleEditDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisschedule.jsp?scheduleId="+scheduleId, true);
	xmlhttp.send();
}

function updateSchedule(scheduleId,motherId,lastVisitDate,nextScheduleDate,actualVisitDate){
	var divId = "scheduleEditDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateschedule.jsp?scheduleId="+scheduleId+"&motherId="+motherId+"&lastVisitDate="+
			lastVisitDate+"&nextScheduleDate="+nextScheduleDate+"&actualVisitDate="+actualVisitDate, true);
	xmlhttp.send();
}

function showAddReminderFormForThisSchedule(scheduleId){
	var divId = "scheduleReminderDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddreminderformforthisschedule.jsp?scheduleId="+scheduleId, true);
	xmlhttp.send();
}

function showListOfRemindersForThisScheduleWithEditOption(scheduleId){
	var divId = "scheduleReminderDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofremindersforthisschedulewitheditoption.jsp?scheduleId="+scheduleId, true);
	xmlhttp.send();
}

function showListOfRemindersForThisScheduleWithDeleteOption(scheduleId){
	var divId = "scheduleReminderDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofremindersforthisschedulewithdeleteoption.jsp?scheduleId="+scheduleId, true);
	xmlhttp.send();
}

function deleteThisReminderMessage(reminderMessageId,scheduleId){
	if(window.confirm("Are you sure you want to delete this reminder for this schedule?")){
	var divId = "scheduleReminderDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "deletethisremindermessage.jsp?reminderMessageId="+reminderMessageId, true);
	xmlhttp.send();
	}
}

function showEditFieldsOfThisReminderMessage(reminderMessageId){
	var divId = "reminderEditDiv"+reminderMessageId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisremindermessage.jsp?reminderMessageId="+reminderMessageId, true);
	xmlhttp.send();
}


function updateReminderForThisSchedule(reminderMessageId,messageContent,isMessageSent,sentDate,isMessageDelivered,deliveredDate){
	//alert(reminderMessageId);
	var divId = "reminderEditDiv"+reminderMessageId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatereminderforthisschedule.jsp?reminderMessageId="+reminderMessageId+"&messageContent="+
			messageContent+"&isMessageSent="+isMessageSent+"&sentDate="+sentDate+"&isMessageDelivered="+isMessageDelivered+
			"&deliveredDate="+deliveredDate, true);
	xmlhttp.send();
}

function saveReminderForThisSchedule(scheduleId,messageContent,isMessageSent,sentDate,isMessageDelivered,deliveredDate){
	var divId = "scheduleReminderDiv"+scheduleId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savereminderforthisschedule.jsp?scheduleId="+scheduleId+"&messageContent="+messageContent+
			"&isMessageSent="+isMessageSent+"&sentDate="+sentDate+"&isMessageDelivered="+isMessageDelivered+"&deliveredDate="+deliveredDate, true);
	xmlhttp.send();
}

function showListOfMothersForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmothersforedit.jsp", true);
	xmlhttp.send();
}

function showListOfMothersForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmothersfordelete.jsp", true);
	xmlhttp.send();
}

function deleteMother(motherId){
	if(window.confirm("Are you sure you want to delete this mother?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletemother.jsp?motherId="+motherId, true);
		xmlhttp.send();
	}
}

function updateMother(motherId,motherFullName,houseNumberGote,preferredContraceptiveMethod,phoneNumber){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatemother.jsp?motherId="+motherId+"&motherFullName="+motherFullName+"&houseNumberGote="+houseNumberGote+
			"&preferredContraceptiveMethod="+preferredContraceptiveMethod+"&phoneNumber="+phoneNumber, true);
	xmlhttp.send();
}

function showEditMotherForm(motherId){
	var divId = "motherEditDiv"+motherId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditmotherform.jsp?motherId="+motherId, true);
	xmlhttp.send();
}

function showListOfHEWsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhewsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfHEWsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhewsfordelete.jsp", true);
	xmlhttp.send();
}

function updateHEW(hewId,firstName,fatherName,grandFatherName,mobileNumber,healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatehew.jsp?hewId="+hewId+"&firstName="+firstName+"&fatherName="+fatherName+
			"&grandFatherName="+grandFatherName+"&mobileNumber="+mobileNumber+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function deleteThisHEW(hewId){
	if(window.confirm("Are you sure you want to delete this HEW?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethishew.jsp?hewId="+hewId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisHEW(hewId){
	var divId = "hewEditDiv"+hewId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthishew.jsp?hewId="+hewId, true);
	xmlhttp.send();
}

function saveHEW(firstName,fatherName,grandFatherName,mobileNumber,healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savehew.jsp?firstName="+firstName+"&fatherName="+fatherName+
			"&grandFatherName="+grandFatherName+"&healthPostId="+healthPostId+"&mobileNumber="+
			mobileNumber, true);
	xmlhttp.send();
}

function showUserInnerMenu() {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('subTabDetailDiv').innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showuserinnermenu.jsp", true);
	xmlhttp.send();
}

function showInitializeInnerMenu(){
	if(window.confirm("Are you sure you want to initialize data values?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById('subTabDetailDiv').innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showinitializaeinnermenu.jsp", true);
		xmlhttp.send();
	}
}

function showAddUserForm() {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('userDiv').innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadduserform.jsp", true);
	xmlhttp.send();
}

function showListOfUsers(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('userDiv').innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusers.jsp", true);
	xmlhttp.send();
}

function showListOfUserForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('userDiv').innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusersforedit.jsp", true);
	xmlhttp.send();
}

function showListOfUserForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('userDiv').innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusersfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisUser(userId){
	if(window.confirm("Are you sure you want to delete this user?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById('userDiv').innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisuser.jsp?userId="+userId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisUser(userId){
	var divId = "userEditDiv"+userId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisuser.jsp?userId="+userId, true);
	xmlhttp.send();
}

function updateUser(userId,firstName,middleName,lastName,userType,healthInstituteId){
	//alert(userId+":"+firstName+":"+middleName+":"+lastName+":"+userType);
	var divId = "userEditDiv"+userId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateuser.jsp?userId="+userId+"&firstName="+firstName+"&middleName="+middleName+
			"&lastName="+lastName+"&userType="+userType+"&healthInstituteId="+healthInstituteId, true);
	xmlhttp.send();
}

function saveUser(firstName, middleName, lastName, userType, username, password,healthInistituteId) {
	 //alert(firstName+":"+middleName+":"+lastName+":"+userType+":"+username+":"+password);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveuser.jsp?firstName=" + firstName + "&middleName="
			+ middleName + "&lastName=" + lastName + "&userType=" + userType
			+ "&username=" + username + "&password=" + password+"&healthInistituteId="+healthInistituteId, true);
	xmlhttp.send();
}

function showTheHEWManagesHealthPostDropDown(userType){
	alert(userType);
	if(userType == "HEW" || userType == "HEW Supervisor" || userType == "Administrator"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("hcHpDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showthehewmanageshealthpostdropdown.jsp?userType="+userType, true);
		xmlhttp.send();
	}
}

function showChangeUsername() {
	// alert("leki");
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showchangeusernameform.jsp", true);
	xmlhttp.send();
}

function changeUsername(currentUsername, newUsername, password) {
	if (currentUsername == "") {
		document.getElementById('txtcurrentusername').style.borderColor = "red";
		document.getElementById('usernameErrorDiv').innerHTML = "<p class='msg warning'>Enter the current username!</p>";
		document.getElementById('txtcurrentusername').focus();
		return false;
	} else if (newUsername == "") {
		document.getElementById('txtcurrentusername').style.borderColor = "green";
		document.getElementById('txtnewusername').style.borderColor = "red";
		document.getElementById('usernameErrorDiv').innerHTML = "<p class='msg warning'>Enter the new username!</p>";
		document.getElementById('txtnewusername').focus();
		return false;
	} else if (password == "") {
		document.getElementById('txtnewusername').style.borderColor = "green";
		document.getElementById('txtpassword').style.borderColor = "red";
		document.getElementById('usernameErrorDiv').innerHTML = "<p class='msg warning'>Enter the password!</p>";
		document.getElementById('txtpassword').focus();
		return false;
	} else {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "changeusername.jsp?currentUsername="
				+ currentUsername + "&newUsername=" + newUsername
				+ "&password=" + password, true);
		xmlhttp.send();
	}
}

function showChangePassword() {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showchangepassword.jsp", true);
	xmlhttp.send();
}

function changePassword(currentUsername, currentPassword, newPassword,
		confirmPassword) {
	if (currentUsername == "") {
		document.getElementById('txtcurrentusername').style.borderColor = "red";
		document.getElementById('passwordErrorDiv').innerHTML = "<p class='msg warning'>Enter the current username</p>";
		document.getElementById('txtcurrentusername').focus();
		return false;
	} else if (currentPassword == "") {
		document.getElementById('txtcurrentpassword').style.borderColor = "red";
		document.getElementById('txtcurrentusername').style.borderColor = "green";
		document.getElementById('passwordErrorDiv').innerHTML = "<p class='msg warning'>Enter the current password!</p>";
		document.getElementById('txtcurrentpassword').focus();
		return false;
	} else if (newPassword == "") {
		document.getElementById('txtcurrentpassword').style.borderColor = "green";
		document.getElementById('txtnewpassword').style.borderColor = "red";
		document.getElementById('passwordErrorDiv').innerHTML = "<p class='msg warning'>Enter the new password!</p>";
		document.getElementById('txtnewpassword').focus();
		return false;
	} else if (confirmPassword == "") {
		document.getElementById('txtnewpassword').style.borderColor = "green";
		document.getElementById('txtconfirmpassword').style.borderColor = "red";
		document.getElementById('passwordErrorDiv').innerHTML = "<p class='msg warning'>Enter the confirmation password!</p>";
		document.getElementById('txtconfirmpassword').focus();
		return false;
	} else if (newPassword != confirmPassword) {
		document.getElementById('txtnewpassword').style.borderColor = "red";
		document.getElementById('txtconfirmpassword').style.borderColor = "red";
		document.getElementById('passwordErrorDiv').innerHTML = "<p class='msg warning'>New and confirmation password are not identical!</p>";
		document.getElementById('txtnewpassword').focus();
		return false;
	} else {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "changepassword.jsp?currentUsername="
				+ currentUsername + "&currentPassword=" + currentPassword
				+ "&newPassword=" + newPassword, true);
		xmlhttp.send();
	}
}

function showResetUsersAccount() {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaccountsforreset.jsp", true);
	xmlhttp.send();
}

function showResetFormForThisAccount(accountId) {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("accountResetDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showresetformforthisaccount.jsp?accountId="
			+ accountId, true);
	xmlhttp.send();
}

function resetThisAccount(accountId, resetedUsername, resetedPassword) {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "resetthisaccount.jsp?accountId=" + accountId
			+ "&resetedUsername=" + resetedUsername + "&resetedPassword="
			+ resetedPassword, true);
	xmlhttp.send();
}

function showCategoryInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showcategoryinnermenu.jsp", true);
	xmlhttp.send();
}

function showHealthCenterInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showhealthcenterinnermenu.jsp", true);
	xmlhttp.send();
}

function showItemReorderLevelInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showitemreorderlevelinnermenu.jsp", true);
	xmlhttp.send();
}

function showAddItemReorderLevelForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderLevelDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadditemreorderlevelform.jsp", true);
	xmlhttp.send();
}

function saveItemReorderLevel(stockId,itemCode,reorderLevel,emergencyReorderLevel){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderLevelDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveitemreorderlevel.jsp?stockId="+stockId+"&itemCode="+itemCode+"&reorderLevel="+reorderLevel+
			"&emergencyReorderLevel="+emergencyReorderLevel, true);
	xmlhttp.send();
}

function showListOfItemReorderLevels(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderLevelDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showstockselectoritemreorderlevel.jsp", true);
	xmlhttp.send();
}

function showListOfItemReorderLevelForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderLevelDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showstockselectoritemreorderlevelforedit.jsp", true);
	xmlhttp.send();
}

function showListOfItemReorderLevelForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderLevelDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showstockselectoritemreorderlevelfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfItemReorderLevelsForThisStock(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemreorderlevelsforthisstock.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function showListOfItemReorderLevelsForThisStockForEdit(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemreorderlevelsforthisstockforedit.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function showListOfItemReorderLevelsForThisStockForDelete(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemreorderlevelsforthisstockfordelete.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function deleteThisItemReorderLevel(reorderLevelId){
	if(window.confirm("Are you sure you want to delete this item reorder level?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("itemReorderDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisitemreorderlevel.jsp?reorderLevelId="+reorderLevelId, true);
		xmlhttp.send();
	}
}

function checkIfItemReorderLevelForThisItemOnThisStockIsAlreadyEntered(itemCode,stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			//alert(xmlhttp.responseText);
			if(xmlhttp.responseText == 1){
				//alert(xmlhttp.responseText);
				document.getElementById("buttonDiv").innerHTML = "<p class='msg warning'>This item has a reorder level set for it! Please use edit option to modify it!</p>"
				document.getElementById("saveButton").style.visibility = "hidden";
			}else{
				document.getElementById('buttonDiv').innerHTML = "";
				document.getElementById("saveButton").style.visibility = "visible";
			}
		}
	}
	xmlhttp.open("GET", "checkifitemreorderlevelforthisitemonthisstockisalreadyentered.jsp?itemCode="+itemCode+"&stockId="+
			stockId, true);
	xmlhttp.send();
}

function updateThisItemReorderLevel(reorderLevelId,itemReorderLevel,emergencyReorderLevel){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemReorderDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisitemreorderlevel.jsp?reorderLevelId="+reorderLevelId+"&itemReorderLevel="+
			itemReorderLevel+"&emergencyReorderLevel="+emergencyReorderLevel, true);
	xmlhttp.send();
}

function showEditFieldsOfThisItemReorderLevel(reorderLevelId){
	var divId = "reorderLevelEditDiv" + reorderLevelId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisitemreorderlevel.jsp?reorderLevelId="+reorderLevelId, true);
	xmlhttp.send();
}

function showItemInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showiteminnermenu.jsp", true);
	xmlhttp.send();
}

function showMainStoreInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showmainstoreinnermenu.jsp", true);
	xmlhttp.send();
}

function showItemsOnMainStoreInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showitemsonmainstoreinnermenu.jsp", true);
	xmlhttp.send();
}

function showItemsOnHealthPostStockInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showitemsonhealthpoststockinnermenu.jsp", true);
	xmlhttp.send();
}

function showAddItemOnHealthPostStockForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadditemonhealthpoststockform.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnHealthPost(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showhealthpoststockselectorbarform.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnHealthPostForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showhealthpoststockselectorbarformforedit.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnHealthPostForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showhealthpoststockselectorbarformfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfItemsForThisStock(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemsOnStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsforthisstock.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function showListOfItemsForThisStockForEdit(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemsOnStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsforthisstockforedit.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function showListOfItemsForThisStockForDelete(stockId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemsOnStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsforthisstockfordelete.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function deleteThisStockDetail(stockDetailId){
	if(window.confirm("Are you sure you want to delete this stock detail?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("itemsOnStockDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisstockdetail.jsp?stockDetailId="+stockDetailId, true);
		xmlhttp.send();
	}
}


function updateThisStockDetail(stockDetailId,qty){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemsOnStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisstockdetail.jsp?stockDetailId="+stockDetailId+"&qty="+qty, true);
	xmlhttp.send();
}

function showEditFieldsOfThisStockDetail(stockDetailId){
	var divId = "stockDetailEditDiv"+stockDetailId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisstockdetail.jsp?stockDetailId="+stockDetailId, true);
	xmlhttp.send();
}

function showRelateUserForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("userDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showrelateuserform.jsp", true);
	xmlhttp.send();
}

function relateThisUser(_uri,userId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("userDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "relatethisuser.jsp?_uri="+encodeURIComponent(_uri)+"&userId="+userId, true);
	xmlhttp.send();
}

function saveThisItemOnHealthPostStock(stockId,itemCode,quantity){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostStockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savethisitemonhealthpoststock.jsp?stockId="+stockId+"&itemCode="+itemCode+"&quantity="+quantity, true);
	xmlhttp.send();
}

function showStockInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showstockinnermenu.jsp", true);
	xmlhttp.send();
}

function showPhoneResponsibilityInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showphoneresponsibilityinnermenu.jsp", true);
	xmlhttp.send();
}

function showHealthPostInnerMenu(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showhealthpostinnermenu.jsp", true);
	xmlhttp.send();
}

function showListOfPhoneResponsibility(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofphoneresponsiblity.jsp", true);
	xmlhttp.send();
}

function showListOfPhoneResponsibilityForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofphoneresponsiblityfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisPhoneResponsiblity(respoId){
	if(window.confirm("Are you sure you want to delete this phone responsibility?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisphoneresponsibility.jsp?respoId="+respoId, true);
		xmlhttp.send();
	}
}

function showListOfPhoneResponsibilityForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofphoneresponsiblityforedit.jsp", true);
	xmlhttp.send();
}

function updatePhoneResponsibility(respoId,fullName,healthCenterId,jobDescription,phoneBrand,apparatusSerialNumber,
		batterySerialNumber,simPinNumber,phoneNumber,dateGivenOn,description,puk1,puk2){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatephoneresponsibility.jsp?respoId="+respoId+"&fullName="+fullName+"&healthCenterId="+
			healthCenterId+"&jobDescription="+jobDescription+"&phoneBrand="+phoneBrand+"&apparatusSerialNumber="+
			apparatusSerialNumber+"&batterySerialNumber="+batterySerialNumber+"&simPinNumber="+simPinNumber+
			"&phoneNumber="+phoneNumber+"&dateGivenOn="+dateGivenOn+"&description="+description+"&puk1="+puk1+
			"&puk2="+puk2, true);
	xmlhttp.send();
}

function showEditFieldsOfThisPhoneResponsiblity(respoId){
	var divId = "respoEditDiv" + respoId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisphoneresponsibility.jsp?respoId="+respoId, true);
	xmlhttp.send();
}

function showAddPhoneResponsibilityForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddphoneresponsibilityform.jsp", true);
	xmlhttp.send();
}

function savePhoneResponsibility(fullName,healthCenterId,jobDescription,phoneBrand,apparatusSerialNumber,
		batterySerialNumber,simPinNumber,phoneNumber,dateGivenOn,description,puk1,puk2){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("phoneResponsibilityDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savephoneresponsibility.jsp?fullName="+fullName+"&healthCenterId="+healthCenterId+
			"&jobDescription="+jobDescription+"&phoneBrand="+phoneBrand+"&apparatusSerialNumber="+apparatusSerialNumber+
			"&batterySerialNumber="+batterySerialNumber+"&simPinNumber="+simPinNumber+"&phoneNumber="+
			phoneNumber+"&dateGivenOn="+dateGivenOn+"&description="+description+"&puk1="+puk1+"&puk2="+puk2, true);
	xmlhttp.send();
}

function showAddCategoryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("categoryDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddcategoryform.jsp", true);
	xmlhttp.send();
}

function showAddMainStoreForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddmainstoreform.jsp", true);
	xmlhttp.send();
}

function showAddStockForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddstockform.jsp", true);
	xmlhttp.send();
}

function showListOfStock(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofstock.jsp", true);
	xmlhttp.send();
}

function showListOfStockForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofstockfordelete.jsp", true);
	xmlhttp.send();
}

function showListOfStockForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofstockforedit.jsp", true);
	xmlhttp.send();
}

function showEditFieldsOfThisStock(stockId){
	var divId = "stockEditDiv"+stockId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisstock.jsp?stockId="+stockId, true);
	xmlhttp.send();
}

function deleteThisStock(stockId){
	if(window.confirm("Are you sure you want to delete this stock?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisstock.jsp?stockId="+stockId, true);
		xmlhttp.send();
	}
}

function updateStock(stockId,stockName,healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatestock.jsp?stockId="+stockId+"&stockName="+stockName+"&healthPostId="+
			healthPostId, true);
	xmlhttp.send();
}

function showListOfMainStores(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmainstores.jsp", true);
	xmlhttp.send();
}

function showListOfMainStoresForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmainstoresfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisMainStore(mainStoreId){
	if(window.confirm("Are you sure you want to delete this main store?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethismainstore.jsp?mainStoreId="+mainStoreId, true);
		xmlhttp.send();
	}
}

function showListOfMainStoresForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofmainstoresforedit.jsp", true);
	xmlhttp.send();
}

function showEditFieldsOfThisMainStore(mainStoreId){
	var divId = "mainStoreEditDiv"+mainStoreId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthismainstore.jsp?mainStoreId="+mainStoreId, true);
	xmlhttp.send();
}

function updateMainStore(mainStoreId,mainStoreName,healthCenterId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatemainstore.jsp?mainStoreId="+mainStoreId+"&mainStoreName="+mainStoreName+
			"&healthCenterId="+healthCenterId, true);
	xmlhttp.send();
}

function saveMainStore(mainStoreName,healthCenterId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savemainstore.jsp?mainStoreName="+mainStoreName+
			"&healthCenterId="+healthCenterId, true);
	xmlhttp.send();
}

function saveStock(stockName,healthPostId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("stockDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savestock.jsp?stockName="+stockName+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showAddItemForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadditemform.jsp", true);
	xmlhttp.send();
}

function showAddItemOnMainStoreForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreItemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showadditemonmainstoreform.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnMainStore(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreItemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsonmainstore.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnMainStoreForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreItemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsonmainstoreforedit.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOnMainStoreForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreItemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsonmainstorefordelete.jsp", true);
	xmlhttp.send();
}

function showListOfItemsOfThisMainStore(mainStoreId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsofthismainstore.jsp?mainStoreId="+mainStoreId, true);
	xmlhttp.send();
}

function showListOfItemsOfThisMainStoreForEdit(mainStoreId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsofthismainstoreforedit.jsp?mainStoreId="+mainStoreId, true);
	xmlhttp.send();
}

function showListOfItemsOfThisMainStoreForDelete(mainStoreId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitemsofthismainstorefordelete.jsp?mainStoreId="+mainStoreId, true);
	xmlhttp.send();
}

function deleteThisMainStoreDetail(mainStoreDetailId){
	if(window.confirm("Are you sure you want to delete this main store detail?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("mainStoreDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethismainstoredetail.jsp?mainStoreDetailId="+mainStoreDetailId, true);
		xmlhttp.send();
	}
}

function updateMainStoreDetail(mainStoreDetailId,quantity){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatemainstoredetail.jsp?mainStoreDetailId="+mainStoreDetailId+"&quantity="+quantity, true);
	xmlhttp.send();
}

function showEditFieldsOfThisMainStoreDetail(mainStoreDetailId){
	var divId = "mainStoreDetailEditDiv"+mainStoreDetailId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthismainstoredetail.jsp?mainStoreDetailId="+mainStoreDetailId, true);
	xmlhttp.send();
}

function saveThisItemOnMainStore(mainStoreId,itemCode,quantity){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("mainStoreItemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savethisitemonmainstore.jsp?mainStoreId="+mainStoreId+"&itemCode="+itemCode+
			"&quantity="+quantity, true);
	xmlhttp.send();
}

function showListOfItems(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofitems.jsp", true);
	xmlhttp.send();
}

function saveItem(itemCode,itemName,categoryId,description){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("itemDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveitem.jsp?itemCode="+itemCode+"&itemName="+itemName+
			"&categoryId="+categoryId+"&description="+description, true);
	xmlhttp.send();
}

function showAddHealthCenterForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddhealthcenterform.jsp", true);
	xmlhttp.send();
}

function showAddHealthPostForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddhealthpostform.jsp", true);
	xmlhttp.send();
}

function showListOfHealthPosts(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthposts.jsp", true);
	xmlhttp.send();
}

function updateHealthPost(healthPostId,healthPostName,description,woreda,kebele,gote,healthCenterId,googleMapLocation){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatehealthpost.jsp?healthPostId="+healthPostId+"&healthPostName="+healthPostName+
			"&description="+description+"&woreda="+woreda+"&kebele="+kebele+"&gote="+gote+"&healthCenterId="+
			healthCenterId+"&googleMapLocation="+googleMapLocation, true);
	xmlhttp.send();
}

function showListOfHealthPostsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthpostsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfHealthPostsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthpostsfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisHealthPost(healthPostId){
	if(window.confirm("Are you sure you want to delete this health post?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethishealthpost.jsp?healthPostId="+healthPostId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisHealthPost(healthPostId){
	var divId = "healthPostEditDiv"+healthPostId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthishealthpost.jsp?healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function showListOfHealthCenters(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthcenters.jsp", true);
	xmlhttp.send();
}

function showListOfHealthCentersForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthcentersforedit.jsp", true);
	xmlhttp.send();
}

function showListOfHealthCentersForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofhealthcentersfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisHealthCenter(healthCenterId,healthCenterLocationId){
	var divId = "healthCenterDiv"+healthCenterLocationId;
	if(window.confirm("Are you sure you want to delete this health center?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethishealthcenter.jsp?healthCenterId="+healthCenterId, true);
		xmlhttp.send();
	}
}

function showEditFieldsOfThisHealthCenter(healthCenterId,healthCenterLocationId){
	var divId = "healthCenterDiv"+healthCenterLocationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthishealthcenter.jsp?healthCenterId="+healthCenterId, true);
	xmlhttp.send();
}

function updateHealthCenter(healthCenterId,healthCenterName,description,woreda,kebele,gote,googleMap,healthCenterLocationId){
	//alert(healthCenterId+":"+healthCenterName+":"+description+":"+woreda+":"+kebele+":"+gote+":"+googleMap);
	var divId = "healthCenterDiv"+healthCenterLocationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatehealthcenter.jsp?healthCenterId="+healthCenterId+"&healthCenterName="+healthCenterName+
			"&description="+description+"&woreda="+woreda+"&kebele="+kebele+"&gote="+gote+"&googleMap="+googleMap, true);
	xmlhttp.send();
}

function saveHealthCenter(healthCenterName,description,woreda,kebele,gote,googleMap){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthCenterDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savehealthcenter.jsp?healthCenterName="+healthCenterName+"&description="+
			description+"&woreda="+woreda+"&kebele="+kebele+"&gote="+gote+"&googleMap="+
			googleMap, true);
	xmlhttp.send();
}

function saveHealthPost(healthPostName,description,woreda,kebele,gote,healthCenterId,googleMap){
	//alert(healthPostName+":"+description+":"+woreda+":"+kebele+":"+gote+":"+healthCenterId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("healthPostDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savehealthpost.jsp?healthPostName="+healthPostName+"&description="+
			description+"&woreda="+woreda+"&kebele="+kebele+"&gote="+gote+"&healthCenterId="+healthCenterId+
			"&googleMap="+googleMap, true);
	xmlhttp.send();
}

function showItemCurrentQuantityIfAvailable(healthPostId,itemId,num){
	//alert(healthPostId+" : "+itemId+" : "+num);
	var slctName = "slctitem"+num;
	var itemId = document.getElementById(slctName).value;
	//alert(enteredQty+" : "+itemId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("errorDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showitemcurrentquantityifavailable.jsp?itemId="+itemId+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function crossCheckEnteredQuantityAgainstMainStoreQuantityForTheSelectedItem(enteredQty,num,healthPostId){
	var slctName = "slctitem"+num;
	var itemId = document.getElementById(slctName).value;
	//alert(enteredQty+" : "+itemId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("errorDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "crosscheckenteredquantityagainstmainstorequantityfortheselecteditem.jsp?enteredQty="+
			enteredQty+"&itemId="+itemId+"&healthPostId="+healthPostId, true);
	xmlhttp.send();
}

function saveGRV(healthPostId,itemId1,quantity1,expiryDate1,itemId2,quantity2,expiryDate2,
		itemId3,quantity3,expiryDate3,itemId4,quantity4,expiryDate4,hewId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savegrv.jsp?healthPostId="+healthPostId+"&itemId1="+itemId1+
			"&quantity1="+quantity1+"&expiryDate1="+expiryDate1+"&itemId2="+itemId2+
			"&quantity2="+quantity2+"&expiryDate2="+expiryDate2+"&itemId3="+itemId3+
			"&expiryDate3="+expiryDate3+"&quantity3="+quantity3+"&itemId4="+itemId4+
			"&expiryDate4="+expiryDate4+"&quantity4="+quantity4+"&hewId="+hewId, true);
	xmlhttp.send();
}

function saveOrder(healthPostId,itemId1,urgency1,quantity1,itemId2,urgency2,quantity2,
		itemId3,urgency3,quantity3,itemId4,urgency4,quantity4,hewId){
	/*alert(healthPostId+":"+itemId1+":"+urgency1+":"+quantity1+":"+itemId2+":"+urgency2+":"+quantity2+":"+
			itemId3+":"+urgency3+":"+quantity3+":"+itemId4+":"+urgency4+":"+quantity4);*/
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("hewDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveorder.jsp?healthPostId="+healthPostId+"&itemId1="+itemId1+
			"&urgency1="+urgency1+"&quantity1="+quantity1+"&itemId2="+itemId2+
			"&urgency2="+urgency2+"&quantity2="+quantity2+"&itemId3="+itemId3+
			"&urgency3="+urgency3+"&quantity3="+quantity3+"&itemId4="+itemId4+
			"&urgency4="+urgency4+"&quantity4="+quantity4+"&hewId="+hewId, true);
	xmlhttp.send();
}

function showListOfCategories(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("categoryDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlsitofcategories.jsp", true);
	xmlhttp.send();
}

function saveCategory(categoryCode,categoryName,description){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("categoryDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savecategory.jsp?categoryCode="+categoryCode+"&categoryName="+
			categoryName+"&description="+description, true);
	xmlhttp.send();
}

function hideOrderDetailForThisOrder(orderId){
	var divId = "orderDetailDiv" + orderId;
	document.getElementById(divId).innerHTML = "";
}

function showOrderDetailForThisOrder(orderId){
	var divId = "orderDetailDiv" + orderId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showorderdetailforthisorder.jsp?orderId="+orderId, true);
	xmlhttp.send();
}

