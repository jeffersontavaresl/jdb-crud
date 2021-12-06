<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/alterarDados.css">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
<title>Projeto Datainfo - Alterar Telefone</title>
</head>
<body>
	<div id="tela-dados">
		<h1 id="logo">Alterar Telefone</h1>
		<hr>
		<%
		// RECEBE O ID DO TELEFONE QUE FOI PASSADO NA TELA DE CONSULTA
		String idTelefone = request.getParameter("idTelefone");
		%>
		<form action="alterarTelefone" method="post">
			<input hidden="true" name="idTelefone"	value="<%=idTelefone%>">
			
			<div class="labels">
				<label for="ddd">DDD:</label>
				<div class="inputs">
					<input class="form" placeholder="DDD" type="number" name="ddd" min="11"	max="99" required>
				</div>
			</div>

			<div class="labels">
				<label for="numero">Número:</label>
				<div class="inputs">
					<input class="form" placeholder="Informe o número" type="number" min="11111111" max="999999999" name="numero" required>
				</div>
			</div>

			<div class="labels">
				<label for="tipo">Tipo:</label>
				<div class="inputs">
					<select class="form" name="tipo" required>
						<option value="Comercial">Comercial</option>
						<option value="Residencial" selected>Residencial</option>
						<option value="Privado">Privado</option>
					</select>
				</div>
			</div>
			<a href="inicio.jsp"> <button id="botao-cadastro" type="button">Voltar</button></a>
			<input id="botao-cadastro" type="submit" value="Salvar">
		</form>
	</div>
	<script src="https://kit.fontawesome.com/941d2c80e7.js"	crossorigin="anonymous"></script>
</body>
</html>