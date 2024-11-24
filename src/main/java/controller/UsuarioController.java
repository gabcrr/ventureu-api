package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UsuarioController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "cadastrar":
                    cadastrarUsuario(request, response);
                    break;
                case "login":
                    loginUsuario(request, response);
                    break;
                default:
                    response.sendRedirect("views/error.jsp");
                    break;
            }
        } else {
            response.sendRedirect("views/error.jsp");
        }
    }

    private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Cria objeto Usuario com os dados do formulário
        Usuario usuario = new Usuario(nome, email, senha); // Usa construtor parcial

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            boolean sucesso = usuarioDAO.inserir(usuario);

            if (sucesso) {
                response.sendRedirect("views/success.jsp");
            } else {
                response.sendRedirect("views/error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
        }
    }

    private void loginUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.buscarPorEmailESenha(email, senha);

            if (usuario != null) {
                // Adiciona usuário à sessão
                request.getSession().setAttribute("usuarioLogado", usuario);
                response.sendRedirect("views/home.jsp");
            } else {
                response.sendRedirect("views/login-fail.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
        }
    }
}
