<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoFinal.persistence.UsuarioDao"%>
<%@page import="br.com.projetoFinal.model.Usuario"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/alterarDados.css">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
<title>Projeto Datainfo - Alterar Dados</title>
</head>
<body>
	<div id="tela-dados">
		<h1 id="logo">Cadastrar Telefone</h1>
		<hr>
		<%
		// INSTANCIA DE TODOS OS USUÁRIOS DO SISTEMA PARA REALIZAR O CADASTRO DE UM TELEFONE
		UsuarioDao user = new UsuarioDao();
		List<Usuario> usuarios = user.findAll();
		%>
		<form action="telefone" method="post">
			<input hidden="true" id="idUsuario">

			<div class="labels">
				<label for="tipo">Nome:</label>
				<div class="inputs">
				<!-- MOSTRA TODOS OS USUÁRIOS CADASTRADOS NO BANCO DE DADOS  -->
					<select name="idUsuario" required>
						<%	for (Usuario u : usuarios) {	%>
						<option value="<%=u.getId()%>">
							<%=u.getNome()%>
						</option>
						<%	}	%>
					</select>
				</div>
			</div>

			<div class="labels">
				<label for="ddd">DDD:</label>
				<div class="inputs">
					<input class="form" placeholder="DDD" class="number" type="number" name="ddd" min="11" max="99" required>
				</div>
			</div>

			<div class="labels">
				<label for="numero">Número:</label>
				<div class="inputs">
					<input class="form" placeholder="Informe o número"  type="number" name="numero" min="11111111" max="999999999" required>
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