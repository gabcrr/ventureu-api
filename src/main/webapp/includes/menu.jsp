<head>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<nav id="navbar">
        <div style="display: flex;">
            <div class="menu-toggle" id="menu-toggle">&#9776;</div>
            <img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu Store" class="logo"
                style="width: 43px !important; margin-left: 60px;">
        </div>

        <ul id="nav-links">
            <li><a href="${pageContext.request.contextPath}/views/home/home.jsp">Home</a></li>
            <li><a href="#produtos">Produtos</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#contato">Contato</a></li>
            <li><a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp">Login</a></li>
        </ul>
    </nav>

    <div id="side-bar" class="side-bar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/views/cadastro/usuario-cadastro.jsp">Cadastro</a></li>
            <li><a href="#produtos">Ver Produtos</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#contato">Contato</a></li>
        </ul>
      </div>

      <script src="${pageContext.request.contextPath}/scripts/home.js"></script>