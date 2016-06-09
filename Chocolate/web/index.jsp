<%-- 
    Document   : index
    Created on : May 25, 2016, 11:18:26 AM
    Author     : gabriela
--%>

<%@page import="DAO.DAOAdministrador"%>
<%@page import="modelo.Administrador"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chocolate</title>
    </head>
    <body>

        <h1>Chocolate</h1>
<%
        Boolean ehCliente = false;
        Boolean ehAdministrador = false;
        String usernameCliente =  (String)session.getAttribute("cliente");
        
        if(usernameCliente != null){
            ehCliente = true;
            Cliente cliente = new Cliente();
            cliente.setUsername(usernameCliente);
            DAOCliente DAO = new DAOCliente();
            cliente = DAO.findByUsername(cliente);
            out.println("Olá  "+cliente.getNome()+"!");
        }
        else {
            String usernameAdm  = (String)session.getAttribute("administrador");
            if(usernameAdm != null){
                ehAdministrador = true;
                Administrador administrador = new Administrador();
                administrador.setUsername(usernameAdm);
                DAOAdministrador DAOAdm = new DAOAdministrador();
                administrador = DAOAdm.findByUsername(administrador);
                out.println("Olá administrador "+administrador.getNome()+"!");
            }
        }
%>

        <p><a href="catalogo.jsp" /> Catálogo</p>
        <% if(!ehCliente && !ehAdministrador) { %>
            <p><a href="assinatura.jsp" /> Assinatura</p>
            
        <% } %>
        <% if(ehCliente) { %>
            <p><a href="minha_conta.jsp" /> Minha Conta</p>
        <% } %>
        <% if(ehAdministrador) { %>
            <p><a href="administrador.jsp" /> Funções Administrativas</p>
        <% } %>
        <p><a href="sobre_nos.jsp" /> Sobre Nós</p>
        <p><a href="faq.jsp" /> Fale conosco </p>
        
        <% if(!ehCliente && !ehAdministrador) { %>
            <p><a href="login.jsp" /> Login</p>
            <p><a href="cadastro.jsp" /> Cadastre-se!</p>
        <% } 
        else { %>
            <p><a href="logout.jsp" /> Logout</p>
        <% } %>                
    </body>
</html>
