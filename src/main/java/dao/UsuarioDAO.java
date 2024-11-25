package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Usuario;
import utils.ConnectionFactory;

public class UsuarioDAO {

    public boolean inserir(Usuario usuario) {
        boolean retorno = false;

        String sql = "INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, usuario.getNome());
            comando.setString(2, usuario.getEmail());
            comando.setString(3, usuario.getSenha()); // Adicione hash na senha futuramente

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir usuário: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }

    public ArrayList<Usuario> listar() {
        ArrayList<Usuario> listaRetorno = new ArrayList<>();
        String sql = "SELECT * FROM usuario";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet rs = comando.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String email = rs.getString("email");

                Usuario usuario = new Usuario(id, nome, email, null); // Senha omitida na listagem
                listaRetorno.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar usuários: " + ex.getMessage());
            ex.printStackTrace();
        }

        return listaRetorno;
    }

    public Usuario buscarPorEmailESenha(String email, String senha) {
        Usuario usuarioRetorno = null;
        String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, email);
            comando.setString(2, senha);
            ResultSet rs = comando.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                usuarioRetorno = new Usuario(id, nome, email, null); // Omitindo senha por segurança
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuário por email e senha: " + ex.getMessage());
            ex.printStackTrace();
        }

        return usuarioRetorno;
    }

    public Usuario buscarPorId(int id) {
        Usuario usuarioRetorno = null;
        String sql = "SELECT * FROM usuario WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, id);
            ResultSet rs = comando.executeQuery();

            if (rs.next()) {
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                usuarioRetorno = new Usuario(id, nome, email, null); // Senha omitida
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuário por ID: " + ex.getMessage());
            ex.printStackTrace();
        }

        return usuarioRetorno;
    }

    public boolean atualizar(Usuario usuario) {
        boolean retorno = false;

        String sql = "UPDATE usuario SET nome = ?, email = ?, senha = ? WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, usuario.getNome());
            comando.setString(2, usuario.getEmail());
            comando.setString(3, usuario.getSenha());
            comando.setInt(4, usuario.getId());

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar usuário: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }

    public boolean excluir(int id) {
        boolean retorno = false;

        String sql = "DELETE FROM usuario WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, id);

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir usuário: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }

    public boolean emailJaExiste(String email) {
        boolean existe = false;

        String sql = "SELECT COUNT(*) AS total FROM usuario WHERE email = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, email);

            try (ResultSet resultado = comando.executeQuery()) {
                if (resultado.next()) {
                    existe = resultado.getInt("total") > 0;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao verificar existência de email: " + ex.getMessage());
            ex.printStackTrace();
        }

        return existe;
    }

    public Usuario buscarUsuarioPorEmailESenha(String email, String senha) {
        Usuario usuario = null;

        String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, email);
            comando.setString(2, senha);

            try (ResultSet resultado = comando.executeQuery()) {
                if (resultado.next()) {
                    usuario = new Usuario();
                    usuario.setId(resultado.getInt("id"));
                    usuario.setNome(resultado.getString("nome"));
                    usuario.setEmail(resultado.getString("email"));
                    usuario.setSenha(resultado.getString("senha")); // Caso use hashing, ajustar aqui
                }
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuário por email e senha: " + ex.getMessage());
            ex.printStackTrace();
        }

        return usuario;
    }

    // NOVOS MÉTODOS: Recuperação de senha

    public Usuario buscarPorEmail(String email) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE email = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, email);

            try (ResultSet rs = comando.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setId(rs.getInt("id"));
                    usuario.setNome(rs.getString("nome"));
                    usuario.setEmail(rs.getString("email"));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar usuário por email: " + ex.getMessage());
            ex.printStackTrace();
        }

        return usuario;
    }

    public boolean atualizarSenha(int userId, String novaSenha) {
        boolean sucesso = false;
        String sql = "UPDATE usuario SET senha = ? WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setString(1, novaSenha); // Adicione hash na senha futuramente
            comando.setInt(2, userId);

            int linhasAfetadas = comando.executeUpdate();
            if (linhasAfetadas > 0) {
                sucesso = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar senha: " + ex.getMessage());
            ex.printStackTrace();
        }

        return sucesso;
    }
}
