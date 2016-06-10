<%-- 
    Document   : adm_assinaturas
    Created on : Jun 9, 2016, 11:53:14 PM
    Author     : gabriela
--%>

<%@page import="DAO.DAOAssinatura"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Assinatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assinaturas</title>
    </head>
    <body>
        <% 
            List<Assinatura> assinaturas = new ArrayList();
            DAOAssinatura DAO = new DAOAssinatura();
            assinaturas = DAO.findAll();
        %>
        <h1>Assinaturas</h1>
        <table>
            <tr>
                <th>Id Assinatura</th>
                <th>Username Cliente</th>
                <th>Preço</th>
                <th>Número da Iteração</th>
                <th>Id Procedência</th>
                <th>Id Tipo</th>
                <th>Quantidade</th>
                <th>Ativo</th>
                <th>Modificar</th>
                <th>Excluir</th>
            </tr>
            <% for (Assinatura assinatura : assinaturas) { %>
                <tr>
                    <td><% out.print(assinatura.getId()); %></td>
                    <td><% out.print(assinatura.getUsernameCliente()); %></td>
                    <td><% out.print(assinatura.getPreco()); %></td>
                    <td><% out.print(assinatura.getNumIteracao()); %></td>
                    <td><% out.print(assinatura.getIdProcedencia()); %></td>
                    <td><% out.print(assinatura.getIdTipo()); %></td>
                    <td><% out.print(assinatura.getQuantidade()); %></td>
                    <td><% out.print(assinatura.getAtivo()); %></td>
                    <td>
                        <form name="Assinatura Form" action="adm_modificar_assinatura.jsp">
                            <input type="hidden" name="usernameCliente" 
                                   value="<%= assinatura.getUsernameCliente() %>">
                            <input type="submit" value="Modificar" />
                        </form>
                    </td>
                    <td><form name="Assinatura Form" action="adm_excluir_assinatura.jsp">
                            <input type="hidden" name="usernameCliente" 
                                   value="<%= assinatura.getUsernameCliente() %>">
                            <input type="submit" value="Excluir" />
                        </form></td>
                </tr>
            <%}%>
        </table>
        <form>
            <button type="button"><a href="adm_adicionar_assinatura.jsp">Adicionar Assinatura</a></button>
        </form>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
