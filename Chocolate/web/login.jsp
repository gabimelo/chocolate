<%-- 
    Document   : login
    Created on : Jun 8, 2016, 3:06:42 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form name="Login Form" action="confirmacao_login.jsp">
            Username:
            <input type="text" name="username" value="" />
            Senha
            <input type="text" name="senha" value="" />
            <input type="submit" value="Enviar" />
        </form>
    </body>
</html>