<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página com Imagens e Navegação</title>
    <link rel="stylesheet" href="css/home.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <nav id="navbar">
        <div class="logo">Minha Marca</div>
        <div class="menu-toggle" id="menu-toggle">&#9776;</div>
        <ul id="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#produtos">Produtos</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#contato">Contato</a></li>
        </ul>
    </nav>

    <div id="side-bar" class="side-bar">
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="cadastro_cliente.jsp">Cadastro</a></li>
            <li><a href="#produtos">Ver Produtos</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#contato">Contato</a></li>
        </ul>
    </div>

    <section id="home" class="full-screen" style="background-image: url('./images/boxing.png');">
        <div class="content">
            <h1>Bem-vindo</h1>
            <button onclick="scrollToSection('#produtos')" class="btn">Ver Produtos</button>
        </div>
    </section>

    <section id="estatisticas" class="estatisticas">
        <div class="estatistica">
            <h2 class="numero" data-number="+100000">+ 100k</h2>
            <p class="descricao">Clientes Satisfeitos</p>
            <p class="detalhe">Confiaram em nós para suas academias e uso pessoal.</p>
        </div>
        <div class="estatistica">
            <h2 class="numero" data-number="+300">+ 300</h2>
            <p class="descricao">Eventos Patrocinados</p>
            <p class="detalhe">Realizados com sucesso nos últimos anos.</p>
        </div>
        <div class="estatistica">
            <h2 class="numero" data-number="+50">+ 50</h2>
            <p class="descricao">Parcerias</p>
            <p class="detalhe">Com marcas reconhecidas no mercado.</p>
        </div>
    </section>

    <section id="produtos" class="full-screen" style="background-image: url('img2.jpg');">
        <div class="content">
            <h1>Produtos em Destaque</h1>
        </div>
    </section>

    <section id="sobre" class="full-screen" style="background-image: url('img3.jpg');">
        <div class="content">
            <h1>Sobre Nós</h1>
        </div>
    </section>

    <section id="contato" class="content-section">
        <h1>Contato</h1>
    </section>

    <script src="scripts/home.js"></script>
</body>
</html>
