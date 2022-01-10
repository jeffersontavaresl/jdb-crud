<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Projeto Datainfo - Alterar Telefone</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Alterar Telefone</h2>
				<div class="card">
					<div class="card-body">
						<%
						// RECEBE O ID DO TELEFONE QUE FOI PASSADO NA TELA DE CONSULTA
						String idUsuario = request.getParameter("idUsuario");
						String idTelefone = request.getParameter("idTelefone");
						%>
						<form id="formAlterarTelefone" method="post">
						<input hidden="true" id="idUsuario" name= "idUsuario" value="<%=idUsuario%>">
						<input hidden="true" id="idTelefone" name="idTelefone" value="<%=idTelefone%>">
						
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
										type="number" id="numero" min="11111111" max="999999999" name="numero"
										required>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="numero" class="col-sm-2 col-form-label">Numero</label>
								<div class="col-sm-10">
									<select name="tipo" id="tipo" class="form-select">
										<option value="Comercial">Comercial</option>
										<option value="Privado">Privado</option>
									</select>
								</div>
							</div>

							<button id="alterarTel" class="btn btn-primary">Salvar</button>
							<a href="inicio.jsp"><button type="button" class="btn btn-primary">Voltar</button></a>
						</form>
						
						<script src="https://kit.fontawesome.com/941d2c80e7.js"
							crossorigin="anonymous"></script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#alterarTel').click(function(event) {
			var idTelefone = $('#idTelefone').val();
			var ddd = $('#ddd').val();
			var numero = $('#numero').val();
			var tipo = $('#tipo').val();
			$.post('alterarTelefone', {
				idTelefone : idTelefone,
				ddd : ddd,
				numero : numero,
				tipo : tipo,
			});
		});
	});
</script>
</html>