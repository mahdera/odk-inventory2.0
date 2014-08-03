<%@page import="et.edu.aau.odkinventory.server.classes.*" %>

<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Health Center Name:</td>
			<td><input type="text" name="txthealthcentername" id="txthealthcentername"/></td>
		</tr>		
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="textareadescription" id="textareadescription" rows="3" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td>Woreda:</td>
			<td><input type="text" name="txtworeda" id="txtworeda"/></td>
		</tr>
		<tr>
			<td>Kebele:</td>
			<td><input type="text" name="txtkebele" id="txtkebele"/></td>
		</tr>
		<tr>
			<td>Gote:</td>
			<td><input type="text" name="txtgote" id="txtgote"/></td>
		</tr>
		<tr>
			<td>Google Map:</td>
			<td><textarea name="textareagooglemap" id="textareagooglemap" rows="3" cols="70"></textarea></td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveHealthCenter(document.getElementById('txthealthcentername').value,
						document.getElementById('textareadescription').value,document.getElementById('txtworeda').value,
						document.getElementById('txtkebele').value,document.getElementById('txtgote').value,
						document.getElementById('textareagooglemap').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table> 
</form>