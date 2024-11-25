<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes do Produto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
    <jsp:include page="../../includes/menu.jsp"></jsp:include>

    <div class="container">
        <h2>Detalhes do Produto</h2>
        
        <!-- Exibe o produto -->
        <c:if test="${not empty produto}">
            <div class="produto-info">
                <h3>${produto.nomeProduto}</h3>
                <p><strong>Descrição:</strong> ${produto.descricaoProduto}</p>
                <p><strong>Preço:</strong> R$ ${produto.valorProduto}</p>
                <p><strong>Quantidade disponível:</strong> ${produto.qtdProduto}</p>
            </div>

            <!-- Formulário para adicionar ao carrinho -->
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/carrinho/adicionar" method="post">
                    <input type="hidden" name="produtoId" value="${produto.idProduto}">
                    <label for="quantidade${produto.idProduto}">Quantidade:</label>
                    <input type="number" id="quantidade${produto.idProduto}" name="quantidade" min="1" max="${produto.qtdProduto}" required>
                    <button type="submit">Adicionar ao Carrinho</button>
                </form>
            </div>
        </c:if>
        <c:if test="${empty produto}">
            <p>Produto não encontrado!</p>
        </c:if>

        <a href="${pageContext.request.contextPath}/views/produto/produto-listar.jsp">Voltar à lista de produtos</a>
    </div>

    <jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>
