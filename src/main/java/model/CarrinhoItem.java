package model;

public class CarrinhoItem {
    private int id;              // ID do item no carrinho
    private int produtoId;       // ID do produto (relacionado a Produto.idProduto)
    private int quantidade;      // Quantidade do produto no carrinho
    private Produto produto;     // Objeto Produto associado

    public CarrinhoItem() {
    }

    public CarrinhoItem(int produtoId, int quantidade) {
        this.produtoId = produtoId;
        this.quantidade = quantidade;
    }

    public CarrinhoItem(int id, int produtoId, int quantidade) {
        this.id = id;
        this.produtoId = produtoId;
        this.quantidade = quantidade;
    }

    // Getter e Setter para o ID do item no carrinho
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter e Setter para o ID do produto
    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    // Getter e Setter para a quantidade
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    // Getter e Setter para o Produto associado
    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public String toString() {
        return "CarrinhoItem{" +
                "id=" + id +
                ", produtoId=" + produtoId +
                ", quantidade=" + quantidade +
                ", produto=" + (produto != null ? produto.toString() : "null") +
                '}';
    }
}
