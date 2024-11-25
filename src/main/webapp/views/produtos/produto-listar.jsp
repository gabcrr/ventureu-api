<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lista-produtos.css">
</head>
<body>
    <jsp:include page="../../includes/menu.jsp"></jsp:include>

    <div class="container">
        <h2>Lista de Produtos</h2>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome Produto</th>
                    <th>Quantidade</th>
                    <th>Valor Produto</th>
                    <th>Ações</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nomeProduto}</td>
                        <td>${produto.qtdProduto}</td>
                        <td>R$ ${produto.valorProduto}</td>
                        <td class="actions">
                           
                             <a href="editar?id=${produto.idProduto}">Editar</a> | 
                            <a href="excluir?id=${produto.idProduto}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="actions">
            <a href="cadastro">Novo Produto</a>
            <a href="${pageContext.request.contextPath}/carrinho">Ver Carrinho</a>
        </div>
    </div>

    <jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>
