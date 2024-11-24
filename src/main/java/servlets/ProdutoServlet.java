package servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.ventureau.Produto;

/**
 * Servlet implementation class ProdutoServlet
 */
@WebServlet("/ProdutoServlet")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Cadastro de Produto</title>");
		out.println("<style>");
		out.println("body {");
		out.println("    font-family: Arial, sans-serif;");
		out.println("    background-color: #f0f0f0;");
		out.println("    margin: 0;");
		out.println("    padding: 0;");
		out.println("    display: flex;");
		out.println("    justify-content: center;");
		out.println("    align-items: center;");
		out.println("    height: 100vh;");
		out.println("}");
		out.println(".form-container {");
		out.println("    background-color: #fff;");
		out.println("    padding: 20px;");
		out.println("    border-radius: 10px;");
		out.println("    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);");
		out.println("    width: 300px;");
		out.println("}");
		out.println("h2 {");
		out.println("    text-align: center;");
		out.println("    color: #333;");
		out.println("}");
		out.println("form {");
		out.println("    display: flex;");
		out.println("    flex-direction: column;");
		out.println("}");
		out.println("input[type='text'], input[type='number'] {");
		out.println("    padding: 10px;");
		out.println("    margin: 5px 0;");
		out.println("    border: 1px solid #ddd;");
		out.println("    border-radius: 5px;");
		out.println("    width: 100%;");
		out.println("}");
		out.println("input[type='submit'] {");
		out.println("    background-color: #4CAF50;");
		out.println("    color: white;");
		out.println("    padding: 10px;");
		out.println("    margin-top: 10px;");
		out.println("    border: none;");
		out.println("    border-radius: 5px;");
		out.println("    cursor: pointer;");
		out.println("    font-size: 16px;");
		out.println("}");
		out.println("input[type='submit']:hover {");
		out.println("    background-color: #45a049;");
		out.println("}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class='form-container'>");
		out.println("<h2>Cadastro de Produto</h2>");
		out.println("<form method='POST'>");
		out.println("Nome: <input type='text' name='nome' required><br>");
		out.println("Preço: <input type='text' name='preco' required><br>");
		out.println("Descrição: <input type='text' name='descricao' required><br>");
		out.println("<input type='submit' value='Cadastrar Produto'>");
		out.println("</form>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String precoStr = request.getParameter("preco");
		String descricao = request.getParameter("descricao");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (nome == null || nome.trim().isEmpty() || precoStr == null || precoStr.trim().isEmpty() || descricao == null
				|| descricao.trim().isEmpty()) {
			out.println("<h2>Erro: Todos os campos são obrigatórios!</h2>");
			out.println("<p>Por favor, preencha o nome, preço e descrição.</p>");
			out.println("<a href='ProdutoServlet'>Voltar</a>");
			return;
		}

		double preco;
		try {
			preco = Double.parseDouble(precoStr);
		} catch (NumberFormatException e) {
			out.println("<h2>Erro: Preço inválido!</h2>");
			out.println("<p>Por favor, insira um valor numérico para o preço.</p>");
			out.println("<a href='ProdutoServlet'>Voltar</a>");
			return;
		}

		Produto produto = new Produto();
//		produto.setNome(nome);
//		produto.setPreco(preco);
//		produto.setDescricao(descricao);
//
//		out.println("<h2>Produto cadastrado com sucesso</h2>");
//		out.println("<p>Nome: " + produto.getNome() + "</p>");
//		out.println("<p>Preço: " + produto.getPreco() + "</p>");
//		out.println("<p>Descrição: " + produto.getDescricao() + "</p>");
		
		produto.setNome(nome);
	    produto.setPreco(preco);
	    produto.setDescricao(descricao);
	    
	    request.setAttribute("produtoNome", produto.getNome());
	    request.setAttribute("produtoPreco", produto.getPreco());
	    request.setAttribute("produtoDescricao", produto.getDescricao());
	    
	    
	    request.getRequestDispatcher("/produto_cadastrado.jsp").forward(request, response);
	}
}
