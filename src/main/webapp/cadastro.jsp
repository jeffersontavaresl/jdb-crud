<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/cadastro.css">
    <script type="text/javascript" src="webjars/jquery/3.6.0/dist/jquery.min.js"></script>
<title>Projeto Datainfo - Cadastro</title>
</head>
<body>
    <div id="tela-cadastro">
      <div id="logo">Cadastro</div>
      	<!-- GERA A MENSAGEM DE CONFIRMAÇÃO QUANDO OCORRE ALGUMA ALTERAÇÃO  -->
		<%	if (request.getParameter("pmensagem") != null) {	%>
		<p class="font-weight-bold" style="color: black">
			<%=request.getParameter("pmensagem")%>
		</p>
		<%	}	%>
      <form action="cadastro" method="post">
        <div class="labels"><label for="nome">Nome:</label>
        <input class="form" placeholder="Informe o seu nome" type="text" id="nome" name="nome" minlength="3" maxlength="200" required><br>
        </div>
        
        <div class="labels"><label for="email">E-mail:</label>
        <input class="form" placeholder="Informe o seu e-mail" type="email" id="email" name="email" minlength="3" maxlength="200" required><br>
        </div>
        
        <div class="labels"><label for="senha">Senha:</label>
        <input class="form" placeholder="Informe a senha" type="password" id="senha" name="senha" minlength="3" maxlength="50" required><br>
        </div>
		
		<a href="login"><button type="button" id="botao-cadastro" >Voltar</button></a>        
        <input id="botao-cadastro" type="submit" value="Cadastrar">
      </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
