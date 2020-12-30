<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload files</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<script src="../resources/js/jquery.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<h2>Upload de files</h2>
	
	<input type="file" id="file" name="fileUpload" onchange="uploadFile();" />
	<img alt="Imagem" src="" id="target" width="200" height="200">
	
</body>

<script type="text/javascript">

	function uploadFile(){
		
		var target = document.querySelector('img');
		var file = document.querySelector('input[type=file]').files[0];
		
		var reader = new FileReader();
		
		reader.onloadend = function(){
			
			target.src = reader.result;
			
			// ----------- Upload Ajax --------------
			$.ajax({
				method: "POST",
				url: "fileUpload",
				data: { fileUpload: reader.result }
			}).done(function(response){
				alert("Sucesso: " + response);
				
			}).fail(function(xhr, status, errorThrown){
				alert("Error: " + xhr.responseText);
			});
			// --------------------------------------
		};
		
		if(file) {
			reader.readAsDataURL(file);
			
		}else {
			target.src = "";
		}
		
	}

</script>

</html>