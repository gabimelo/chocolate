/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chocolate;
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
            // need to add check for update, delete or insert
            sql = "INSERT INTO cliente(nome,senha,endereco,telefone) VALUES ('" + cliente.getNome() + "', '" + cliente.getSenha() + "', '" + cliente.getEndereco() + "', '" + cliente.getTelefone() + "') ";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } 
        catch (Exception e) {
            System.out.println(e);
            throw new SQLException("Erro ao criar cliente");
        }
    }
    
}
