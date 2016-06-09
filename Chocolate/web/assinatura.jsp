<%-- 
    Document   : assinatura
    Created on : Jun 3, 2016, 5:25:26 PM
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
        <title>Assinatura</title>
    </head>
    <body>
        <h1>Assinatura</h1>
        <%
            String usernameCliente =  (String)session.getAttribute("cliente");
            String usernameAdm  = (String)session.getAttribute("administrador");
            if(usernameCliente == null) { 
                out.println("<p>Faça <a href=\"login.jsp\"> login </a> primeiro</p>");
            }
            else {
                if (usernameAdm != null) {
                    out.println("<p>Você é um administrador, gerencie "
                            + "assinaturas de clientes na "
                            + "<a href=\"administrador.jsp\"> "
                            + "página administrativa</a></p>");
                }
                else {
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
        if (idTipo != null){
            out.println("<p>Você já possui uma assinatura!</p>"); 
            out.println("<p>Preço da assinatura atual: " + assinatura.getPreco() +"</p>");
            tipo.setId(idTipo);
             tipo = DAOTipo.find(tipo);
             procedencia.setId(idProcedencia);
             procedencia = DAOProcedencia.find(procedencia);
        }
        %>
        <form name="Assinatura Form" action="confirmacao_assinatura.jsp">
            Selecione o tipo de chocolate:
            Ao leite:
            <input type="radio" name="tipo" value="ao leite" 
                   <% if (tipo.getNome().equals("ao leite")) 
                         {out.println("checked='checked'");} %> />
            Branco:
            <input type="radio" name="tipo" value="branco" 
                   <% if (tipo.getNome().equals("branco"))
                         {out.println("checked='checked'");} %> />
            Meio amargo:
            <input type="radio" name="tipo" value="meio amargo" 
                   <% if (tipo.getNome().equals("meio amargo")) 
                         {out.println("checked='checked'");} %> />
            Prefere nacional ou importado?
            Nacional:
            <input type="radio" name="procedencia" value="nacional" 
                   <% if (procedencia.getNome().equals("nacional")) 
                         {out.println("checked='checked'");} %> />
            Importado:
            <input type="radio" name="procedencia" value="importado"
                   <% if (procedencia.getNome().equals("importado")) 
                         {out.println("checked='checked'");} %>/>            
            <input type="submit" value="Assinar" />
        </form>
        <p>Voltar para <a href="index.jsp"> home </a></p>
        <%
                }
            }
        %>
        
    </body>
</html>
