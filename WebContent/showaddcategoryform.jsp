<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Category Code:</td>
			<td><input type="text" name="txtcategorycode" id="txtcategorycode"/></td>
		</tr>
		<tr>
			<td>Category Name:</td>
			<td><input type="text" name="txtcategoryname" id="txtcategoryname"/></td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="textareadescription" id="textareadescription" rows="3" cols="70"></textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveCategory(document.getElementById('txtcategorycode').value,
						document.getElementById('txtcategoryname').value,document.getElementById('textareadescription').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table> 
</form>