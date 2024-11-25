<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cadastro de Produto</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cadastroProduto.css">
</head>
<body>
	
	<form action="${produto == null ? 'novo' : 'update'}" method="post">
	
			<input type="hidden" name="idProduto" value="${produto.getIdProduto()}">
			
            <div class="container_logo">
                <img src="${pageContext.request.contextPath}/images/logopi.svg" alt="Logo Ventureu" class="logo">
            </div>

            <label for="nomeProduto">Nome do Produto:</label>
			<input type="text" name="nomeProduto" placeholder="Nome do Produto" value="${produto.getNomeProduto()}">
			
			<label for="qtdProdutos">Quantidade:</label>
			<input type="text" name="qtdProdutos" placeholder="Quantidade" value="${produto.getQtdProdutos()}">
			
			
            <label for="valorProduto">Preço:</label>
			<input type="text" name="valorProduto" placeholder="Preço em R$" value="${produto.getValorProduto()}">
			
           <div class="div_btns">
           	<input type="submit" value="Salvar">
	    	<input type="button" value="Cancelar" onclick="window.location.href='listar';"><br><br>
           </div>
			
        </form>
</body>
</html>