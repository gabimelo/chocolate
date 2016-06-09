<%-- 
    Document   : confirmacao_assinatura
    Created on : Jun 3, 2016, 5:31:28 PM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmação de Assinatura</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Assinatura, DAO.DAOAssinatura, connection.MyConnection" %>
        
        <% 
            DAOAssinatura DAO = new DAOAssinatura();
            Assinatura assinatura = new Assinatura();
            String tipo = request.getParameter("tipo");
            String procedencia = request.getParameter("procedencia");
            assinatura.setUsernameCliente((String)session.getAttribute("cliente"));
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
        <p>Ir para <a href="minha_conta.jsp"> minha conta </a></p>
        <p>Ir para <a href="index.jsp"> home </a></p>
        <%        
            }
            catch (Exception e) {
                out.println("Não foi possível efetivar a assinatura");
            }
        %>
    </body>
</html>
