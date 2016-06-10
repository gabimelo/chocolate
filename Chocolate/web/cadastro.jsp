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
        <%
            String usernameCliente =  (String)session.getAttribute("cliente");
            String usernameAdm  = (String)session.getAttribute("administrador");
            if(usernameCliente == null && usernameAdm == null) { 
        %>
        <h1>Cadastre-se</h1>
        <form name="Cadastro Form" action="confirmacao_cadastro.jsp">
            <p>Selecione um nome de usuário (username):</p>
            <input type="text" name="username" value="" />
            <p>Nome:</p>
            <input type="text" name="nome" value="" />
            <p>Sobrenome:</p>
            <input type="text" name="sobrenome" value="" />
            <p>CPF:</p>
            <input type="text" name="cpf" value="" />
            <p>Senha:</p>
            <input type="text" name="senha" value="" />
            <p>Endereço:</p>
            <input type="text" name="endereco" value="" />
            <p>Telefone:</p>
            <input type="text" name="telefone" value="" />
            <br />
            <input type="submit" value="Enviar" />
        </form>
        <%
            }
            else{
                out.println("<p>Você já possui cadastro e está logado</p>");
                out.println("<p><a href=\"modificar_dados_conta.jsp\">Modificar dados do cadastro</a></p>");
            }
        %>
    </body>
</html>
