<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página com Imagens e Navegação</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
    <nav id="navbar">
        <div style="display: flex;">
            <div class="menu-toggle" id="menu-toggle">&#9776;</div>
            <img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu Store" class="logo"
                style="width: 43px !important; margin-left: 60px;">
        </div>

        <ul id="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#produtos">Produtos</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#contato">Contato</a></li>
            <li><a href="${pageContext.request.contextPath}/views/login/usuario-login.jsp">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/carrinho">Carrinho</a></li>
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

    <section id="home" class="full-screen" style="background-image: url('${pageContext.request.contextPath}/images/boxing.png');">
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

    <section id="produtos" style="background-image: url('img2.jpg');">
        <div class="content">
            <h1>Produtos em Destaque</h1>

            <div class="content_cards">
                <div>
                    <div class="product-card">
                        <a href="produto.jsp?id=1">
                            <img src="https://imgcentauro-a.akamaihd.net/768x768/98721302.jpg" alt="Product 1" class="product-image">
                            <h2 class="product-name">Tênis Nike Downshifter 13 Masculino</h2>
                            <p class="product-description">Description of product 1.</p>
                            <span class="product-price">R$ 399,99</span>
                        </a>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/99038901.jpg" alt="Product 2"
                            class="product-image">
                        <h2 class="product-name">Tênis adidas VL Court 3.0 Feminino</h2>
                        <p class="product-description">Description of product 2.</p>
                        <span class="product-price">R$ 297,49</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/96256101.jpg" alt="Product 3"
                            class="product-image">
                        <h2 class="product-name">Tênis Nike Court Vision Low Next Nature - Masculino</h2>
                        <p class="product-description">Description of product 3.</p>
                        <span class="product-price">R$ 379,99</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/990945QF.jpg" alt="Product 4"
                            class="product-image">
                        <h2 class="product-name">Tênis Nike Giannis Immortality 4 Masculino</h2>
                        <p class="product-description">Description of product 4.</p>
                        <span class="product-price">R$ 479,99</span>
                    </div>
                </div>

                <div>
                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/98001002.jpg" alt="Product 1"
                            class="product-image">
                        <h2 class="product-name">Bicicleta Caloi Velox Aro 29 Freio V-Brake Câmbio Indexado 21 Marchas
                        </h2>
                        <p class="product-description">Description of product 1.</p>
                        <span class="product-price">R$ 911,99</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/51211400.jpg" alt="Product 2"
                            class="product-image">
                        <h2 class="product-name">Saco de Pancada em Couro Punch - 120cm (Saco enviado cheio)</h2>
                        <p class="product-description">Description of product 2.</p>
                        <span class="product-price">R$ 232,74</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/985351EZ.jpg" alt="Product 3"
                            class="product-image">
                        <h2 class="product-name">Skate Infantil Spin Unicórnio com Kit Protetor Capacete + 1 Par de
                            Cotoveleira + 1 Par de Joelheira</h2>
                        <p class="product-description">Description of product 3.</p>
                        <span class="product-price">R$ 156,74</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/98514532.jpg" alt="Product 4"
                            class="product-image">
                        <h2 class="product-name">Patins Oxer Freestyle Adulto</h2>
                        <p class="product-description">Description of product 4.</p>
                        <span class="product-price">R$ 460,74</span>
                    </div>
                </div>

                <div>
                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/95256302.jpg" alt="Product 1"
                            class="product-image">
                        <h2 class="product-name">Kit de Meias Cano Médio Puma Esportiva com 3 Pares - 39 a 43 - Adulto
                        </h2>
                        <p class="product-description">Description of product 1.</p>
                        <span class="product-price">R$ 37,99</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/97916704.jpg" alt="Product 2"
                            class="product-image">
                        <h2 class="product-name">Bermuda Masculina Nike Totality Knit 7in Ul</h2>
                        <p class="product-description">Description of product 2.</p>
                        <span class="product-price">R$ 142,49</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/99176002.jpg" alt="Product 3"
                            class="product-image">
                        <h2 class="product-name">Camisa do Vasco da Gama IIII 24 Kappa Masculina Torcedor</h2>
                        <p class="product-description">Description of product 3.</p>
                        <span class="product-price">R$ 332,49</span>
                    </div>

                    <div class="product-card">
                        <img src="https://imgcentauro-a.akamaihd.net/768x768/98341510.jpg" alt="Product 4"
                            class="product-image">
                        <h2 class="product-name">Maiô Júnior Oxer Medley com Touca</h2>
                        <p class="product-description">Description of product 4.</p>
                        <span class="product-price">R$ 47,49</span>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <section id="sobre" class="full-screen" style="background-image: url('img3.jpg');">
        <div class="content">
            <h1>Sobre N�s</h1>
            <p>Na Ventureu, acreditamos que o esporte transforma, inspira e conecta! <br>
                Nascemos com o prop�sito de oferecer mais do que produtos esportivos de alta qualidade;<br>
                queremos ser seu impulso para alcan�ar novos objetivos e ultrapassar limites.<br>
                Aqui, cada artigo � escolhido pensando na sua performance, no seu conforto e na sua paix�o pelo
                esporte.<br>
                Com tecnologia avan�ada e design inovador, nosso cat�logo atende desde atletas profissionais <br>
                at� os que est�o come�ando a jornada fitness.<br>
                <br>
                Ventureu: Seu parceiro para ir al�m.<br>
                <br>
                Sabemos que cada corrida, treino ou partida � uma oportunidade de supera��o. <br>
                Por isso, investimos em produtos que incentivam voc� a dar o seu melhor em cada movimento.<br>
                Navegue pelo nosso site e descubra pe�as que n�o s�o apenas roupas e acess�rios, mas tamb�m combust�vel
                para sua determina��o!<br>
                <br>
                Vista-se para vencer.
                Desafie-se. Supere-se. Conquiste com Ventureu!

                Venha fazer parte dessa jornada. Porque na Ventureu, acreditamos que os limites existem apenas para
                serem ultrapassados!
            </p>
        </div>
    </section>

    <section id="contato" class="content-section">
        <footer>
            <div class="footer-container">
                <div style="display: flex; justify-content: center; align-items: center;">
                    <div class="footer-info">
                        <div class="info-item">
                            <img src="${pageContext.request.contextPath}/images/caminhao verde.png" alt="Frete Grátis">
                            <h4>FRETE GRÁTIS</h4>
                            <p>Em produtos selecionados<br>Confira as regras</p>
                        </div>
                        <div class="info-item">
                            <img src="${pageContext.request.contextPath}/images/relogio_verde-removebg-preview.png" alt="Entrega Expressa">
                            <h4>ENTREGA EXPRESSA</h4>
                            <p>A partir de 2 dias úteis<br>Confira as regras</p>
                        </div>
                        <!-- <div class="info-item">
                            <img src="https://cdn-icons-png.flaticon.com/512/71/71227.png" alt="10x Sem Juros">
                            <h4>EM ATÉ 10X SEM JUROS</h4>
                            <p>No cartão de crédito</p>
                        </div> -->

                        <div class="info-item">
                            <img src="${pageContext.request.contextPath}/images/cartao_verde_1_1.png" alt="Formas de Pagamento">
                            <h4>FORMAS DE PAGAMENTO</h4>
                            <div style="display: flex; flex-direction: row; gap: 15px; align-items: center; justify-content: center;">
                                <div>
                                    <img src="https://cdn.iconscout.com/icon/free/png-256/free-cartao-de-credito-visa-1822954-1547549.png?f=webp" alt="Visa">
                                </div>

                                <div>
                                    <img src="https://fraguru.com/mdimg/dizajneri/o.4571.jpg" alt="Mastercard">
                                </div>

                                <div>
                                    <img src="https://img.icons8.com/color/200/pix.png" alt="pix">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <hr>
                <div style="display: flex; flex-direction: row; justify-content: center;">
                    <!-- Logo e descrição -->
                    <div class="footer-logo">
                        <img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu Store" class="logo">
                        <p>Seu parceiro para ir alem no esporte.</p>
                    </div>

                    <!-- Links de navegação -->
                    <div class="footer-links">
                        <h3>Navega��o</h3>
                        <a href="#about">Sobre N�s</a>
                        <a href="#products">Produtos</a>
                        <a href="#contact">Contato</a>
                        <a href="#faq">FAQ</a>
                    </div>

                    <!-- Informações de contato -->
                    <div class="footer-contact">
                        <h3>Contato</h3>
                        <p>Email: contato@ventureu.com</p>
                        <p>Telefone: (11) 1234-5678</p>
                    </div>

                    <!-- Redes sociais -->
                    <div class="social-icons">
                        <h3>Redes Sociais</h3>
                        <a href="#" aria-label="X">
                            <img src="https://freepnglogo.com/images/all_img/1725374683twitter-x-logo.png" alt="Icone X"
                                class="img-logo-footer">
                        </a>
                        <a href="#" aria-label="Instagram">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png"
                                alt="Icone Instagram" class="img-logo-footer">
                        </a>
                        <a href="#" aria-label="Linkedin">
                            <img src="https://cdn-icons-png.flaticon.com/512/174/174857.png" alt="Icone Linkedin"
                                class="img-logo-footer">
                        </a>
                    </div>
                </div>
            </div>

            <!-- Créditos finais -->
            <div class="footer-credit">
                <p>&copy; 2024 Ventureu. Todos os direitos reservados.</p>
            </div>
        </footer>
    </section>

    <script src="${pageContext.request.contextPath}/scripts/home.js"></script>
</body>

</html>