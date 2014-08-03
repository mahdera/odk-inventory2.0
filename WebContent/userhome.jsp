<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head>	
	<meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="content-language" content="en" /> 
	<meta name="robots" content="noindex,nofollow" /> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" /> <!-- RESET --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" /> <!-- MAIN STYLE SHEET --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" /> <!-- DEFAULT: 2 COLUMNS --> 
	<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" /> <!-- ALTERNATE: 1 COLUMN --> 
	<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]--> <!-- MSIE6 --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" /> <!-- GRAPHIC THEME -->	
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" /> <!-- WRITE YOUR CSS CODE HERE -->
	<link rel="stylesheet" media="print" type="text/css" href="css/print.css"/> 
	<script type="text/javascript" src="js/jquery.js"></script> 
	<script type="text/javascript" src="js/switcher.js"></script> 
	<script type="text/javascript" src="js/toggle.js"></script> 
	<script type="text/javascript" src="js/ui.core.js"></script> 
	<script type="text/javascript" src="js/ui.tabs.js"></script>
	<script type="text/javascript" src="js/ajax_functions.js"></script>
	<script src="datetimepicker/datetimepicker_css.js"></script>  
	
	<title>ODK Inventory System</title> 
	<link rel="shortcut icon" href="images/favicon.ico"/>
	<script src="sample/datetimepicker_css.js"></script>		     
</head> 
 
<body> 
 <%
	response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
	response.addHeader("Pragma", "no-cache"); 
	response.addDateHeader ("Expires", 0);
%>
<div id="main"> 
 	
 	
 	
	<!-- Tray -->
	<%@include file="tray.jsp" %> 	 
 
	<hr class="noscreen" /> 
 
	<%@include file="menuheader.jsp" %>
 
	<hr class="noscreen" /> 
 
	<!-- Columns --> 
	<div id="cols" class="box"> 
 
		<!-- Aside (Left Column) --> 
		<div id="aside" class="box"> 
 
			<%@include file="leftpaddingbox.jsp" %>
 
 			<%@include file="leftmenulists.jsp" %>
			
 
		</div> <!-- /aside --> 
 
		<hr class="noscreen" /> 
 
		<!-- Content (Right Column) --> 
		<div id="content" class="box"> 
			<div style="text-align:center">
			<span id="ajaxLoaderSpan" style="visibility:hidden">
 					<img src="design/loading.gif" border="0"/>
 			</span>
 			</div>
 				
 			<div id="searchResultDiv"></div>
 			<div id="operationStatusDiv">
 				<%
 					String msg = null;
 					msg = request.getParameter("msg");
 					if(msg != null){
 						out.print(msg);
 					}
 					
 				%>
 				<div id="reorderLevelReminderDiv"></div>
 			</div>		 
		</div> <!-- /content --> 
 
	</div> <!-- /cols --> 
 
	<hr class="noscreen" /> 
 
	<!-- Footer --> 
	<%@include file="footer.jsp" %> 
 
</div> <!-- /main --> 
 
</body> 
</html>