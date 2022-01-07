<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.projetoFinal.persistence.UsuarioDao"%>
<%@ page import="br.com.projetoFinal.model.Usuario"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Projeto Datainfo - Seja bem-vindo</title>
</head>
<body>
	<%
	// INSTACIA DOS USUÁRIOS PARA PROCURAR TODOS OS USUÁRIOS CADASTRADOS NO BANCO DE DADOS
	UsuarioDao usuario = new UsuarioDao();
	List<Usuario> users = usuario.findAll();
	%>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<h2>Consulta Todos Usuários</h2>
				<div class="card" style="width: 68rem;">
					<div class="card-body">
						<!-- GERA A MENSAGEM DE CONFIRMAÇÃƒO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
						<%
						if (request.getParameter("pmensagem") != null) {
						%>
						<p class="font-weight-bold" style="color: black">
							<%=request.getParameter("pmensagem")%>
						</p>
						<%
						}
						%>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Nome</th>
									<th scope="col">E-mail</th>
									<th scope="col">Editar</th>
									<th scope="col">Excluir</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<%
									for (Usuario u : users) {
									%>
									<td><%=u.getId()%></td>
									<td><%=u.getNome()%></td>
									<td><%=u.getEmail()%></td>
									<td><%="<a class='btn' href=alterarDados.jsp?idUsuario=" + u.getId() + ">" + "<i class='far fa-edit'></i></a>"%></td>
									<td><%="<a class='btn' href=excluir?idUsuario=" + u.getId() + ">" + "<i class='fas fa-trash-alt'></i></a>"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<a href="inicio.jsp">
							<button class="btn btn-primary">Voltar</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/941d2c80e7.js"
		crossorigin="anonymous"></script>
</body>
</html>