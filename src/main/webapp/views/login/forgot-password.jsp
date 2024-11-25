<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Recuperar Senha</title>
</head>
<body>
    <h2>Recuperar Senha</h2>
    <form action="UsuarioController" method="post">
        <input type="hidden" name="action" value="recuperarSenha">
        <label for="email">Digite seu e-mail:</label>
        <input type="email" id="email" name="email" required>
        <button type="submit">Validar</button>
    </form>
</body>
</html>
