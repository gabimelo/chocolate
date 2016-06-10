<%-- 
    Document   : adm_clientes
    Created on : Jun 9, 2016, 11:53:14 PM
    Author     : gabriela
--%>

<%@page import="DAO.DAOCliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
        <% 
            List<Cliente> clientes = new ArrayList();
            DAOCliente DAO = new DAOCliente();
            clientes = DAO.findAll();
        %>
        <h1>Clientes</h1>
        <table>
            <tr>
                <th>Username Cliente</th>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>CPF</th>
                <th>Senha</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Ativo</th>
                <th>Modificar</th>
                <th>Excluir</th>
            </tr>
            <% for (Cliente cliente : clientes) { %>
                <tr>
                    <td><% out.print(cliente.getUsername()); %></td>
                    <td><% out.print(cliente.getNome()); %></td>
                    <td><% out.print(cliente.getSobrenome()); %></td>
                    <td><% out.print(cliente.getCpf()); %></td>
                    <td><% out.print(cliente.getSenha()); %></td>
                    <td><% out.print(cliente.getEndereco()); %></td>
                    <td><% out.print(cliente.getTelefone()); %></td>
                    <td><% out.print(cliente.getAtivo()); %></td>
                    <td></td>
                    <td></td>
                </tr>
            <%}%>
        </table>
        <form>
            <button type="button"><a href="adm_adicionar_cliente.jsp">Adicionar Cliente</a></button>
        </form>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
