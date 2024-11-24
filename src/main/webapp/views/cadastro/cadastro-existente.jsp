<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Falha no Cadastro</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212; /* Dark background */
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ccc; /* Light gray text */
        }

        .container {
            background-color: #1f1f1f; /* Slightly lighter dark background */
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.7);
            text-align: center;
            width: 100%;
            max-width: 450px;
        }

        h2 {
            font-size: 26px;
            color: #e74c3c; /* Subtle red for error */
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 25px;
            color: #ccc; /* Soft gray text */
        }

        .emoji {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .alert-box {
            background-color: #333; /* Darker background for alert */
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
            background-color: #444; /* Darker button background */
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .link:hover {
            background-color: #666; /* Lighter gray on hover */
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
        <div class="emoji">🤦‍♂️</div>
        <h2>Erro no Cadastro!</h2>
        <div class="alert-box">
            <p>Este email já está em uso. Tente novamente com um endereço de email diferente.</p>
        </div>
        <a href="${pageContext.request.contextPath}/views/cadastro/usuario-cadastro.jsp" class="link">Voltar para o Cadastro</a>
    </div>

</body>
</html>
