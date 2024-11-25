<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <style>
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
            width: 85%;
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

        input[type="number"] {
            padding: 5px;
            width: 60px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container {
            margin-top: 10px;
        }

        .actions {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .actions a {
            margin-right: 15px;
        }

        footer {
            margin-top: 30px;
            font-size: 0.9em;
        }
    </style>
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
                            <!-- Links de edição e exclusão -->
                            <a href="editar?id=${produto.idProduto}">Editar</a> | 
                            <a href="excluir?id=${produto.idProduto}">Excluir</a>

                            <!-- Formulário para adicionar ao carrinho -->
                            <div class="form-container">
                                <form action="${pageContext.request.contextPath}/carrinho/adicionar" method="post">
                                    <input type="hidden" name="produtoId" value="${produto.idProduto}">
                                    <label for="quantidade${produto.idProduto}">Qtd:</label>
                                    <input type="number" id="quantidade${produto.idProduto}" name="quantidade" min="1" max="${produto.qtdProduto}" required>
                                    <button type="submit">Adicionar ao Carrinho</button>
                                </form>
                            </div>
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
