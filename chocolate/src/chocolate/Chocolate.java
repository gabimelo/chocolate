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
        //teste conexao:
//        String sql;
//        try {
//            Connection conn = MyConnection.getConnection();
//            Statement stmt = null;
//            ResultSet rs = null;
//            
//            sql = "SELECT * FROM cliente";
//            stmt = conn.createStatement();
//            rs = stmt.executeQuery(sql);
//            rs.first();
//            try {
//                System.out.println(rs.getString("nome"));
//            }
//            catch (SQLException e) {
//                System.out.println("Erro ao buscar dados no banco de dados");
//            }
//        }
//        catch (Exception e) {
//            System.out.println("Erro ao conectar ao banco de dados");
//        }        
        Cliente cliente = new Cliente();
        cliente.setNome("Pedro");
        cliente.setSenha("3333");
        cliente.setEndereco("Rua do Pedro");
        cliente.setTelefone("87654321");
        
        try {
            DAOCliente daoCliente = new DAOCliente();
            daoCliente.save(cliente);
        }
        catch (SQLException e){
            System.out.println(e);
        }
        catch (Exception e){
            System.out.println(e);
        }

    }
    
}
