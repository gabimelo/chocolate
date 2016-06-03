<%-- 
    Document   : confirmacao_mensagem
    Created on : Jun 3, 2016, 2:50:58 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Envio de Mensagem</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Mensagem, DAO.DAOMensagem, connection.MyConnection" %>
        <jsp:useBean id="mensagem" scope="page" class="modelo.Mensagem" />
        <jsp:setProperty name="mensagem" property="nome" />
        <jsp:setProperty name="mensagem" property="email" />
        <jsp:setProperty name="mensagem" property="mensagem" />
        
        <% 
            DAOMensagem DAO = new DAOMensagem();
            try {
                DAO.save(mensagem);
                out.println("Mensagem enviada com sucesso");
            }
            catch (Exception e) {
                out.println("Não foi possível enviar a mensagem");
            }
        %>
    </body>
</html>
