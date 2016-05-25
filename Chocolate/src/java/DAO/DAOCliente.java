/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import modelo.Cliente;
import connection.MyConnection;
import java.sql.*;

/**
 *
 * @author gabriela
 */
public class DAOCliente {
    private String sql;
    public void save (Cliente cliente) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM cliente WHERE idcliente = " + cliente.getId() + " ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            if (qtd == 0){
                sql = "INSERT INTO cliente"
                        + "(nome,sobrenome,cpf,senha,endereco,telefone) VALUES ('" 
                        + cliente.getNome() + "', '" 
                        + cliente.getSobrenome() + "', '" 
                        + cliente.getCpf() + "', '" 
                        + cliente.getSenha() + "', '" 
                        + cliente.getEndereco() + "', '" 
                        + cliente.getTelefone() + "') ";
                stmt.execute(sql);
                stmt.close();
                
                sql = "SELECT idcliente FROM cliente WHERE cpf = '" 
                        + cliente.getCpf() + "' ";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                if (rs != null && rs.next()) {
                    cliente.setId(Integer.toString(rs.getInt(1)));
                }
                rs.close();
                stmt.close();
            }
            else {
                sql = "UPDATE cliente SET "
                        + "nome = '" + cliente.getNome() + "', '" 
                        + ", sobrenome = '" + cliente.getSobrenome() + "', '" 
                        + ", cpf = '" + cliente.getCpf() + "', '" 
                        + ", senha = '" + cliente.getSenha() + "', '" 
                        + ", endereco = '"+ cliente.getEndereco() + "', '" 
                        + ", telefone = '"+ cliente.getTelefone() + "') "
                        + "WHERE idcliente = " + cliente.getId() + " ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar cliente");
        }
    }
    public void delete(Cliente cliente) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM cliente WHERE idcliente = " 
                        + cliente.getId() + " ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir cliente");
        }
    }
    
     public Cliente findById(Cliente cliente) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM cliente WHERE idcliente = " 
                       + cliente.getId() + " ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                cliente.setNome(rs.getString(2));
                cliente.setSobrenome(rs.getString(3));
                cliente.setCpf(rs.getString(4));
                cliente.setSenha(rs.getString(5));
                cliente.setEndereco(rs.getString(6));
                cliente.setTelefone(rs.getString(7));
            }
            rs.close();
            stmt.close();
            return cliente;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar cliente");
        }
    }
    
}
