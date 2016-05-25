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
        
        <form name="Client ID Form" action="response.jsp">
            Enter your ID:
            <input type="" name="id" value="" />
            <input type="submit" value="OK" />
        </form>
        
        <p><a href="mensagem.jsp" /> Enviar uma mesagem!
        </p>
    </body>
</html>
