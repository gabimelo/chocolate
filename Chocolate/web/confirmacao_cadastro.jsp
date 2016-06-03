<%-- 
    Document   : confirmacao_cadastro
    Created on : Jun 3, 2016, 3:05:15 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Cadastro</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Cliente, DAO.DAOCliente, connection.MyConnection" %>
        <jsp:useBean id="cliente" scope="page" class="modelo.Cliente" />
        <jsp:setProperty name="cliente" property="nome" />
        <jsp:setProperty name="cliente" property="sobrenome" />
        <jsp:setProperty name="cliente" property="cpf" />
        <jsp:setProperty name="cliente" property="senha" />
        <jsp:setProperty name="cliente" property="endereco" />
        <jsp:setProperty name="cliente" property="telefone" />
        
        <% 
            DAOCliente DAO = new DAOCliente();
            try {
                DAO.save(cliente);
                out.println("Cadastro realizado com sucesso");
            }
            catch (Exception e) {
                out.println("Não foi possível realizar o cadastro");
            }
        %>
        <p><a href="assinatura.jsp" />Ir para assinatura</p>
    </body>
</html>
