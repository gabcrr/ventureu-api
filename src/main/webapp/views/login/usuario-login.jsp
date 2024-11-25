<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
    <h1>Login de Usuário</h1>
    <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
        <input type="hidden" name="action" value="login">
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>
        </div>
        <button type="submit">Entrar</button>
    </form>
    
    <div>
    <!-- Adicione o link para o JSP de recuperação de senha -->
    <a href="views/login/forgot-password.jsp">Esqueceu a senha?</a>
</div>
    
    <a href="${pageContext.request.contextPath}/views/cadastro/usuario-cadastro.jsp">Ainda não tem conta? Cadastre-se</a>
</body>
</html>
