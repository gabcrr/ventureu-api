<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Manutenção de prods</title>
	<link rel="stylesheet" href="././css/estilo.css">
</head>
<body>
	<form action="${produto == null ? 'novo' : 'update'}" method="post">

	    <input type="hidden" name="idProduto" value="${produto.getIdProduto()}">
	
		Nome: <input type="text" name="nomeProduto" value="${produto.getNomeProduto()}"><br>
		Quantidade: <input type="text" name="qtdProdutos" value="${produto.getQtdProdutos()}"><br>
		Valor: <input type="text" name="valorProduto" value="${produto.getValorProduto()}"><br>
	
	    <input type="submit" value="Salvar">
	    <input type="button" value="Cancelar" onclick="window.location.href='listar';"><br><br>
	
	</form>
</body>
</html>