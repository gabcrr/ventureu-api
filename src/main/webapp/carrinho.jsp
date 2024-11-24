<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho de Compras</title>
    <link rel="stylesheet" href="css/carrinho.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(to right, #502c2c, #af4c4c);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #content_principal {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 800px;
        }

        h4 {
            font-size: 2.0em;
            color: #af4c4c;
            font-weight: bold;
        }

        .subtitle {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #af4c4c;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1; /* Fundo leve ao passar o mouse */
        }

        .total {
            margin-top: 20px;
            text-align: right;
        }

        .button {
            text-decoration: none;
            background-color: #af4c4c;
            color: white;
            padding: 15px 20px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .button:hover {
            background-color: #502c2c;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #888;
        }
    </style>
</head>
<body>
    <div id="content_principal">
        <h4>Carrinho de Compras</h4>
        <div class="subtitle">Itens adicionados ao seu carrinho</div>
        <table class="carrinho">
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                    <th>Total</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Strap</td>
                    <td><input type="number" value="1" min="1"></td>
                    <td>R$ 9,99</td>
                    <td>R$ 9,99</td>
                    <td><button class="button">Remover</button></td>
                </tr>
                <tr>
                    <td>Munhequeira</td>
                    <td><input type="number" value="1" min="1"></td>
                    <td>R$ 20,00</td>
                    <td>R$ 20,00</td>
                    <td><button class="button">Remover</button></td>
                </tr>
                
            </tbody>
        </table>
        <div class="total">
            <h4>Valor Total: R$ 29,99</h4>
            <a href="#" class="button">Finalizar Compra</a>
        </div>
        <footer>
        	<p>&copy; 2024 Artigos Esportivos. Todos os direitos reservados.</p>
    	</footer>
    </div>
    
</body>
</html>
