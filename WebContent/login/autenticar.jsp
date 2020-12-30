<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autenticação</title>
</head>
<body>

	<h3>Autenticar usuário ...</h3>
	
	<form action="servletAutenticacao" method="post">
		
		<input type="hidden" name="url" value="<%= request.getParameter("url") %>" readonly="readonly" />
	
		<label for="login">Login:</label>
		<input type="text" id="login" name="login" />
		<br />
		
		<label for="senha">Senha:</label>
		<input type="password" id="senha" name="senha" />
 
		<br />
		
		<input type="submit" id="logar" name="logar" value="Logar" />
		
	</form>
	
</body>
</html>