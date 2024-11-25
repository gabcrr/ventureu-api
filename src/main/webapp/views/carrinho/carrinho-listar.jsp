<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrinho de Compras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meuCarrinho.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	
    
</head>
<body>
	<jsp:include page="../../includes/menu.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
    <h1>Meu Carrinho</h1>
    <c:if test="${empty listaCarrinho}">
	    <div class="carrinho-vazio">
	        <i class="fa fa-exclamation-circle"></i> <!-- Ícone de alerta -->
	        Seu carrinho está vazio!
	    </div>
	</c:if>
    <c:if test="${not empty listaCarrinho}">
        <table>
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Preço Unitário</th>
                    <th>Total</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${listaCarrinho}">
                    <tr>
                        <td>${item.produto.nomeProduto}</td>
                        <td>${item.quantidade}</td>
                        <td>${item.produto.valorProduto}</td>
                        <td>${item.quantidade * item.produto.valorProduto}</td>
                        <td>
				            <a href="${pageContext.request.contextPath}/carrinho/remover?id=${item.produto.idProduto}&email=${usuario.email}">Remover</a>
				        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <a href="${pageContext.request.contextPath}/views/produto/produto-listar.jsp">Continuar comprando</a>
</body>
</html>
