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
        if (assinatura.getAtivo() != null && assinatura.getAtivo().equals("1")){
            out.println("<p>Você já possui uma assinatura!</p>"); 
            out.println("<p>Preço da assinatura atual: " + assinatura.getPreco() +"</p>");
            tipo.setId(idTipo);
             tipo = DAOTipo.find(tipo);
             procedencia.setId(idProcedencia);
             procedencia = DAOProcedencia.find(procedencia);
          %>
            <form name="Cancelar Form" action="cancelar_assinatura.jsp">
                <input type="submit" value="Cancelar Assinatura" />
            </form>
          <%
        }
        %>
        <form name="Assinatura Form" action="confirmacao_assinatura.jsp">
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
            <br />
            <%
                if (assinatura.getAtivo() != null && assinatura.getAtivo().equals("1")){
            %>
                    <input type="submit" value="Modificar Assinatura" />
            <%      
                }
                else{
            %>
                    <input type="submit" value="Assinar" />
            <%        
                }
            %>
            
        </form>
        <p>Voltar para <a href="index.jsp"> home </a></p>
        <%
                }
            }
        %>
        
    </body>
</html>
