<%-- 
    Document   : index
    Created on : May 25, 2016, 11:18:26 AM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        <h1>Entry Form</h1>
        <form name="Name Input Form" action="response.jsp">
            Enter your name:
            <input type="text" name="name" value="" />

            <input type="submit" value="OK" />
        </form>-->
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Cliente, DAO.DAOCliente, connection.MyConnection" %>
        <%
String sql;
try {
    Connection conn = MyConnection.getConnection();
}
catch (Exception e) {
	out.println(e.getMessage());
}
try {
    Connection conn = MyConnection.getConnection();
    Statement stmt = null;
    ResultSet rs = null;
    
    sql = "SELECT * FROM cliente";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    rs.first();
    try {
        out.println(rs.getString("nome"));
    }
    catch (SQLException e) {
        out.println("Erro ao buscar dados no banco de dados");
    }
}
catch (Exception e) {
    out.println("Erro ao conectar ao banco de dados");
}
%>        
    </body>
</html>
