<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Ventureu Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cadastro.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Unbounded:wght@400;600&display=swap">
</head>
<body>
	<div id="form_container">
        <div class="container_logo">
            <h2>Cadastro.</h2>
            <p>faça a diferença.</p>
            <img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu Store" class="logo">
        </div>

        <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
        	<input type="hidden" name="action" value="cadastrar">
            <label for="nome">nome completo</label>
            <input type="text" id="nome" name="nome" placeholder="Carlos" required><br>
            
            <label for="email">email</label>
            <input type="email" id="email" name="email" placeholder="xxxxx@xxxxx.xxx" required><br>
            
            <label for="senha">senha</label>
            <input type="password" id="senha" name="senha" placeholder="xxxx!@ye1" required><br>
            
            <label for="confirmar_senha">confirmar senha</label>
            <input type="password" id="confirmar_senha" name="confirmar_senha" placeholder="xxxx!@ye1" required><br>
            
            <button type="submit">Cadastrar</button>
        </form>

        <div class="button-container">
            <a href="${pageContext.request.contextPath}/views/home/home.jsp">Voltar</a> 
            <a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp">Fazer Login</a>
        </div>

        <footer>&copy; 2024 Ventureu Store. Todos os direitos reservados.</footer>
    </div>
   
</body>

</html>
