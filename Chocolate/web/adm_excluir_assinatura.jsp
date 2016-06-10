<%-- 
    Document   : adm_excluir_assinatura
    Created on : Jun 10, 2016, 12:57:16 AM
    Author     : gabriela
--%>

<%@page import="modelo.Assinatura"%>
<%@page import="DAO.DAOAssinatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Exclusão de Assinatura</h1>
        <%
        String usernameCliente = request.getParameter("usernameCliente");
        DAOAssinatura DAO = new DAOAssinatura();
        Assinatura assinatura = new Assinatura();
        assinatura.setUsernameCliente(usernameCliente);
        try {
             DAO.delete(assinatura);
             out.println("A assinatura foi excluída");
        }
        catch (Exception e) {
            out.println("Não foi possível excluir a assinatura");
        }
        %>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
