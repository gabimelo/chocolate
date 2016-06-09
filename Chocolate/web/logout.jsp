<%-- 
    Document   : logout
    Created on : Jun 9, 2016, 12:56:00 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
 
        String usernameCliente=(String)session.getAttribute("cliente");
        if(usernameCliente!=null){
               out.println("<a href=\"index.jsp\">Voltar à home</a>");
                session.removeAttribute("cliente");         
        }
        else {
            String usernameAdm=(String)session.getAttribute("administrador");
            if(usernameAdm!=null){
                out.println("<a href=\"index.jsp\">Voltar à home</a>");
                session.removeAttribute("administrador");         
            }
            else {
                out.println("Você não estava logado. <a href=\"index.jsp\">Voltar à home</a>");
            }
        }
%>  
    </body>
</html>
