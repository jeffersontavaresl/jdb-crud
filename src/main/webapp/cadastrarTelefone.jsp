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
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<title>Projeto Datainfo - Cadastrar Telefone</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Cadastrar Telefone</h2>
				<div class="card">
					<div class="card-body">
						<%
						// INSTANCIA DE TODOS OS USUÁRIOS DO SISTEMA PARA REALIZAR O CADASTRO DE UM TELEFONE
						UsuarioDao user = new UsuarioDao();
						List<Usuario> usuarios = user.findAll();
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
						<form id="formTel" method="post">
													
							<div class="row mb-3">
								<label for="nome" class="col-sm-2 col-form-label">Nome</label>
								<div class="col-sm-10">
									<select class="form-select" id="idUsuario" name="idUsuario" required>
										<!-- MOSTRA TODOS OS USUÁRIOS CADASTRADOS NO BANCO DE DADOS  -->
										<%
										for (Usuario u : usuarios) {
										%>
										<option value="<%=u.getId()%>">
											<%=u.getNome()%>
										</option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						
							<div class="row mb-3">
								<label for="ddd" class="col-sm-2 col-form-label">DDD</label>
								<div class="col-sm-10">
									<input class="form-control" placeholder="DDD" type="number" id="ddd" name="ddd"
										min="11" max="99" required>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="numero" class="col-sm-2 col-form-label">Numero</label>
								<div class="col-sm-10">
									<input class="form-control" placeholder="Informe o número"
										type="number" min="11111111" max="999999999" id="numero" name="numero"
										required>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="numero" class="col-sm-2 col-form-label">Tipo</label>
								<div class="col-sm-10">
									<select name="tipo" id="tipo" class="form-select">
										<option value="Comercial">Comercial</option>
										<option value="Privado">Privado</option>
									</select>
								</div>
							</div>
							<button id="addTel" class="btn btn-primary">Salvar</button>
							<a href="inicio.jsp"><button type="button" class="btn btn-primary">Voltar</button></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#addTel').click(function(event) {
			var idUsuario = $('#idUsuario').val();
			var ddd = $('#ddd').val();
			var numero = $('#numero').val();
			var tipo = $('#tipo').val();
			$.post('telefone', {
				idUsuario : idUsuario,
				ddd : ddd,
				numero : numero,
				tipo : tipo,
			});
		});
	});
</script>
</html>