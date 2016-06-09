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
            
            sql = "INSERT INTO mensagem"
                        + "(textomensagem, email, nome) VALUES ('" 
                        + mensagem.getTextoMensagem() + "', '" 
                        + mensagem.getEmail() + "', '" 
                        + mensagem.getNome() + "') "; 
            stmt = conn.createStatement();
            stmt.execute(sql);
            stmt.close();
        }
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao salvar mensagem");
        }
    }
}
