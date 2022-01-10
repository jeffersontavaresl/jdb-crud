<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.projetoFinal.persistence.UsuarioDao"%>
<%@page import="br.com.projetoFinal.persistence.TelefoneDao"%>
<%@page import="br.com.projetoFinal.model.Usuario"%>
<%@page import="br.com.projetoFinal.model.Telefone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>Projeto Datainfo</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row"><br>
			<div class="col-12">
				<h2>Inicio</h2>
				<div class="card">
					<div class="card-body">
						<form action="inicio.jsp" method="post">
							<%
							// PEGA O PARÂMETRO DO ID DO USUARIO QUE SERÁ INFORMADO NO FORM ABAIXO.
							String idUsuario = request.getParameter("id");
							Integer id = 0;

							// FAZ A VERIFICAÇÃO DO USÚARIO E PROCURA O USÚARIO NO BANCO DE DADOS
							List<Usuario> usuarios = new ArrayList<>();
							List<Usuario> usuario = new ArrayList<>();

							UsuarioDao user = new UsuarioDao();
							if (idUsuario != null) {
								id = Integer.valueOf(idUsuario);
								usuarios = user.findAllTel(id);
								usuario = user.findByIdList(id);
							}
							List<Usuario> users = user.findAll();
							%>
							<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
							<%
							if (request.getParameter("pmensagem") != null) {
							%>
							<p class="font-weight-bold" style="color: black">
								<%=request.getParameter("pmensagem")%>
							</p>
							<%
							}
							%>

							<!-- LISTA COM TODOS OS USUÁRIOS CADASTRADOS -->
							<div class="col-12">
								<label for="usuarios">Usuários</label> 
								 <select
									class="form-select" name="id" id="usuarios">
									<%
									for (Usuario u : users) {
									%>
									<option value="<%=u.getId()%>">
										<%=u.getNome()%>
									</option>
									<%
									}
									%>
								</select><br>
							</div>
						<button class="btn btn-primary" type="submit">Consultar Usuário</button> 
						<a href="logout"> <button class="btn btn-danger" type="button">Logout</button></a>					
						</form>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Nome</th>
									<th scope="col">E-mail</th>
									<th scope="col">Telefone(s)</th>
									<th scope="col">Editar</th>
									<th scope="col">Excluir</th>
								</tr>
							</thead>
							<tbody>

								<!-- PRINT DOS DADOS DO USUÁRIO INFORMADO PARA A CONSULTA -->
								<%
								for (Usuario u : usuario) {
								%>
								<tr id="tabela">
									<%
									Integer idUsuarios = u.getId();
									%>
									<td><%=u.getNome()%></td>
									<td><%=u.getEmail()%></td>
									<td>
									<div class="col-12">
										<select	class="form-select">
										<%
										for (Usuario t : usuarios) {
										%>
										<option value="">
											<!-- PRINT DO NUMERO -->
											<%=t.getTelefone().toString().replace("[", "").replace("]", "")%>
										</option>
										<%
										}
										%>
										</select>
									</div>
									</td>
									<td><%="<a class='btn' href=alterarDados.jsp?idUsuario=" + u.getId() + ">" + "<i class='far fa-edit'></i></a>"%></td>
									<td><%="<a class='btn' href=excluir?idUsuario=" + u.getId() + ">" + "<i class='fas fa-trash-alt'></i></a>"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<a href="usuario.jsp"><button class="btn btn-primary">Consultar Todos Usuários</button></a> 
						<a href="consultarTelefone.jsp"><button type="button" class="btn btn-primary">Consultar Telefones</button></a>
						<a href="telefone"><button	class="btn btn-primary" type="button">Cadastrar Telefone</button></a>
						<button class="btn btn-warning">Limpar busca</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/941d2c80e7.js"
		crossorigin="anonymous"></script>
	<!--  SCRIPT JQUERY PARA LIMPAR OS DADOS DA TELA -->
	<script>
	$(document).ready(function() {
		$("button").click(function() {
			$("#tabela").remove();
		});
	});
	</script>
</body>
</html>