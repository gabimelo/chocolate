<%-- 
    Document   : cancelar_assinatura
    Created on : Jun 9, 2016, 8:06:55 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar Cancelamento</title>
    </head>
    <body>
        <h1>Confirmar Cancelamento de Assinatura</h1>
        <p> Tem certeza que deseja cancelar sua assinatura?</p>
        <form name="Cancelar Form" action="confirmacao_cancelar_assinatura.jsp">
                <input type="submit" value="Sim" />
                <button type="button"><a href="assinatura.jsp">Não</a></button>
        </form>
    </body>
</html>
