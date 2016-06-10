<%-- 
    Document   : adm_confirmacao_assinatura
    Created on : Jun 10, 2016, 12:47:10 AM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inclusão de Assinatura</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Assinatura, DAO.DAOAssinatura, connection.MyConnection" %>
        
        <% 
            DAOAssinatura DAO = new DAOAssinatura();
            Assinatura assinatura = new Assinatura();
            String tipo = request.getParameter("tipo");
            String procedencia = request.getParameter("procedencia");
            assinatura.setUsernameCliente(request.getParameter("username"));
            assinatura.setQuantidade("5");
            assinatura.setAtivo("1");
            assinatura.setNumIteracao("1");
            assinatura.setIdTipoByNomeTipo(tipo);
            assinatura.setIdProcedenciaByNomeProcedencia(procedencia);
            assinatura.setPrecoByCalculo();
            try {
                DAO.save(assinatura);
                out.println("Assinatura realizada com sucesso");
                out.println("<p>Preço da assinatura: " + assinatura.getPreco() + "</p>"); 
        %>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
        <p>Ir para <a href="index.jsp"> home </a></p>
        <%        
            }
            catch (Exception e) {
                out.println("Não foi possível efetivar a assinatura");
            }
        %>
    </body>
</html>
