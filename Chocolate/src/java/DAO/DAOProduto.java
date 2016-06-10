/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.MyConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Produto;

/**
 *
 * @author gabriela
 */
public class DAOProduto {
    private String sql;
    public void save (Produto produto) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM produto WHERE idproduto = '" + produto.getId() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            if (qtd == 0){
                sql = "INSERT INTO produto VALUES (" 
                        + produto.getId() + ", "
                        + produto.getIdMarca() + ", " 
                        + produto.getIdFornecedor() + ", " 
                        + produto.getIdTipo() + ", " 
                        + produto.getDescricao() + "', " 
                        + produto.getQuantidade() + ", " 
                        + produto.getIdProcedencia() + ") ";
                try {
                    stmt.execute(sql);
                }
                catch (Exception e){
                    System.out.println(e);
                }
                stmt.close();
            }
            else {
                sql = "UPDATE produto SET "
                        + "idmarca = " + produto.getIdMarca() + ", " 
                        + "idfornecedor = " + produto.getIdFornecedor() + ", "
                        + "idtipo = " + produto.getIdTipo() + ", "
                        + "descricao = '" + produto.getDescricao() + "', "
                        + "quantidade = " + produto.getQuantidade() + ", "
                        + "idprocedencia = " + produto.getIdProcedencia() + ", "
                        + "WHERE idproduto = " + produto.getId() + " ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar produto");
        }
    }
    public void delete(Produto produto) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM produto WHERE username = '" 
                        + produto.getId() + "' ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir produto");
        }
    }
    
     public Produto findById(Produto produto) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM produto WHERE idproduto = '" 
                       + produto.getId() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                produto.setIdMarca(rs.getString(2));
                produto.setIdFornecedor(rs.getString(3));
                produto.setIdTipo(rs.getString(4));
                produto.setDescricao(rs.getString(5));
                produto.setQuantidade(rs.getString(6));
                produto.setIdProcedencia(rs.getString(7));
            }
            rs.close();
            stmt.close();
            return produto;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar produto");
        }
    }
     
    public List<Produto> findAll() throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM produto ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            List<Produto> produtos = new ArrayList();
            Produto produto = new Produto();
            while (rs != null && rs.next()) {
                produto.setId(rs.getString(1));
                produto.setIdMarca(rs.getString(2));
                produto.setIdFornecedor(rs.getString(3));
                produto.setIdTipo(rs.getString(4));
                produto.setDescricao(rs.getString(5));
                produto.setQuantidade(rs.getString(6));
                produto.setIdProcedencia(rs.getString(7));
                produtos.add(produto);
            }
            rs.close();
            stmt.close();
            return produtos;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar produto");
        }
    }
}
