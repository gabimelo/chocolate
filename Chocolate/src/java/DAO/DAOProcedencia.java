/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.MyConnection;
import java.sql.*;
import modelo.Procedencia;

/**
 *
 * @author gabriela
 */
public class DAOProcedencia {
    private String sql;
    public String findPrecoById(String id) throws SQLException{
        String preco = null;
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM procedencia WHERE idprocedencia = '" + id + "' ";
            
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
             throw new SQLException("Erro ao buscar procedencia");
        }
    }
            
    public String findIdByNome(String nome) throws SQLException{
        String id = null;
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM procedencia WHERE nome = '" + nome + "' ";
            
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
             throw new SQLException("Erro ao buscar procedencia");
        }
    }
    
    public Procedencia find(Procedencia procedencia) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            if (procedencia.getId() != null){
                sql = "SELECT * FROM procedencia WHERE idprocedencia = " 
                       + procedencia.getId() + " ";
            }
            else {
                sql = "SELECT * FROM procedencia WHERE nome = " 
                       + procedencia.getNome() + " ";
            }
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
                if (rs != null && rs.next()) {
                procedencia.setId(rs.getString(1));
                procedencia.setNome(rs.getString(2));
                procedencia.setPreco(rs.getString(3));
            }
            rs.close();
            stmt.close();
            return procedencia;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar procedencia");
        }
    }
}
