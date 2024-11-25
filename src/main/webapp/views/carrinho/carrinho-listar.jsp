<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrinho de Compras</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <style>
        /* CSS simplificado para estilo */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        header, footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 30px;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        td a {
            color: #3498db;
            text-decoration: none;
            margin-right: 10px;
        }

        td a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 5px;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <jsp:include page="../../includes/menu.jsp"></jsp:include>

    <div class="container">
        <h2>Produtos no Carrinho</h2>

        <table>
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Valor</th>
                    <th>Total</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="item" items="${listaCarrinho}">
                    <tr>
                        <td>${item.produto.nomeProduto}</td> <!-- Exibe nome do produto -->
                        <td>${item.getQuantidade()}</td> <!-- Exibe quantidade -->
                        <td>R$ ${item.produto.valorProduto}</td> <!-- Exibe valor unitário -->
                        <td>R$ ${item.getQuantidade() * item.produto.valorProduto}</td> <!-- Exibe total -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <br>
        <a href="${pageContext.request.contextPath}/produtos">Voltar à Lista de Produtos</a>
    </div>

    <jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>
