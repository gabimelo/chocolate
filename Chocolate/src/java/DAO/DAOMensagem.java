/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import modelo.Mensagem;
import connection.MyConnection;
import java.sql.*;

/**
 *
 * @author gabriela
 */
public class DAOMensagem {
    private String sql;
    public void save (Mensagem mensagem) throws SQLException{
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            int qtd = 0;
            sql = "SELECT count(*) FROM mensagem WHERE idmensagem = " + mensagem.getId() + " ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                qtd = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            if (qtd == 0){
                sql = "INSERT INTO mensagem"
                        + "(nome,email,mensagem) VALUES ('" 
                        + mensagem.getNome() + "', '" 
                        + mensagem.getEmail() + "', '" 
                        + mensagem.getMensagem() + "') "; 
                stmt.execute(sql);
                stmt.close();
            }
            else {
                sql = "UPDATE mensagem SET "
                        + "nome = '" + mensagem.getNome() + "', '" 
                        + ", email = '" + mensagem.getEmail() + "', '" 
                        + ", mensagem = '" + mensagem.getMensagem() + "' "
                        + "WHERE idmensagem = " + mensagem.getId() + " ";
                stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();                
            }
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar mensagem");
        }
    }
    public void delete(Mensagem mensagem) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            
            sql = "DELETE FROM mensagem WHERE idmensagem = " 
                        + mensagem.getId() + " ";
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }   
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao excluir mensagem");
        }
    }
    
     public Mensagem findById(Mensagem mensagem) throws SQLException {
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM mensagem WHERE idmensagem = " 
                       +  mensagem.getId() + " ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs != null && rs.next()) {
                mensagem.setNome(rs.getString(2));
                mensagem.setEmail(rs.getString(3));
                mensagem.setMensagem(rs.getString(4));
            }
            rs.close();
            stmt.close();
            return mensagem;
        }
        catch (Exception e) {
             throw new SQLException("Erro ao buscar mensagem");
        }
    }
}
