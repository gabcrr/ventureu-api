<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro no Login</title>
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
        #error_container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h2 {
            font-size: 2em;
            color: #af4c4c;
        }
        p {
            font-size: 1.2em;
            color: #666;
        }
        input[type="button"] {
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
        }
        input[type="button"]:hover {
            background-color: #502c2c;
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div id="error_container">
        <h2>Erro no Login</h2>
        <p>Email ou senha incorretos.</p>
        <input type="button" value="Tentar Novamente" onclick="window.location.href='login.jsp'">
    </div>
</body>
</html>
