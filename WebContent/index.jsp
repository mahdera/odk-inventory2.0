
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="en" />
<meta name="robots" content="noindex,nofollow" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/reset.css" />
<!-- RESET -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/main.css" />
<!-- MAIN STYLE SHEET -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/2col.css" title="2col" />
<!-- DEFAULT: 2 COLUMNS -->
<link rel="alternate stylesheet" media="screen,projection"
	type="text/css" href="css/1col.css" title="1col" />
<!-- ALTERNATE: 1 COLUMN -->
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<!-- MSIE6 -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/style.css" />
<!-- GRAPHIC THEME -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/mystyle.css" />
<!-- WRITE YOUR CSS CODE HERE -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/switcher.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.tabs.js"></script>
<script type="text/javascript" language="javascript"
	src="js/ajax_functions.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".tabs > ul").tabs();
	});
</script>
<title>ODK Inventory System</title>
<link rel="shortcut icon" href="images/favicon.ico"/>
</head>

<body>

	<div id="main">

		<!-- Tray -->
		<%@include file="indextray.jsp"%>

		<hr class="noscreen" />

		<%@include file="indexmenuheader.jsp"%>

		<hr class="noscreen" />

		<!-- Columns -->
		<div id="cols" class="box">

			<!-- Aside (Left Column) -->
			<div id="aside" class="box">

				<%@include file="indexleftpaddingbox.jsp"%>




			</div>
			<!-- /aside -->

			<hr class="noscreen" />

			<!-- Content (Right Column) -->
			<div id="content" class="box">
				<!-- the main container div mahder -->
					<table border="1" width="100%">
						<tr style="background:#eeeeee">
							<td colspan="2"><strong><font size="5">ODK-Inventory-2.0 | Open Data Kit Inventory Management System</font></strong></td>							
						</tr>
						<tr>
							<td colspan="1" width="50%" align="center">
								<!-- <h1><a href="indexzion.jsp">Active Student System</a></h1> -->
							</td>
							<!-- <td width="50%" align="center">
								<h1><a href="#.jsp">Archive System</a></h1>
							</td> -->
						</tr>
						<!-- <tr>
							<td colspan="2">
								<br/><br/><br/><br/><br/><br/>
								<br/><br/><br/><br/><br/><br/>
								<br/><br/><br/><br/><br/><br/>
							</td>
						</tr> -->
						<tr>
							<td>
								<h4>The Application Does the following main functionalities:</h4>
								<h5><ul>
									<li>Health Center Management</li>
									<li>Health Post Management</li>
									<li>HEW Profile Management</li>
									<li>Category Management</li>
									<li>Item Management</li>
									<li>GRV (Goods Receiving Voucher) Management</li>
									<li>GIV (Goods Issuance Voucher) Management</li>
									<li>Expiry Date Report</li>									
								</ul></h5>
							</td>
							<!-- <td>
								<h4>Click on <font color="blue">"Archive System"</font> to manage student archive information
								in the system. The following are some of the functionalities of this system:</h4>
								<h5><ul>
									<li>Student Record Information</li>
									<li>Attaching Transcript to the System</li>
									<li>Medium of Instruction Report</li>
									<li>To Whom it May Concern Report</li>
									<li>Temporary Transcripts</li>
									<li>Student Name Management</li>
									<li>Transcript Report (Official Transcript)</li>
									<li>Transfer Letter Report</li>
									<li>Replacing Lost/Damaged Documents</li>
								</ul></h5>
							</td> -->
						</tr>
					</table>								
				</div>
			</div>
			<!-- /content -->

		</div>
		<!-- /cols -->

		<hr class="noscreen" />

		<!-- Footer -->
		<%@include file="footer.jsp"%>

	</div>
	<!-- /main -->

</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtusername').focus();
	});//end document.ready function
</script>
</html>