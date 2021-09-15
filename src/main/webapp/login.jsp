<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ACESSAR</title>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
	<fieldset>
		<form action="loginservlet" method="post">
			
			  <div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">ACESSAR</h2>
      <input type="text" class="form-control" name="email" id="email" placeholder="E-mail" required="" autofocus="" />
      <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Acessar</button>   
    </form>
  </div>
		</form>

		<%
		String erro = request.getParameter("erro");
		if (erro != null) {
		%>

		<script type="text/javascript">
			alert("Login ou senha não encontrado");
		</script>
		<%
		}
		%>
	</fieldset>
</body>
</html>