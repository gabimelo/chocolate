<%-- 
    Document   : response
    Created on : May 25, 2016, 11:25:26 AM
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
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Cliente, DAO.DAOCliente, connection.MyConnection" %>
        
        <jsp:useBean id="mybean" scope="session" class="modelo.Cliente" />
        <jsp:setProperty name="mybean" property="id" />
        
        <% 
            DAOCliente DAO = new DAOCliente();
            mybean = DAO.findById(mybean);
        %>
        
        
        <p>
            <jsp:getProperty name="mybean" property="id" />
        </p>
        <p><jsp:getProperty name="mybean" property="nome" /></p>
        <p><jsp:getProperty name="mybean" property="sobrenome" /></p>
        <p><jsp:getProperty name="mybean" property="cpf" /></p>
        <p><jsp:getProperty name="mybean" property="senha" /></p>
        <p><jsp:getProperty name="mybean" property="endereco" /></p>
        <p><jsp:getProperty name="mybean" property="telefone" /></p>
    </body>
</html>
