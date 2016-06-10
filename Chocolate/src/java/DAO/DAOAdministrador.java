/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connection.MyConnection;
import java.sql.*;
import modelo.Administrador;

/**
 *
 * @author gabriela
 */
public class DAOAdministrador {
    private String sql;
    public void save (Administrador administrador) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM administrador WHERE username = '" + administrador.getUsername() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            if (qtd == 0){
                sql = "INSERT INTO administrador VALUES ('" 
                        + administrador.getUsername() + "', '" 
                        + administrador.getNome() + "', '" 
                        + administrador.getSenha() + "', " 
                        + administrador.getAtivo()+ ") ";
                try {
                    stmt.execute(sql);
                }
                catch (Exception e){
                    System.out.println(e);
                }
                stmt.close();
            }
            else {
                sql = "UPDATE administrador SET "
                        + "nome = '" + administrador.getNome() + "', " 
                        + "senha = '" + administrador.getSenha() + "', " 
                        + "ativo = " + administrador.getAtivo() +" "
                        + "WHERE username = '" + administrador.getUsername() + "' ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar administrador");
        }
    }
    public void delete(Administrador administrador) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM administrador WHERE username = '" 
                        + administrador.getUsername() + "' ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir administrador");
        }
    }
    
     public Administrador findByUsername(Administrador administrador) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM administrador WHERE username = '" 
                       + administrador.getUsername() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
                if (rs != null && rs.next()) {
                administrador.setNome(rs.getString(2));
                administrador.setSenha(rs.getString(3));
                administrador.setAtivo(rs.getString(4));
            }
            rs.close();
            stmt.close();
            return administrador;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar tipo");
        }
    }
}
