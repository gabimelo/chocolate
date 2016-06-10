<%-- 
    Document   : adm_modificar_assinatura
    Created on : Jun 10, 2016, 12:57:00 AM
    Author     : gabriela
--%>

<%@page import="modelo.Procedencia"%>
<%@page import="modelo.Tipo"%>
<%@page import="DAO.DAOProcedencia"%>
<%@page import="DAO.DAOTipo"%>
<%@page import="modelo.Assinatura"%>
<%@page import="DAO.DAOAssinatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Assinatura</title>
    </head>
    <body>
        <h1>Modificar Assinatura</h1>
        <%
            String usernameCliente = request.getParameter("usernameCliente");
            DAOAssinatura DAO = new DAOAssinatura();
            Assinatura assinatura = new Assinatura();
            assinatura.setUsernameCliente(usernameCliente);
            assinatura = DAO.findByUsernameCliente(assinatura);
            String idTipo = assinatura.getIdTipo();
            String idProcedencia = assinatura.getIdProcedencia();
            DAOTipo DAOTipo = new DAOTipo();
            DAOProcedencia DAOProcedencia = new DAOProcedencia();
            Tipo tipo = new Tipo();
            Procedencia procedencia = new Procedencia();
            tipo.setId(idTipo);
            tipo = DAOTipo.find(tipo);
            procedencia.setId(idProcedencia);
            procedencia = DAOProcedencia.find(procedencia);
        %>
        <form name="Assinatura Form" action="adm_efetivacao_modificar_assinatura.jsp">
            <p>Nome de usuário</p>
            <input type="hidden" name="username" 
                   value="<%= assinatura.getUsernameCliente() %>" />
            <input type="text" name="readonlyusername" 
                   value="<%= assinatura.getUsernameCliente() %>" disabled />
            <p>Selecione o tipo de chocolate:</p>
            <p>Ao leite:</p>
            <input type="radio" name="tipo" value="ao leite" 
                   <% if (tipo.getNome() != null && tipo.getNome().equals("ao leite")) 
                         {out.println("checked='checked'");} %> />
            <p>Branco:</p>
            <input type="radio" name="tipo" value="branco" 
                   <% if (tipo.getNome() != null && tipo.getNome().equals("branco"))
                         {out.println("checked='checked'");} %> />
            <p>Meio amargo:</p>
            <input type="radio" name="tipo" value="meio amargo" 
                   <% if (tipo.getNome() != null && tipo.getNome().equals("meio amargo")) 
                         {out.println("checked='checked'");} %> />
            <p>Prefere nacional ou importado?</p>
            <p>Nacional:</p>
            <input type="radio" name="procedencia" value="nacional" 
                   <% if (procedencia.getNome() != null && procedencia.getNome().equals("nacional")) 
                         {out.println("checked='checked'");} %> />
            <p>Importado:</p>
            <input type="radio" name="procedencia" value="importado"
                   <% if (procedencia.getNome() != null && procedencia.getNome().equals("importado")) 
                         {out.println("checked='checked'");} %>/>    
            <p>Ativa</p>
            <p>Sim:</p>
            <input type="radio" name="ativo" value="1"
                   <% if (assinatura.getAtivo().equals("1")) 
                         {out.println("checked='checked'");} %>/>
            <p>Não:</p>
            <input type="radio" name="ativo" value="0"
                   <% if (assinatura.getAtivo().equals("0")) 
                         {out.println("checked='checked'");} %>/> 
            <br />
            <input type="submit" value="Modificar Assinatura" />            
        </form>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
