<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Ventureu Store</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Unbounded&display=swap">

</head>

<body>

	<c:if test="${not empty erro}">
        <div class="erro">${erro}</div>
    </c:if>
    
	
	<div id="form_container">
		<div class="container_logo">
			<h2>Faça Login.</h2>
			<p>faça a diferença.</p>
			<img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu Store" class="logo">
		</div>

		<form action="${pageContext.request.contextPath}/UsuarioController" method="post">
			<input type="hidden" name="action" value="login">
			<label for="email">email</label> <input type="text" id="email"
				name="email" placeholder="xxxxx@xxxxx.xxx" required> <label
				for="senha">senha</label> <input type="password" id="senha"
				name="senha" placeholder="x10xxxx!@" required> 
				
				<button type="submit">Entrar</button>
				
		</form>

		<div class="button-container">
			<a href="${pageContext.request.contextPath}/views/home/home.jsp">Voltar</a> 
			<a href="${pageContext.request.contextPath}/views/cadastro/usuario-cadastro.jsp">Cadastre-se</a>
		</div>

		<footer>&copy; 2024 Ventureu Store. Todos os direitos
			reservados.</footer>
	</div>
</body>
</html>

