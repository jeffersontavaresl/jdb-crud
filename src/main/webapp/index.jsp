<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/login.css" type="text/css">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"	crossorigin="anonymous">
<title>Projeto Datainfo</title>
</head>
<body>
	<div id="tela-login">
		<figure>
			<img src="styles/imgs/logo.jpg" alt="Datainfo">
		</figure>
		<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO -->
		<%	if (request.getParameter("pmensagem") != null) {	%>
		<p class="font-weight-bold" style="color: black">
			<%=request.getParameter("pmensagem")%>
		</p>
		<%	}	%>
		<form action="login" method="post">

			<div class="labels">
				<label for="email">E-mail:</label>
			</div>
			<input class="form" placeholder="Informe o seu e-mail" type="email"	name="email" maxlength="200" required><br>

			<div class="labels">
				<label for="senha">Senha:</label>
			</div>
			<input class="form" placeholder="Informe a senha" type="password" name="senha" maxlength="200" required><br> 
				
			<input	id="botao-login" type="submit" value="Entrar">
			<a href="cadastro"><button type="button" id="botao-login" >Cadastro</button></a>
		</form>
	</div>
</body>
</html>