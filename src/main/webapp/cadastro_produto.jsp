<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Cadastro de Produto</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #502c2c, #af4c4c);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #form_container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
        }

        h2 {
            font-size: 1.6em;
            color: #af4c4c;
            margin-bottom: 20px;
            font-weight: bold;
        }
         .logo{
            width: 70px;
        }

        .container_logo{
            display: flex;
            justify-content: space-between;
        }
        

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input[type="submit"] {
            background-color: #af4c4c;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #502c2c;
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #af4c4c;
            font-weight: bold;
        }

        a:hover {
            color: #502c2c;
        }
        
        footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #888;
        }
    </style>
</head>

<body>
    <div id="form_container">
    	<div class="container_logo">
            <h2>Cadastro de Produto</h2>
            <img src="images/logopi.svg" alt="Logo Ventureu Store" class="logo">
        </div>
        
        <form action="ProdutoServlet" method="post">
            <input type="text" name="nome" placeholder="Nome do Produto" required><br>
            <input type="number" step="0.01" name="preco" placeholder="Preço" required><br>
            <textarea name="descricao" placeholder="Descrição do Produto" required></textarea><br>
            <input type="submit" value="Cadastrar">
        </form>
        <a href="menu.jsp">Voltar</a><br><br>
        <footer>&copy; 2024 Ventureu Store. Todos os direitos reservados.</footer>
    </div>
</body>

</html>
