<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.projetoFinal.persistence.TelefoneDao"%>
<%@ page import="br.com.projetoFinal.model.Telefone"%>
<%@ page import="br.com.projetoFinal.model.Usuario"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/usuario.css">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
<title>Projeto Datainfo - Seja bem-vindo</title>
</head>
<body>
	<%
	// INSTANCIA DO TELEFONE PARA GERAR TODOS OS TELEFONES CADASTRADOS NO BANCO DE DADOS
	TelefoneDao telefone = new TelefoneDao();
	List<Telefone> tels = telefone.findAll();
	%>
	<div id="tela-inicial">
		<h1 id="logo">Lista com todos os telefones</h1>
		<hr>
		<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
		<%	if (request.getParameter("pmensagem") != null) {	%>
		<p class="font-weight-bold" style="color: black">
			<%=request.getParameter("pmensagem")%>
		</p>
		<%	}	%>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">DDD</th>
					<th scope="col">Número</th>
					<th scope="col">Tipo</th>
					<th scope="col">Nome</th>
					<th scope="col">Editar</th>
					<th scope="col">Excluir</th>
				</tr>
			</thead>
			<tbody>
				<%	for (Telefone t : tels) {	%>
				<tr>	
					<td><%= t.getDdd()	%></td>
					<td><%= t.getNumero()%></td>
					<td><%= t.getTipo()	%></td>
					<td><%= t.getNomeUsuario()%></td>
					<td><%= "<a class='btn' href=alterarTelefone.jsp?idTelefone=" + t.getId() + ">" + "<i class='far fa-edit'></i></a>"	%></td>
					<td><%= "<a class='btn' href=excluirTelefone?idTelefone=" + t.getId() + ">" + "<i class='fas fa-trash-alt'></i></a>"%></td>
						<% t.getIdUsuario(); %>
						<%	t.getId(); %>
				</tr>
				<%}%>
			</tbody>
		</table>
		<a href="inicio.jsp"> <button id="botao-cadastro">Voltar</button></a>
	</div>
	<script src="https://kit.fontawesome.com/941d2c80e7.js"	crossorigin="anonymous"></script>
</body>
</html>