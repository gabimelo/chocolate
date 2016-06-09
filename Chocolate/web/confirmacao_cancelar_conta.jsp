<%-- 
    Document   : confirmacao_cancelar_conta
    Created on : Jun 9, 2016, 8:31:22 PM
    Author     : gabriela
--%>

<%@page import="modelo.Cliente"%>
<%@page import="DAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encerramento de Conta</title>
    </head>
    <body>
        <% 
            String usernameCliente =  (String)session.getAttribute("cliente");
            DAOCliente DAO = new DAOCliente();
            Cliente cliente = new Cliente();
            cliente.setUsername(usernameCliente);
            cliente = DAO.findByUsername(cliente);
            cliente.setAtivo("0");
            DAO.save(cliente);
            session.removeAttribute("cliente");
        %>
        <p>Sua conta foi encerrada</p>
        <p>Voltar à <a href="index.jsp">home</a></p>
    </body>
</html>
