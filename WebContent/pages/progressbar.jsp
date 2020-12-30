<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Barra de progresso</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<script src="../resources/js/jquery.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	
	/* 	Fundo da barra de progresso - cor cinza */
	#myProgress { 
		width: 100%;
		background-color: #ddd; 
	}

	/* 	Cor da barra de progresso	 */
	#myBar {
		width: 1%;
		height: 30px;
		background-color: #4CAF50;
	}
	
	.ui-progressbar {
		position: relative;
	}
	
	.progress-label {
		position: relative;
		left: 50%;
		top: 4px;
		font-weight: bold;
		text-shadow: 1px 1px 0 #fff;
	}

</style>



</head>
<body>

	<h2>Exemplo com javascript</h2>
	
	<div id="myProgress"> <!-- Fundo da barra -->
		<div id="myBar"> <!-- Barra de progresso -->
			
		</div>
	</div>

	<br />

	<button onclick="exibirBarra()">Iniciar a barra de progresso</button>
	
	<br />
	
	<h2>Barra de progresso com jQuery</h2>
	
	<div id="progressbar">
		<div class="progress-label">
			Carregando ...
		</div>
	</div>
	
	<script type="text/javascript">

		// Script da barra de progresso por jQuery
		$(function (){
			
			var progressbar = $('#progressbar'), progresslabel = $('.progress-label');
			 
			progressbar.progressbar({ // Cria a barra no div
				value : false,
				change : function(){
					progresslabel.text(progressbar.progressbar('value') + "%");
				},
				complete: function(){
					progresslabel.text('Completo!');
				}
			});
			
			function progress(){
				var val = progressbar.progressbar("value") || 0;
				
				progressbar.progressbar("value", val + 2);
				
				if(val < 99){
					setTimeout(progress, 80);
				}
			}
			
			// Chamado ao abrir a tela
			setTimeout(progress, 2000);
		});
	
		// Script da barra de progresso por javascript
		function exibirBarra(){
			var elem = document.getElementById("myBar");
			var width = 1;
			var id = setInterval(frame, 10);
			
			function frame(){
				if(width >= 100){
					clearInterval(id);
				}else{
					width++;
					elem.style.width = width + "%";
				}
			}
		}
	
	</script>
</body>

</html>