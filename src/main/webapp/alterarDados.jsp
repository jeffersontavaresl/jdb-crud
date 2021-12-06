<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.projetoFinal.model.Usuario"%>
<%@ page import="br.com.projetoFinal.persistence.UsuarioDao"%>
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
		<h1 id="logo">Alterar Dados</h1>
		<hr>
		<%
		
		// RECEBE O ID QUE FOI PASSADO NA PÁGINA DE CONSULTA DE USUÁRIOS E BUSCA NO BANCO DE DADOS
		String idUsuario = request.getParameter("idUsuario");
		Usuario u = new Usuario();
		UsuarioDao uDao = new UsuarioDao();
		if (idUsuario != null) {
			u = uDao.findById(Integer.valueOf(idUsuario));
		}
		%>
		<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
		<%	if (request.getParameter("pmensagem") != null) {	%>
		<p class="font-weight-bold" style="color: black">
			<%=request.getParameter("pmensagem")%>
		</p>
		<%	}	%>
		<form action="dados" method="post">
			<input hidden="true" name="idUsuario"	value="<%= idUsuario%>">

			<div class="labels">
				<label for="nome">Nome:</label>
				<div class="inputs">
					<input class="form" placeholder="Informe o seu nome"	value="<%=u.getNome()%>" maxlength="200" minlength="3" type="text"	name="nome" required>
				</div>
			</div>

			<div class="labels">
				<label for="email">E-mail:</label>
				<div class="inputs">
					<input class="form" placeholder="Informe o seu e-mail"	value="<%=u.getEmail()%>" maxlength="200" minlength="3"	type="email" name="email" required>
				</div>
			</div>

			<div class="labels">
				<label for="senha">Senha:</label>
				<div class="inputs">
					<input class="form" placeholder="Informe a senha"	value="<%=u.getSenha()%>" maxlength="50" minlength="3"	type="password" name="senha" required>
				</div>
			</div>

			<input id="botao-cadastro" type="submit" value="Salvar">
			<a href="inicio.jsp"> <button id="botao-cadastro" type="button">Voltar</button></a>
		</form>
	</div>
</body>
</html>