<%-- 
    Document   : cadastro
    Created on : Jun 3, 2016, 2:35:41 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <h1>Cadastre-se</h1>
        <form name="Cadastro Form" action="confirmacao_cadastro.jsp">
            Nome:
            <input type="text" name="nome" value="" />
            Sobrenome:
            <input type="text" name="sobrenome" value="" />
            CPF:
            <input type="text" name="cpf" value="" />
            Senha:
            <input type="text" name="senha" value="" />
            Endereço:
            <input type="text" name="endereco" value="" />
            Telefone:
            <input type="text" name="telefone" value="" />
            <input type="submit" value="Enviar" />
        </form>
    </body>
</html>
