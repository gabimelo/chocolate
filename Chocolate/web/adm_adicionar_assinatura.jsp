<%-- 
    Document   : adm_adicionar_assinatura
    Created on : Jun 10, 2016, 12:42:18 AM
    Author     : gabriela
--%>

<%@page import="modelo.Procedencia"%>
<%@page import="modelo.Tipo"%>
<%@page import="DAO.DAOTipo"%>
<%@page import="DAO.DAOProcedencia"%>
<%@page import="modelo.Assinatura"%>
<%@page import="DAO.DAOAssinatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Assinatura</title>
    </head>
    <body>
        <body>
        <h1>Assinatura</h1>
        
        <form name="Assinatura Form" action="adm_confirmacao_assinatura.jsp">
            <p>Adicione o nome de usuário</p>
            <input type="text" name="username" value="" />
            <p>Selecione o tipo de chocolate:</p>
            <p>Ao leite:</p>
            <input type="radio" name="tipo" value="ao leite" />
            <p>Branco:</p>
            <input type="radio" name="tipo" value="branco" />
            <p>Meio amargo:</p>
            <input type="radio" name="tipo" value="meio amargo"  />
            <p>Prefere nacional ou importado?</p>
            <p>Nacional:</p>
            <input type="radio" name="procedencia" value="nacional"  />
            <p>Importado:</p>
            <input type="radio" name="procedencia" value="importado" />            
            <br />
            <input type="submit" value="Adicionar Assinatura" />
        </form>
        <p>Voltar para <a href="adm_assinaturas.jsp">Página Administrativa de Assinaturas</a></p>
        
    </body>
    </body>
</html>
