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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Projeto Datainfo - Seja bem-vindo</title>
</head>
<body>
	<%
	// INSTANCIA DO TELEFONE PARA GERAR TODOS OS TELEFONES CADASTRADOS NO BANCO DE DADOS
	TelefoneDao telefone = new TelefoneDao();
	List<Telefone> tels = telefone.findAll();
	%>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Consultar Telefones</h2>
				<div class="card">
					<div class="card-body">

						<!-- GERA A MENSAGEM DE CONFIRMA��O QUANDO OCORRE ALGUMA ALTERA��O -->
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
									<th scope="col">DDD</th>
									<th scope="col">N�mero</th>
									<th scope="col">Tipo</th>
									<th scope="col">Nome</th>
									<th scope="col">Editar</th>
									<th scope="col">Excluir</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Telefone t : tels) {
								%>
								<tr>
									<td><%=t.getDdd()%></td>
									<td><%=t.getNumero()%></td>
									<td><%=t.getTipo()%></td>
									<td><%=t.getNomeUsuario()%></td>
									<td><%="<a class='btn' href=alterarTelefone?idTelefone=" + t.getId() + "&idUsuario=" + t.getIdUsuario() + ">" + "<i class='far fa-edit'></i></a>"%></td>
									<td><%="<a class='btn' href=excluirTelefone?idTelefone=" + t.getId() + ">" + "<i class='fas fa-trash-alt'></i></a>"%></td>
									<%
									t.getIdUsuario();
									%>
									<%
									t.getId();
									%>
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