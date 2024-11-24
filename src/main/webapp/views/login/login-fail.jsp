<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Falha no Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212; /* Fundo escuro */
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ccc; /* Texto claro */
        }

        .container {
            background-color: #1f1f1f; /* Fundo escuro para a caixa */
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.7);
            text-align: center;
            width: 100%;
            max-width: 450px;
        }

        h1 {
            font-size: 28px;
            color: #e74c3c; /* Vermelho suave para erro */
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 25px;
            color: #ccc; /* Texto suave */
        }

        .emoji {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .error-box {
            background-color: #333; /* Caixa de erro com fundo escuro */
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            color: #ccc;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .link {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            padding: 12px 20px;
            background-color: #444; /* Cor escura para o botão */
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .link:hover {
            background-color: #666; /* Hover mais claro */
        }

        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.85);
            z-index: -1;
        }
    </style>
</head>
<body>

    <div class="background-overlay"></div>

    <div class="container">
        <div class="emoji">❌</div>
        <h1>Falha no Login</h1>
        <div class="error-box">
            <p>As credenciais fornecidas estão incorretas. Tente novamente.</p>
        </div>
        <a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp" class="link">Voltar para a página de login</a>
    </div>

</body>
</html>
