<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Ventureu Store</title>
    <link rel="stylesheet" type="text/css" href="css/cadastro.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Unbounded:wght@400;600&display=swap">
</head>

<body>
    <div id="form_container">
        <div class="container_logo">
            <h2>Cadastro.</h2>
            <p>faça a diferença.</p>
            <img src="images/logopi.svg" alt="Logo Ventureu Store" class="logo">
        </div>

        <form action="CadastroServlet" method="post">
            <label for="nome">nome completo</label>
            <input type="text" id="nome" name="nome" placeholder="carlinhos" required><br>
            
            <label for="email">email</label>
            <input type="email" id="email" name="email" placeholder="xxxxx@xxxxx.xxx" required><br>
            
            <label for="senha">senha</label>
            <input type="password" id="senha" name="senha" placeholder="xxxx!@ye1" required><br>
            
            <label for="confirmar_senha">confirmar senha</label>
            <input type="password" id="confirmar_senha" name="confirmar_senha" placeholder="xxxx!@ye1" required><br>
            
            <input type="submit" value="Cadastrar">
        </form>

        <div class="button-container">
            <a href="menu.jsp">Voltar</a> 
            <a href="login.jsp">Fazer Login</a>
        </div>

        <footer>&copy; 2024 Ventureu Store. Todos os direitos reservados.</footer>
    </div>
</body>
</html>
