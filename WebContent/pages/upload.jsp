<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<form enctype="multipart/form-data">
		<input type="file" id="file" name="fileUpload" onchange="uploadFile();" />
		<img alt="Imagem" id="target" width="200" height="200">
	</form>
	
	<br />
	<br />
	
	<a href="fileUpload?acao=carregar">Carregar imagens</a>
	
	<br />
	<br />
	
	<table>
		<c:forEach var="user" items="${listaUserImagem }">
			<tr>
				<td>${user.id }</td>
				<td>${user.login }</td>
				<td><a target="_blank" href="fileUpload?acao=download&iduser=${user.id }">Download Imagem</a></td>
				
			</tr>
		</c:forEach>
	</table>
	
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
</body>


</html>