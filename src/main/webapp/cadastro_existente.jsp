<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Realizado</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(to right, #502c2c, #af4c4c);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #result_container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            
        }

        h2 {
            font-size: 2.2em;
            color: #af4c4c;
            margin-bottom: 15px;
            font-weight: bold;
        }

        p {
            font-size: 1.1em;
            color: #666;
            margin: 10px 0;
        }

        input[type='button'] {
            background-color: #af4c4c;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 70%;
        }

        input[type='button']:hover {
            background-color: #502c2c;
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .info-box {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            margin-top: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .info-box p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div id="result_container">
        <h2>Você já está cadastrado!</h2>
        <p>Faça login para acessar sua conta.</p>

        <div class="info-box">
            <p><strong>Nome:</strong> ${cliente.nome}</p>
            <p><strong>Email:</strong> ${cliente.email}</p>
        </div>

        <input type="button" value="Voltar para Login" onclick="window.location.href='LoginServlet'">
    </div>
</body>
</html>
