<%-- 
    Document   : assinatura
    Created on : Jun 3, 2016, 5:25:26 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assinatura</title>
    </head>
    <body>
        <h1>Assinatura</h1>
        <form name="Assinatura Form" action="confirmacao_assinatura.jsp">
            Selecione o tipo de chocolate:
            Ao leite:
            <input type="radio" name="tipo" value="ao leite" />
            Branco:
            <input type="radio" name="tipo" value="branco" />
            Meio amargo:
            <input type="radio" name="tipo" value="meio amargo" />
            Prefere nacional ou importado?
            Nacional:
            <input type="radio" name="procedencia" value="nacional" />
            Importado:
            <input type="radio" name="procedencia" value="importado" />            
            <input type="submit" value="Assinar" />
        </form>
    </body>
</html>
