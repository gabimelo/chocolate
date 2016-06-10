/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import modelo.Cliente;
import connection.MyConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            sql = "SELECT count(*) FROM cliente WHERE username = '" + cliente.getUsername() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            if (qtd == 0){
                sql = "INSERT INTO cliente VALUES ('" 
                        + cliente.getUsername() + "', '"
                        + cliente.getNome() + "', '" 
                        + cliente.getSobrenome() + "', '" 
                        + cliente.getCpf() + "', '" 
                        + cliente.getSenha() + "', '" 
                        + cliente.getEndereco() + "', '" 
                        + cliente.getTelefone() + "', " 
                        + cliente.getAtivo() + ") ";
                try {
                    stmt.execute(sql);
                }
                catch (Exception e){
                    System.out.println(e);
                }
                stmt.close();
            }
            else {
                sql = "UPDATE cliente SET "
                        + "nome = '" + cliente.getNome() + "', " 
                        + "sobrenome = '" + cliente.getSobrenome() + "', " 
                        + "cpf = '" + cliente.getCpf() + "', " 
                        + "senha = '" + cliente.getSenha() + "', " 
                        + "endereco = '"+ cliente.getEndereco() + "', " 
                        + "telefone = '"+ cliente.getTelefone() + "', "
                        + "ativo = "+ cliente.getAtivo() + " "
                        + "WHERE username = '" + cliente.getUsername() + "' ";
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
            
            sql = "DELETE FROM cliente WHERE username = '" 
                        + cliente.getUsername() + "' ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir cliente");
        }
    }
    
     public Cliente findByUsername(Cliente cliente) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM cliente WHERE username = '" 
                       + cliente.getUsername() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                cliente.setNome(rs.getString(2));
                cliente.setSobrenome(rs.getString(3));
                cliente.setCpf(rs.getString(4));
                cliente.setSenha(rs.getString(5));
                cliente.setEndereco(rs.getString(6));
                cliente.setTelefone(rs.getString(7));
                cliente.setAtivo(rs.getString(8));
            }
            rs.close();
            stmt.close();
            return cliente;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar cliente");
        }
    }
    public List<Cliente> findAll() throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM cliente ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            List<Cliente> clientes = new ArrayList();
            while (rs != null && rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setUsername(rs.getString(1));
                cliente.setNome(rs.getString(2));
                cliente.setSobrenome(rs.getString(3));
                cliente.setCpf(rs.getString(4));
                cliente.setSenha(rs.getString(5));
                cliente.setEndereco(rs.getString(6));
                cliente.setTelefone(rs.getString(7));
                cliente.setAtivo(rs.getString(8));
                clientes.add(cliente);
            }
            rs.close();
            stmt.close();
            return clientes;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar clientes");
        }
    }
}
