<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Redefinir Senha</title>
</head>
<body>
    <h2>Redefinir Senha</h2>
    <form action="UsuarioController" method="post">
        <input type="hidden" name="action" value="redefinirSenha">
        <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
        <label for="senha">Nova Senha:</label>
        <input type="password" id="senha" name="senha" required>
        <button type="submit">Redefinir</button>
    </form>
</body>
</html>
