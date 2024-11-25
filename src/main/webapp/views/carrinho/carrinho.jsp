<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Carrinho de Compras</title>
    <link rel="stylesheet" href="../css/estilo.css">
</head>
<body>
    <h1>Seu Carrinho</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Nome do Produto</th>
                <th>Quantidade</th>
                <th>Preço Unitário</th>
                <th>Total</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<model.CarrinhoItem> carrinho = (ArrayList<model.CarrinhoItem>) request.getAttribute("carrinho");
                float totalCarrinho = 0;

                if (carrinho != null && !carrinho.isEmpty()) {
                    for (model.CarrinhoItem item : carrinho) {
                        model.Produto produto = item.getProduto();
                        if (produto != null) {
                            float totalItem = produto.getValorProduto() * item.getQuantidade();
                            totalCarrinho += totalItem;
            %>
            <tr>
                <td><%= produto.getNomeProduto() %></td>
                <td><%= item.getQuantidade() %></td>
                <td>R$ <%= produto.getValorProduto() %></td>
                <td>R$ <%= totalItem %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/carrinho/remover" method="post">
                        <input type="hidden" name="itemId" value="<%= item.getId() %>">
                        <button type="submit">Remover</button>
                    </form>
                </td>
            </tr>
            <% 
                        }
                    }
                } else { 
            %>
            <tr>
                <td colspan="5">Seu carrinho está vazio.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <h2>Total: R$ <%= totalCarrinho %></h2>
    <a href="<%= request.getContextPath() %>/produtos/listar">Continuar Comprando</a>
</body>
</html>
