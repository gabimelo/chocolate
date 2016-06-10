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
import modelo.Assinatura;

/**
 *
 * @author gabriela
 */
public class DAOAssinatura {
    private String sql;
    public void save (Assinatura assinatura) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM assinatura WHERE usernamecliente = '" + assinatura.getUsernameCliente() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            if (qtd == 0){
                sql = "INSERT INTO assinatura(usernamecliente, preco, "
                        + "numiteracao, idprocedencia, idtipo, quantidade, "
                        + "ativo) VALUES ('" 
                        + assinatura.getUsernameCliente() + "', " 
                        + assinatura.getPreco() + ", " 
                        + assinatura.getNumIteracao() + ", " 
                        + assinatura.getIdProcedencia() + ", "
                        + assinatura.getIdTipo() + ", "
                        + assinatura.getQuantidade() + ", "
                        + assinatura.getAtivo()+ ") ";
                try {
                    stmt.execute(sql);
                }
                catch (Exception e){
                    System.out.println(e);
                }
                stmt.close();
            }
            else {
                sql = "UPDATE assinatura SET "
                        + "preco = " + assinatura.getPreco() + ", " 
                        + "numiteracao = " + assinatura.getNumIteracao() + ", " 
                        + "idprocedencia = " + assinatura.getIdProcedencia() + ", " 
                        + "idtipo = " + assinatura.getIdTipo() + ", " 
                        + "quantidade = " + assinatura.getQuantidade() + ", " 
                        + "ativo = " + assinatura.getAtivo() +" "
                        + "WHERE usernamecliente = '" + assinatura.getUsernameCliente() + "' ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar assinatura");
        }
    }
    public void delete(Assinatura assinatura) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM assinatura WHERE usernamecliente = '" 
                        + assinatura.getUsernameCliente() + "' ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir assinatura");
        }
    }
    
     public Assinatura findByUsernameCliente(Assinatura assinatura) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM assinatura WHERE usernamecliente = '" 
                       + assinatura.getUsernameCliente() + "' ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
                if (rs != null && rs.next()) {
                assinatura.setId(rs.getString(1));
                assinatura.setPreco(rs.getString(3));
                assinatura.setNumIteracao(rs.getString(4));
                assinatura.setIdProcedencia(rs.getString(5));
                assinatura.setIdTipo(rs.getString(6));
                assinatura.setQuantidade(rs.getString(7));
                assinatura.setAtivo(rs.getString(8));
            }
            rs.close();
            stmt.close();
            return assinatura;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar assinatura");
        }
    }
     
     public List<Assinatura> findAll() throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM assinatura ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            List<Assinatura> assinaturas = new ArrayList();
            while (rs != null && rs.next()) {
                Assinatura assinatura = new Assinatura();
                assinatura.setId(rs.getString(1));
                assinatura.setUsernameCliente(rs.getString(2));
                assinatura.setPreco(rs.getString(3));
                assinatura.setNumIteracao(rs.getString(4));
                assinatura.setIdProcedencia(rs.getString(5));
                assinatura.setIdTipo(rs.getString(6));
                assinatura.setQuantidade(rs.getString(7));
                assinatura.setAtivo(rs.getString(8));
                assinaturas.add(assinatura);
            }
            rs.close();
            stmt.close();
            return assinaturas;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar assinaturas");
        }
    }
}