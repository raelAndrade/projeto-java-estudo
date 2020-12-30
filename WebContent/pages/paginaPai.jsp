<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Load jQuery - Página Pai</title>

<script src="../resources/js/jquery.min.js" type="text/javascript"></script>

</head>
<body>

	<h2>Página pai load jQuery</h2>
	<input type="button" value="Carregar página" onclick="carregar();" />
	
	<div id="mostrarPaginaFilha"></div> <!-- Local de carregamento da página filha -->

</body>

<script type="text/javascript">
	
	function carregar(){
		$('#mostrarPaginaFilha').load('paginaFilha.jsp'); // Load página em jQuery
	}

</script>
</html>