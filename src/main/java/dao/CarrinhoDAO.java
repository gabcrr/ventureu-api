package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CarrinhoItem;
import utils.ConnectionFactory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CarrinhoDAO {

    public boolean inserir(CarrinhoItem item) {
        boolean retorno = false;

        String sql = "INSERT INTO carrinho (produto_id, quantidade) VALUES (?, ?)";

        try (
            Connection conexao = ConnectionFactory.getConexao();
            PreparedStatement comando = conexao.prepareStatement(sql);
        ) {
            comando.setInt(1, item.getProdutoId());
            comando.setInt(2, item.getQuantidade());

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

                CarrinhoItem item = new CarrinhoItem(id, produtoId, quantidade);
                listaRetorno.add(item);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar itens do carrinho: " + e.getMessage());
            e.printStackTrace();
        }

        return listaRetorno;
    }

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

                itemRetorno = new CarrinhoItem(id, produtoId, quantidade);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar item do carrinho por ID: " + e.getMessage());
            e.printStackTrace();
        }

        return itemRetorno;
    }

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

    public boolean excluir(int id) {
        boolean retorno = false;

        String sql = "DELETE FROM carrinho WHERE id = ?";

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
            System.out.println("Erro ao excluir item do carrinho: " + ex.getMessage());
            ex.printStackTrace();
        }

        return retorno;
    }
}
