<%-- 
    Document   : confirmacao_cadastro
    Created on : Jun 3, 2016, 3:05:15 PM
    Author     : gabriela
--%>

<%@page import="modelo.Administrador"%>
<%@page import="DAO.DAOAdministrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Cadastro</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Cliente, DAO.DAOCliente, connection.MyConnection" %>
        <jsp:useBean id="cliente" scope="page" class="modelo.Cliente" />
        <jsp:setProperty name="cliente" property="username" />
        <%
            DAOCliente DAO = new DAOCliente();
            DAO.findByUsername(cliente);
            if (cliente.getCpf() != null) {
                out.println("<p>Já existe usuário com esse username, tente "
                        + "outro nome. Voltar para <a href=\"cadastro.jsp\">"
                        + "cadastro.</a></p>");
            }
            else {
                DAOAdministrador DAOAdm = new DAOAdministrador();
                Administrador adm = new Administrador();
                adm.setUsername(cliente.getUsername());
                DAOAdm.findByUsername(adm);
                if (adm.getNome() != null) {
                    out.println("<p>Já existe usuário com esse username, tente "
                            + "outro nome. Voltar para <a href=\"cadastro.jsp\">"
                            + "cadastro.</a></p>");
                }
                else {
                    %>
        <jsp:setProperty name="cliente" property="nome" />
        <jsp:setProperty name="cliente" property="sobrenome" />
        <jsp:setProperty name="cliente" property="cpf" />
        <jsp:setProperty name="cliente" property="senha" />
        <jsp:setProperty name="cliente" property="endereco" />
        <jsp:setProperty name="cliente" property="telefone" />
        
        <% 
                    try {
                        cliente.setAtivo("1");
                        DAO.save(cliente);
                        out.println("Cadastro realizado com sucesso");
                        %><p><a href="assinatura.jsp" />Ir para assinatura</p><%
                    }
                    catch (Exception e) {
                        out.println("Não foi possível realizar o cadastro");
                    }
                }
            }
        %>
        
    </body>
</html>
