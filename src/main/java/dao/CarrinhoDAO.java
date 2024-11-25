package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CarrinhoItem;
import model.Produto;
import utils.ConnectionFactory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CarrinhoDAO {

    // Método para inserir um item no carrinho
    public boolean inserir(CarrinhoItem item) {
        boolean retorno = false;

        String sql = "INSERT INTO carrinho (produto_id, quantidade, usuario_id) VALUES (?, ?, ?)";

        try (Connection conexao = ConnectionFactory.getConexao();
             PreparedStatement comando = conexao.prepareStatement(sql)) {
            comando.setInt(1, item.getProdutoId());
            comando.setInt(2, item.getQuantidade());
            comando.setInt(3, item.getUsuarioId()); // Inserindo o usuario_id

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir item no carrinho: " + ex.getMessage());
            ex.printStackTrace();
        }
        return retorno;
    }

    // Método para listar todos os itens do carrinho
    public ArrayList<CarrinhoItem> listar() {
        ArrayList<CarrinhoItem> listaRetorno = new ArrayList<>();
        String sql = "SELECT * FROM carrinho";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet rs = comando.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int produtoId = rs.getInt("produto_id");
                int quantidade = rs.getInt("quantidade");

                Produto produto = buscarProdutoPorId(produtoId);  // Buscando o Produto completo
                CarrinhoItem item = new CarrinhoItem(id, produtoId, quantidade);
                item.setProduto(produto);  // Associando o produto ao item

                listaRetorno.add(item);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar itens do carrinho: " + e.getMessage());
            e.printStackTrace();
        }

        return listaRetorno;
    }

    // Método para buscar um item pelo ID
    public CarrinhoItem buscarPorId(int id) {
        CarrinhoItem itemRetorno = null;
        String sql = "SELECT * FROM carrinho WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, id);
            ResultSet rs = comando.executeQuery();

            if (rs.next()) {
                int produtoId = rs.getInt("produto_id");
                int quantidade = rs.getInt("quantidade");

                Produto produto = buscarProdutoPorId(produtoId);  // Buscando o Produto completo
                itemRetorno = new CarrinhoItem(id, produtoId, quantidade);
                itemRetorno.setProduto(produto);  // Associando o produto ao item
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar item do carrinho por ID: " + e.getMessage());
            e.printStackTrace();
        }

        return itemRetorno;
    }

    // Método para atualizar um item no carrinho
    public boolean atualizar(CarrinhoItem item) {
        boolean retorno = false;

        String sql = "UPDATE carrinho SET produto_id = ?, quantidade = ? WHERE id = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, item.getProdutoId());
            comando.setInt(2, item.getQuantidade());
            comando.setInt(3, item.getId());

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar item no carrinho: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }

    // Método para excluir um item do carrinho
    public boolean excluir(int idProduto, String emailUsuario) {
        boolean retorno = false;

        // Consulta SQL modificada para excluir o item do carrinho do usuário baseado no produto e no email
        String sql = "DELETE c FROM carrinho c "
                   + "JOIN usuario u ON c.usuario_id = u.id "
                   + "WHERE c.produto_id = ? AND u.email = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            // Definindo os parâmetros da consulta
            comando.setInt(1, idProduto);  // id do produto
            comando.setString(2, emailUsuario);  // email do usuário

            // Executa a consulta de remoção
            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true; // Se a exclusão foi bem-sucedida
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir item do carrinho: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }

    
    
    // Método para listar o carrinho de um usuário específico
//    public ResultSet listarCarrinhoPorUsuario(int usuarioId) {
//        String sql = "SELECT p.nomeProduto, c.quantidade, p.valorProduto FROM carrinho c JOIN Produto p ON c.produto_id = p.idProduto WHERE c.usuario_id = ?";
//
//        try (Connection conexao = ConnectionFactory.getConexao();
//             PreparedStatement comando = conexao.prepareStatement(sql)) {
//            comando.setInt(1, usuarioId);
//            return comando.executeQuery();
//        } catch (SQLException ex) {
//            System.out.println("Erro ao listar carrinho do usuário: " + ex.getMessage());
//            ex.printStackTrace();
//            return null;
//        }
//    }
    public ArrayList<CarrinhoItem> listarCarrinhoPorUsuario(int usuarioId) {
        String sql = "SELECT p.idProduto, p.nomeProduto, c.quantidade, p.valorProduto " +
                     "FROM carrinho c JOIN Produto p ON c.produto_id = p.idProduto " +
                     "WHERE c.usuario_id = ?";

        ArrayList<CarrinhoItem> carrinhoItens = new ArrayList<>();
        try (Connection conexao = ConnectionFactory.getConexao();
             PreparedStatement comando = conexao.prepareStatement(sql)) {
            comando.setInt(1, usuarioId);
            ResultSet rs = comando.executeQuery();

            while (rs.next()) {
                int produtoId = rs.getInt("idProduto");
                String nomeProduto = rs.getString("nomeProduto");
                float valorProduto = rs.getFloat("valorProduto");
                int quantidade = rs.getInt("quantidade");

                // Criando o objeto Produto com o construtor completo
                Produto produto = new Produto(produtoId, nomeProduto, quantidade, valorProduto);

                // Criando o CarrinhoItem e associando o Produto
                CarrinhoItem item = new CarrinhoItem(produtoId, quantidade, usuarioId);
                item.setProduto(produto);

                carrinhoItens.add(item);  // Adiciona o item na lista
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar carrinho do usuário: " + ex.getMessage());
            ex.printStackTrace();
        }
        return carrinhoItens;
    }




    // Método auxiliar para buscar o produto completo pelo ID
    private Produto buscarProdutoPorId(int produtoId) {
        Produto produto = null;
        String sql = "SELECT * FROM Produto WHERE idProduto = ?";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, produtoId);
            ResultSet rs = comando.executeQuery();

            if (rs.next()) {
                String nome = rs.getString("nomeProduto");
          
                float preco = rs.getFloat("valorProduto"); // Usando 'float' em vez de 'double'
                produto = new Produto(produtoId, nome, 0, preco); // Ajuste o valor de qtdProduto se necessário
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar produto por ID: " + e.getMessage());
            e.printStackTrace();
        }

        return produto;
    }
}
