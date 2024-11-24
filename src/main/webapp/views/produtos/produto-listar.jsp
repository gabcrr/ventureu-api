<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PROD LISTAR</title>
	<link rel="stylesheet" href="../css/estilo.css">
</head>
<body>
	<jsp:include page="../../includes/menu.jsp"></jsp:include>
	<h2>lista</h2>

	<table border="1" cellspacing="0" cellpadding="5">
	    <thead>
	        <tr>
	            <th>ID</th>
	            <th>Nome Produto</th>
	            <th>QTD Produto</th>
	            <th>Valor Produto</th>
	        </tr>
	    </thead>
	    
	    <tbody>
	    	<c:forEach var="produto" items="${listaProdutos}">
	    	<tr>
	    		<td>${produto.idProduto}</td>
	    		<td>${produto.nomeProduto}</td>
	    		<td>${produto.qtdProduto}</td>
	    		<td>${produto.valorProduto}</td>
	    		<td>
	    			<a href="editar?id=${produto.idProduto}">Editar</a>
	    			<a href="excluir?id=${produto.idProduto}">Excluir</a>
	    		</td>
	    	</tr>
	    	</c:forEach>
	    </tbody>
	</table>
	
	
	<br>
	
	<a href="cadastro">Novo Produto</a>
	
	<jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>