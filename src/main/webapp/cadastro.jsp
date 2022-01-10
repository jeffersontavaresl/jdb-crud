<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Projeto Datainfo - Cadastro</title>
</head>
<body>
	<div class="container">		
		<div class="row">
			<div class="col-12">
				<h2>Cadastro</h2>
				<div class="card">
					<div class="card-body">
						<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO  -->
						<%	if (request.getParameter("pmensagem") != null) {	%>
						<p class="font-weight-bold" style="color: black">	
						<%=request.getParameter("pmensagem")%>
						</p>
						<%	}	%>					
						<form id="formCadastro" method="post">
							<div class="row mb-3">
								<label  class="col-sm-2 col-form-label" for="nome">Nome:</label>
								<div class="col-sm-10">
									<input type="text" name="nome" id="nome" minlength="3" maxlength="200" required
										class="form-control" id="nome">
								</div>
							</div>
							
							<div class="row mb-3">	
								<label  class="col-sm-2 col-form-label" for="email">Email:</label>
								<div class="col-sm-10">
									<input type="email" name="email"nminlength="3" maxlength="200" required
										class="form-control" id="email">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="senha" class="col-sm-2 col-form-label">Senha</label>
								<div class="col-sm-10">
									<input type="password" name="senha" minlength="3" maxlength="50" required
										class="form-control" id="senha">
								</div>
							</div>
						<button id="addUser" class="btn btn-primary">Cadastrar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>							
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#addUser').click(function(event) {
			var nome = $('#nome').val();
			var senha = $('#senha').val();
			var email = $('#email').val();
			$.post('usuario', {
				nome : nome,
				senha : senha,
				email : email,
			});
		});
	});
</script>
</html>
