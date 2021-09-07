package br.com.alura.carteira.dao;

import br.com.alura.carteira.modelo.TipoTransacao;
import br.com.alura.carteira.modelo.Transacao;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TransacaoDao {

    private Connection conexao;

    public TransacaoDao(Connection conexao) {
        this.conexao = conexao;
    }

    public void cadastrar(Transacao transacao) {
        try {
            String sql = "INSERT INTO transacoes(ticker, preco, quantidade, data, tipo) VALUES (?,?,?,?,?)";

            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, transacao.getTicker());
            ps.setBigDecimal(2, transacao.getPreco());
            ps.setInt(3, transacao.getQuantidade());
            ps.setDate(4, Date.valueOf(transacao.getData()));
            ps.setString(5, transacao.getTipo().toString());


            ps.execute();

        } catch (SQLException e) {
            System.out.println("Erro ao conectar ao MySQL");
        }
    }

    public List<Transacao> listar() {
        try {

            String sql = "SELECT * FROM transacoes";

            PreparedStatement ps = conexao.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            List<Transacao> transacoes = new ArrayList<>();

            while (rs.next()) {

                Transacao t = new Transacao();

                t.setTicker(rs.getString("ticker"));
                t.setData(rs.getDate("data").toLocalDate());
                t.setPreco(rs.getBigDecimal("preco"));
                t.setQuantidade(rs.getInt("quantidade"));
                t.setTipo(TipoTransacao.valueOf(rs.getString("tipo")));

                transacoes.add(t);
            }

            return transacoes;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
