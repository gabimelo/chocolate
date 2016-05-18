/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chocolate;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author gabriela
 */
public class Chocolate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String sql;
        try {
            Connection conn = MyConnection.getConnection();
            Statement stmt = null;
            ResultSet rs = null;
            
            sql = "SELECT * FROM cliente";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            rs.first();
            try {
                System.out.println(rs.getString("nome"));
            }
            catch (SQLException e) {
                System.out.println("aqui ó");
            }
        }
        catch (Exception e) {
            System.out.println("Erro ao conectar ao banco de dados");
        }        
    }
    
}
