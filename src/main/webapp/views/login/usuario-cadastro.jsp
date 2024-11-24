<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
    <h1>Cadastro de Usuário</h1>
    <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
        <input type="hidden" name="action" value="cadastrar">
        <div>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>
        </div>
        <button type="submit">Cadastrar</button>
    </form>
    <a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp">Já tem uma conta? Faça login</a>
</body>
</html>
