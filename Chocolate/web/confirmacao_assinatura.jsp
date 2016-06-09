<%-- 
    Document   : confirmacao_assinatura
    Created on : Jun 3, 2016, 5:31:28 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Assinatura</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Assinatura, DAO.DAOAssinatura, connection.MyConnection" %>
        <jsp:useBean id="assinatura" scope="page" class="modelo.Assinatura" />
        <jsp:setProperty name="assinatura" property="" />
        <!--setar idcliente-->
        
        <% 
            DAOAssinatura DAO = new DAOAssinatura();
            try {
                DAO.save(assinatura);
                out.println("Assinatura realizada com sucesso");
        %>
        <p>Ir para <a href="minha_conta.jsp"> minha conta </a></p>
        <p>Ir para <a href="index.jsp"> home </a></p>
        <%        
            }
            catch (Exception e) {
                out.println("Não foi possível efetivar a assinatura");
            }
        %>
    </body>
</html>
