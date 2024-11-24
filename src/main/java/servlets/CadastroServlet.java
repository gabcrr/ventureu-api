package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import com.ventureau.Usuario;

@WebServlet("/CadastroServlet")
public class CadastroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String nome = request.getParameter("nome"); // Captura o nome do cliente
        String senha = request.getParameter("senha"); // Captura a senha do cliente

        // Verifica se o email já está cadastrado
        boolean emailExistente = LoginServlet.usuariosCadastrados.stream()
                .anyMatch(u -> u.getEmail().equals(email));

        if (emailExistente) {
            request.setAttribute("cliente", new Usuario(nome, email, senha));
            request.getRequestDispatcher("/cadastro_existente.jsp").forward(request, response);
        } else {
            Usuario novoUsuario = new Usuario(nome, email, senha);
            LoginServlet.adicionarUsuario(novoUsuario);
            request.setAttribute("cliente", novoUsuario);
            request.getRequestDispatcher("/cadastro_sucesso.jsp").forward(request, response);
        }
    }
}
