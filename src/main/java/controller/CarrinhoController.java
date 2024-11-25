package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.CarrinhoDAO;
import dao.ProdutoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CarrinhoItem;
import model.Produto;

/**
 * Servlet implementation class CarrinhoController
 */
@WebServlet(name = "carrinho", urlPatterns = {"/carrinho", "/carrinho/adicionar", "/carrinho/listar", "/carrinho/remover"})
public class CarrinhoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarrinhoDAO carrinhoDAO;
    private ProdutoDAO produtoDAO;

    public CarrinhoController() {
        carrinhoDAO = new CarrinhoDAO();
        produtoDAO = new ProdutoDAO();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/carrinho/adicionar":
                    adicionarAoCarrinho(request, response);
                    break;
                case "/carrinho/listar":
                    listarCarrinho(request, response);
                    break;
                case "/carrinho/remover":
                    removerDoCarrinho(request, response);
                    break;
                default:
                    listarCarrinho(request, response);
                    break;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void adicionarAoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int produtoId = Integer.parseInt(request.getParameter("produtoId"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Produto produto = produtoDAO.buscarPorId(produtoId);
        if (produto != null && quantidade > 0) {
            CarrinhoItem novoItem = new CarrinhoItem(produtoId, quantidade);
            carrinhoDAO.inserir(novoItem);
        }

        response.sendRedirect("listar");
    }

    private void listarCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Obtém os dados do carrinho e produtos
        ArrayList<CarrinhoItem> listaCarrinho = carrinhoDAO.listar();
        ArrayList<Produto> listaProdutos = produtoDAO.listar();

        // Mapear produtos aos itens do carrinho
        for (CarrinhoItem item : listaCarrinho) {
            for (Produto produto : listaProdutos) {
                if (item.getProdutoId() == produto.getIdProduto()) {
                    item.setProduto(produto);  // Associa o produto ao carrinho
                }
            }
        }

        // Define a lista de itens do carrinho para o JSP
        request.setAttribute("listaCarrinho", listaCarrinho);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/carrinho/carrinho-listar.jsp");
        dispatcher.forward(request, response);
    }
    
  

    private void removerDoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        carrinhoDAO.excluir(id);
        response.sendRedirect("listar");
    }
}
