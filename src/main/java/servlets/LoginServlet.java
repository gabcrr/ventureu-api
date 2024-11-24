package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ventureau.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Lista de usuários cadastrados
    static List<Usuario> usuariosCadastrados = new ArrayList<>();

    // Método que trata requisições GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        response.setContentType("text/html");
        Usuario usuarioEncontrado = usuariosCadastrados.stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst()
                .orElse(null);

        
        if (usuarioEncontrado != null && usuarioEncontrado.getSenha() != null && usuarioEncontrado.getSenha().equals(senha)) {
            request.setAttribute("email", email); 
            request.getRequestDispatcher("/login_sucesso.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/login_erro.jsp").forward(request, response);
        }

    }

   
    public static void adicionarUsuario(Usuario usuario) {
        usuariosCadastrados.add(usuario);
    }
}
