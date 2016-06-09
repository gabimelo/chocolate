/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.MyConnection;
import java.sql.*;
import modelo.Tipo;

/**
 *
 * @author gabriela
 */
public class DAOTipo {
    private String sql;
    public String findPrecoById(String id) throws SQLException{
        String preco = null;
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM tipo WHERE idtipo = '" + id + "' ";
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                preco = rs.getString(3);
            }
            rs.close();
            stmt.close();
            return preco;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar tipo");
        }
    }
            
    public String findIdByNome(String nome) throws SQLException{
        String id = null;
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM tipo WHERE nome = '" + nome + "' ";
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                id = rs.getString(1);
            }
            rs.close();
            stmt.close();
            return id;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar tipo");
        }
    }
    
    public Tipo find(Tipo tipo) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            if (tipo.getId() != null){
                sql = "SELECT * FROM tipo WHERE idtipo = " 
                       + tipo.getId() + " ";
            }
            else {
                sql = "SELECT * FROM tipo WHERE nome = " 
                       + tipo.getNome() + " ";
            }
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
                if (rs != null && rs.next()) {
                tipo.setId(rs.getString(1));
                tipo.setNome(rs.getString(2));
                tipo.setPreco(rs.getString(3));
            }
            rs.close();
            stmt.close();
            return tipo;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar administrador");
        }
    }
}
