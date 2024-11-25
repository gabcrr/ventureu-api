package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import jakarta.servlet.http.HttpSession;
import model.CarrinhoItem;
import model.Produto;
import model.Usuario;
import utils.ConnectionFactory;

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
                	excluirItemCarrinho(request, response);
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

//    private void adicionarAoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        int produtoId = Integer.parseInt(request.getParameter("produtoId"));
//        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
//
//        Produto produto = produtoDAO.buscarPorId(produtoId);
//        if (produto != null && quantidade > 0) {
//            CarrinhoItem novoItem = new CarrinhoItem(produtoId, quantidade);
//            carrinhoDAO.inserir(novoItem);
//        }
//
//        response.sendRedirect("listar");
//    }

    private void adicionarAoCarrinho(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Integer usuarioId = (Integer) request.getSession().getAttribute("usuarioId");

        if (usuarioId == null) {
            response.sendRedirect(request.getContextPath() + "/views/login/usuario-login.jsp");
           return;
        }

        int produtoId = Integer.parseInt(request.getParameter("produtoId"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Produto produto = produtoDAO.buscarPorId(produtoId);
        if (produto != null && quantidade > 0) {
            CarrinhoItem novoItem = new CarrinhoItem(produtoId, quantidade, usuarioId);
            carrinhoDAO.inserir(novoItem);
        }

        response.sendRedirect("listar");
    }

    private void listarCarrinho(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
    	HttpSession session = request.getSession();
    	Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        //HttpSession session = request.getSession();
        //Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuarioId != null) {
            

            ArrayList<CarrinhoItem> listaCarrinho = carrinhoDAO.listarCarrinhoPorUsuario(usuarioId);
            request.setAttribute("listaCarrinho", listaCarrinho);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/carrinho/carrinho-listar.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/views/login/usuario-login.jsp");
        }
    }

    
  

    public void excluirItemCarrinho(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Logando a entrada no método
            System.out.println("Iniciando a remoção do item do carrinho");

            // Obtendo os parâmetros da requisição
            String idProdutoParam = request.getParameter("id");
            System.out.println("ID Produto obtido: " + idProdutoParam);

            int idProduto = Integer.parseInt(idProdutoParam);
            Integer idUsuario = (Integer) request.getSession().getAttribute("usuarioId");

            if (idUsuario != null) {
                System.out.println("ID do usuário obtido da sessão: " + idUsuario);

                // Busca o e-mail do usuário
                String emailUsuario = getEmailUsuarioById(idUsuario);
                System.out.println("E-mail do usuário obtido: " + emailUsuario);

                if (emailUsuario != null) {
                    // Chama o método da DAO para excluir o item
                    CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
                    boolean sucesso = carrinhoDAO.excluir(idProduto, emailUsuario);
                    System.out.println("Exclusão do produto no carrinho: " + (sucesso ? "sucesso" : "falha"));

                    if (sucesso) {
                        // Redireciona ou envia uma resposta de sucesso
                        System.out.println("Produto removido com sucesso. Redirecionando para o carrinho.");
                        response.sendRedirect(request.getContextPath() + "/carrinho");
                    } else {
                        // Se a exclusão falhou, exibe uma mensagem de erro
                        System.out.println("Falha ao remover o produto. Redirecionando para erro.jsp.");
                        request.setAttribute("erro", "Falha ao remover o produto do carrinho.");
                        request.getRequestDispatcher("/erro.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("E-mail do usuário não encontrado.");
                    request.setAttribute("erro", "Usuário não encontrado.");
                    request.getRequestDispatcher("/erro.jsp").forward(request, response);
                }
            } else {
                System.out.println("ID do usuário não encontrado na sessão.");
                request.setAttribute("erro", "Sessão expirada. Faça o login novamente.");
                request.getRequestDispatcher("/views/login/usuario-login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Erro ao excluir item do carrinho: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("erro", "Ocorreu um erro ao tentar remover o item do carrinho.");
            try {
                request.getRequestDispatcher("/erro.jsp").forward(request, response);
            } catch (ServletException | IOException ex) {
                System.out.println("Erro ao redirecionar para erro.jsp: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    // Método fictício para buscar o e-mail do usuário com base no ID
    private String getEmailUsuarioById(Integer idUsuario) {
        // Aqui você faria a consulta ao banco de dados para buscar o e-mail do usuário
        // Por exemplo:
        String sql = "SELECT email FROM usuario WHERE id = ?";
        try (Connection conexao = ConnectionFactory.getConexao();
             PreparedStatement comando = conexao.prepareStatement(sql)) {

            comando.setInt(1, idUsuario);
            ResultSet rs = comando.executeQuery();

            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao buscar e-mail do usuário: " + e.getMessage());
        }
        return null;
    }



    
    
}
