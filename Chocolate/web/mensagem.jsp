<%-- 
    Document   : mensagem
    Created on : May 25, 2016, 2:46:16 PM
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
        <h1>Entre em contato!</h1>
        
        <form name="Client ID Form" action="response.jsp">
            Nome:
            <input type="" name="nome" value="" />
            E-mail:
            <input type="" name="email" value="" />
            Mensagem:
            <textarea name="mensagem" rows="4" cols="20">
            </textarea>
            <input type="submit" value="OK" />
        </form>
    </body>
</html>
