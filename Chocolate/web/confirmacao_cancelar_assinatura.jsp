<%-- 
    Document   : confirmacao_cancelar_assinatura
    Created on : Jun 9, 2016, 8:12:10 PM
    Author     : gabriela
--%>

<%@page import="DAO.DAOAssinatura"%>
<%@page import="modelo.Assinatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelamento de Assinatura</title>
    </head>
    <body>
        <% 
            String usernameCliente =  (String)session.getAttribute("cliente");
            DAOAssinatura DAO = new DAOAssinatura();
            Assinatura assinatura = new Assinatura();
            assinatura.setUsernameCliente(usernameCliente);
            assinatura = DAO.findByUsernameCliente(assinatura);
            assinatura.setAtivo("0");
            DAO.save(assinatura);
        %>
        <p>Sua assinatura foi cancelada</p>
        <p>Voltar à <a href="index.jsp">home</a></p>
    </body>
</html>
