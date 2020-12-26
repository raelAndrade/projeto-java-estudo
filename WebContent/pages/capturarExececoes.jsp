<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Capturar Execeções</title>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	
	<h3>Capturar Execeções com jQuery</h3>
	
	<input type="text" value="Valor informado" id="txtvalor" />
	<input type="button" onclick="testarExcecao();" value="Testar Exceção" />
	
</body>

	<script type="text/javascript">
		
		function testarExcecao(){
			valorInformado = $('#txtvalor').val();
			
			$.ajax({
					method: "POST",
					url: "capturarExcecao", // para qual servlet?
					data: { valorParam : valorInformado } // os valores que serão enviados
				}).done(function(response){ // Resposta Ok - nenhum erro
					alert("Sucesso: " + response);
					// Fazer algo
					
				}).fail(function(xhr, status, errorThrown){ // Resposta erro - algum problema ocorreu
					alert("Erro: " + xhr.responseText); // Mostra a resposta do servidor
					
					// Fazer algo se der errado
					
				// }).always(function(response){ // sempre capta o retorno
					//alert(response);
			});
		}
	
	</script>

</html>