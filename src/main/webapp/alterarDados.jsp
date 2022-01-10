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
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Projeto Datainfo - Alterar Dados</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Alterar Dados</h2>
				<div class="card">
					<div class="card-body">
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
						<%
						if (request.getParameter("pmensagem") != null) {
						%>
						<p class="font-weight-bold" style="color: black">
							<%=request.getParameter("pmensagem")%>
						</p>
						<%
						}
						%>
						<form id="formAlterarDados" method="post">
						
							<input hidden="true" name="idUsuario" id="idUsuario" value="<%=idUsuario%>">
							
							<div class="row mb-3">
								<label for="nome" class="col-sm-2 col-form-label">Nome:</label>
								<div class="col-sm-10">
									<input class="form-control" placeholder="Informe o seu nome"
										value="<%=u.getNome()%>" maxlength="200" minlength="3"
										type="text" name="nome" id="nome" required>
								</div>
							</div>

							<div class="row mb-3">
								<label for="email" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input class="form-control" placeholder="Informe o seu e-mail"
										value="<%=u.getEmail()%>" maxlength="200" minlength="3"
										type="email" name="email" id="email" required>
								</div>
							</div>

							<div class="row mb-3">
								<label for="senha" class="col-sm-2 col-form-label">Senha</label>
								<div class="col-sm-10">
									<input class="form-control" placeholder="Informe a senha"
										value="<%=u.getSenha()%>" maxlength="50" minlength="3"
										type="password" name="senha" id="senha" required>
								</div>
							</div>
							
							<button id="altDados" class="btn btn-primary">Salvar</button>
							<a href="inicio.jsp">
								<button class="btn btn-primary" type="button">Voltar</button>
							</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#altDados').click(function(event) {
			var idUsuario = $('#idUsuario').val();
			var nome = $('#nome').val();
			var senha = $('#senha').val();
			var email = $('#email').val();
			$.post('dados', {
				idUsuario : idUsuario,
				nome : nome,
				senha : senha,
				email : email,
			});
		});
	});
</script>
</html>