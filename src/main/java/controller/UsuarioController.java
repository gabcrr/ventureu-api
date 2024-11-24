package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import model.Usuario;
import utils.ConnectionFactory;

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
                    response.sendRedirect("error.jsp");
                    break;
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario(nome, email, senha); 

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            if (usuarioDAO.emailJaExiste(email)) {
                response.sendRedirect("views/cadastro/cadastro-existente.jsp"); 
            } else {
                boolean sucesso = usuarioDAO.inserir(usuario);
                if (sucesso) {
                    response.sendRedirect("views/cadastro/successCadastro.jsp");
                } else {
                    response.sendRedirect("views/cadastro/errorCadastro.jsp");
                }
            }
            
//            if (sucesso) {
//                response.sendRedirect("views/cadastro/successCadastro.jsp");
//            } else {
//                response.sendRedirect("views/cadastro/errorCadastro.jsp");
//            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

//    private void loginUsuario(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String email = request.getParameter("email");
//        String senha = request.getParameter("senha");
//
//        try {
//            UsuarioDAO usuarioDAO = new UsuarioDAO();
//            Usuario usuario = usuarioDAO.buscarPorEmailESenha(email, senha);
//
//            if (usuario != null) {
//                // Adiciona usuário à sessão
//                request.getSession().setAttribute("usuarioLogado", usuario);
//                response.sendRedirect("index.jsp");
//            } else {
//                response.sendRedirect("views/login/login-fail.jsp");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("webapp/error.jsp");
//        }
//    }
    
    private void loginUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        final String ADMIN_EMAIL = "admin@admin.com";
        final String ADMIN_SENHA = "admin";

        try (var connection = ConnectionFactory.getConexao()) {
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            // Primeiro verificamos se o usuário é o administrador fixo
            if (email.equals(ADMIN_EMAIL) && senha.equals(ADMIN_SENHA)) {
                Usuario admin = new Usuario();
                admin.setNome("Administrador");
                admin.setEmail(ADMIN_EMAIL);
                request.getSession().setAttribute("usuarioLogado", admin);
                request.getSession().setAttribute("isAdmin", true);
                response.sendRedirect("views/admin/admin-home.jsp");
                return;
            }

            // Caso contrário, verificamos no banco de dados
            Usuario usuario = usuarioDAO.buscarUsuarioPorEmailESenha(email, senha);

            if (usuario != null) {
                request.getSession().setAttribute("usuarioLogado", usuario);
                request.getSession().setAttribute("isAdmin", false);
                response.sendRedirect("views/home.jsp");
            } else {
                response.sendRedirect("views/cadastro/cadastro-existente.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
