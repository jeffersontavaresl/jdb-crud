<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Login</h2>
				<div class="card">
			  		<div class="card-body">
						<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
						<%	if (request.getParameter("pmensagem") != null) {	%>
						<p class="font-weight-bold" style="color: black">
							<%=request.getParameter("pmensagem")%>
						</p>
						<%	}	%>
						<form action="login" method="post">
							<div class="row mb-3">
								<label for="email" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input type="email" name="email" maxlength="200" required
										class="form-control" id="email">
								</div>
							</div>
							<div class="row mb-3">
								<label for="senha" class="col-sm-2 col-form-label">Senha</label>
								<div class="col-sm-10">
									<input type="password" name="senha" maxlength="200" required
										class="form-control" id="senha">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Login</button>
							<a href="cadastro"><button type="button" class="btn btn-primary" id="cadastro" >Cadastro</button></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>