<%-- 
    Document   : adm_efetivacao_modificar_assinatura
    Created on : Jun 10, 2016, 1:15:18 AM
    Author     : gabriela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificação de Assinatura</title>
    </head>
    <body>
        <h1>Modificação de Assinatura</h1>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="modelo.Assinatura, DAO.DAOAssinatura, connection.MyConnection" %>
        
        <% 
            DAOAssinatura DAO = new DAOAssinatura();
            Assinatura assinatura = new Assinatura();
            assinatura.setUsernameCliente(request.getParameter("username"));
            assinatura = DAO.findByUsernameCliente(assinatura);
            String tipo = request.getParameter("tipo");
            String procedencia = request.getParameter("procedencia");
            assinatura.setQuantidade("5");
            assinatura.setAtivo(request.getParameter("ativo"));
            assinatura.setNumIteracao("1");
            assinatura.setIdTipoByNomeTipo(tipo);
            assinatura.setIdProcedenciaByNomeProcedencia(procedencia);
            assinatura.setPrecoByCalculo();
            try {
                DAO.save(assinatura);
                out.println("Assinatura modificada com sucesso");
                out.println("<p>Preço da assinatura: " + assinatura.getPreco() + "</p>"); 
        %>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
        <p>Ir para <a href="index.jsp"> home </a></p>
        <%        
            }
            catch (Exception e) {
                out.println("Não foi possível modificar a assinatura");
            }
        %>
    </body>
</html>
