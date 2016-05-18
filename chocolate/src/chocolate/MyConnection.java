/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chocolate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author gabriela
 */
public class MyConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            String url = "jdbc:mysql://labsoft.pcs.usp.br:3306/chocolate";
            String user = "chocolate";
            String pass = "chocolate";
            
            return DriverManager.getConnection(url, user, pass);                    
        }
        catch (Exception e) {
            throw new SQLException("erro ao abrir conexão", e);
        }
    }
}
