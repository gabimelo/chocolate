<%-- 
    Document   : cancelar_conta
    Created on : Jun 9, 2016, 8:29:53 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar Encerramento</title>
    </head>
    <body>
        <h1>Confirmar Encerramento de Conta</h1>
        <p> Tem certeza que deseja encerrar sua conta?</p>
        <form name="Cancelar Form" action="confirmacao_cancelar_conta.jsp">
                <input type="submit" value="Sim" />
                <button type="button"><a href="minha_conta.jsp">Não</a></button>
        </form>
    </body>
</html>
