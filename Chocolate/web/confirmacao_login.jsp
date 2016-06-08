<%-- 
    Document   : confirmacao_login
    Created on : Jun 8, 2016, 3:09:20 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Login</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Cliente, modelo.Administrador, DAO.DAOCliente, DAO.DAOAdministrador, connection.MyConnection" %>
        
        <% 
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
            Cliente cliente = new Cliente();
            cliente.setId(username);
            DAOCliente DAO = new DAOCliente();
            try {
                cliente = DAO.findById(cliente);
                String senhareal = cliente.getSenha();
                if (senhareal.equals(senha)) {
                    session.setAttribute("cliente", username);
                }
                else {
                    out.println("Username ou senha incorretos");
                }
            }
            catch (Exception e) {
                out.println("Não foi possível consultar o banco de dados");
            }
            if (session.getAttribute("cliente") == null){
                Administrador administrador = new Administrador();
                administrador.setId(username);
                DAOAdministrador DAOAdm = new DAOAdministrador();
                try {
                    administrador = DAOAdm.findById(administrador);
                    String senhareal = administrador.getSenha();
                    if (senhareal.equals(senha)) {
                        session.setAttribute("cliente", username);
                    }
                    else {
                        out.println("Username ou senha incorretos");
                    }
                }
                catch (Exception e) {
                    out.println("Não foi possível consultar o banco de dados");
                }
            }
        %>
        <p><a href="index.jsp" />Ir para home</p>
    </body>
</html>
