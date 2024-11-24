package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ProdutoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Produto;

/**
 * Servlet implementation class ProdutoController
 */
@WebServlet(name = "produtos", urlPatterns = {"/produtos", "/produtos/listar", "/produtos/cadastro", "/views/produtos/cadastro", "/produtos/novo", "/produtos/excluir", "/produtos/editar", "/produtos/update"})
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProdutoDAO produtoDAO = null;
	
    public ProdutoController() {
        produtoDAO = new ProdutoDAO();    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		

		try {
		    switch (action) {
		        case "/produtos/novo":
		        	 novo(request, response);
		            break;
		        case "/produtos/listar":
		        	 listar(request, response);
		            break;
		        case "/produtos/cadastro":
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-cadastro.jsp");
		        	dispatcher.forward(request, response);
		            break;
		        case "/produtos/excluir":
		        	 excluir(request, response);
		            break;
		        case "/produtos/editar":
		        	 editarForm(request, response);
		            break;
		        case "/produtos/update":
		        	 update(request, response);
		            break;
		    
		        default:
		        	listar(request, response);
		            break;
		    }
		} catch (SQLException ex) {
		    
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void novo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		 Produto novoProduto = null;
		
		 String nomeProduto = request.getParameter("nomeProduto");
		 int qtdProduto = Integer.parseInt(request.getParameter("qtdProdutos"));
		 float valorProduto = Float.parseFloat(request.getParameter("valorProduto"));
		 
		 if(nomeProduto != null && qtdProduto > 0 && valorProduto > 0 ) {
			 novoProduto =  new Produto(nomeProduto, qtdProduto, valorProduto);
			 produtoDAO.inserir(novoProduto);
		 }
		 
		 try {
			   listar(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		ArrayList<Produto> listaProdutos = produtoDAO.listar();
		request.setAttribute("listaProdutos", listaProdutos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-listar.jsp");
		dispatcher.forward(request, response);
	}
	
	private void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		int id = Integer.parseInt(request.getParameter("id"));
		
		produtoDAO.excluir(id);
		response.sendRedirect("listar");
	}
	
	private void editarForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id recebido:" + id);
		Produto produtoAlterar = produtoDAO.buscarPorId(id);
		
		request.setAttribute("produto", produtoAlterar);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/produtos/produto-cadastro.jsp");
		dispatcher.forward(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		int id = Integer.parseInt(request.getParameter("idProduto"));
		String nomeProduto = request.getParameter("nomeProduto");
		int qtdProduto = Integer.parseInt(request.getParameter("qtdProdutos"));
		float valorProduto = Float.parseFloat(request.getParameter("valorProduto"));
		 
		Produto produtoAlterar = new Produto(id, nomeProduto, qtdProduto, valorProduto);
		
		produtoDAO.atualizar(produtoAlterar);
		
		request.setAttribute("produto", produtoAlterar);
		response.sendRedirect("listar");
	}
}
