<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Ventureu Store</title>
    <link rel="stylesheet" type="text/css" href="css/menu.css">
</head>

<body>
    <!-- Botão para abrir o menu lateral -->
    <button id="menu_toggle">☰ Menu</button>

    <!-- Menu lateral oculto -->
    <div id="side_menu">
        <a href="home.jsp">Home</a>
        <a href="login.jsp">Fazer Login</a>
        <a href="cadastro_cliente.jsp">Cadastrar Cliente</a>
        <a href="cadastro_produto.jsp">Cadastrar Produto</a>
    </div>

    <!-- Conteúdo principal -->
    <div id="content_principal">
        <div class="logo-container">
            <img src="images/logopi.svg" alt="Logo Ventureu Store" class="logo">
            <h4>Bem-vindo à Ventureu Store</h4>
        </div>

        <div class="container_escolha">
            <p class="subtitle">Escolha uma opção abaixo para continuar</p>

            <div class="button-container">
                <a href="home.jsp" class="button">Home</a>
                <a href="login.jsp" class="button">Fazer Login</a>
                <a href="cadastro_cliente.jsp" class="button">Cadastrar Cliente</a>
                <a href="cadastro_produto.jsp" class="button">Cadastrar Produto</a>
            </div>
        </div>

        <footer>&copy; 2024 Ventureu Store. Todos os direitos reservados.</footer>
    </div>

    <!-- Script para controlar o menu lateral -->
    <script>
        const toggleButton = document.getElementById('menu_toggle');
        const sideMenu = document.getElementById('side_menu');

        toggleButton.addEventListener('click', function () {
            sideMenu.classList.toggle('open');
        });
    </script>
</body>

</html>
