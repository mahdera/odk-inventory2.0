<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>First Name:</td>
			<td><input type="text" name="txtfirstname" id="txtfirstname"/></td>
		</tr>
		<tr>
			<td>Middle Name:</td>
			<td><input type="text" name="txtmiddlename" id="txtmiddlename"/></td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td><input type="text" name="txtlastname" id="txtlastname"/></td>
		</tr>
		<tr>
			<td>User Type:</td>
			<td>
				<select name="slctusertype" id="slctusertype" style="width:30%" onchange="showTheHEWManagesHealthPostDropDown(this.value);">
					<option value="" selected="selected">--Select--</option>
					<option value="Administrator">Administrator</option>
					<option value="Nurse">Nurse</option>
					<option value="HEW">HEW</option>				
					<option value="HEW Supervisor">HEW Supervisor</option>
				</select>
			</td>
		</tr>
		<tr>			
			<td colspan="2">
				<div id="hcHpDiv">
				</div>
			</td>
		</tr>
		<tr>
			<td>Username:</td>
			<td><input type="text" name="txtusername" id="txtusername"/></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="txtpassword" id="txtpassword"/></td>
		</tr>	
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveUser(document.getElementById('txtfirstname').value,
						document.getElementById('txtmiddlename').value,document.getElementById('txtlastname').value,
						document.getElementById('slctusertype').value,document.getElementById('txtusername').value,
						document.getElementById('txtpassword').value,document.getElementById('slcthealthinistitute').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>