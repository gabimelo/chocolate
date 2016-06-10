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
import modelo.Fornecedor;

/**
 *
 * @author gabriela
 */
public class DAOFornecedor {
    private String sql;
    public void save (Fornecedor fornecedor) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM fornecedor WHERE idfornecedor = '" + fornecedor.getId() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            if (qtd == 0){
                sql = "INSERT INTO fornecedor VALUES (" 
                        + fornecedor.getId() + ", '"
                        + fornecedor.getNome() + "', " 
                        + fornecedor.getCnpj() + ", '" 
                        + fornecedor.getEndereco() + "', '" 
                        + fornecedor.getTelefone() + "') ";
                try {
                    stmt.execute(sql);
                }
                catch (Exception e){
                    System.out.println(e);
                }
                stmt.close();
            }
            else {
                sql = "UPDATE fornecedor SET "
                        + "nome = '" + fornecedor.getNome() + "', " 
                        + "cnpj = " + fornecedor.getCnpj() + ", "
                        + "endereco = '" + fornecedor.getEndereco() + "', "
                        + "telefone = '" + fornecedor.getTelefone() + "' "
                        + "WHERE idfornecedor = " + fornecedor.getId() + " ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar fornecedor");
        }
    }
    public void delete(Fornecedor fornecedor) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM fornecedor WHERE idfornecedor = '" 
                        + fornecedor.getId() + "' ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir fornecedor");
        }
    }
    
     public Fornecedor findById(Fornecedor fornecedor) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM fornecedor WHERE idfornecedor = '" 
                       + fornecedor.getId() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                fornecedor.setNome(rs.getString(2));
                fornecedor.setCnpj(rs.getString(3));
                fornecedor.setEndereco(rs.getString(4));
                fornecedor.setTelefone(rs.getString(5));
            }
            rs.close();
            stmt.close();
            return fornecedor;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar fornecedor");
        }
    }
     
    public List<Fornecedor> findAll() throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM fornecedor ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            List<Fornecedor> fornecedors = new ArrayList();
            while (rs != null && rs.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setId(rs.getString(1));
                fornecedor.setNome(rs.getString(2));
                fornecedor.setCnpj(rs.getString(3));
                fornecedor.setEndereco(rs.getString(4));
                fornecedor.setTelefone(rs.getString(5));
                fornecedors.add(fornecedor);
            }
            rs.close();
            stmt.close();
            return fornecedors;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar fornecedor");
        }
    }
}
