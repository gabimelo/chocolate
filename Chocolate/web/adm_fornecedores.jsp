<%-- 
    Document   : adm_fornecedors
    Created on : Jun 9, 2016, 11:53:14 PM
    Author     : gabriela
--%>

<%@page import="DAO.DAOFornecedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedors</title>
    </head>
    <body>
        <% 
            List<Fornecedor> fornecedores = new ArrayList();
            DAOFornecedor DAO = new DAOFornecedor();
            fornecedores = DAO.findAll();
        %>
        <h1>Fornecedors</h1>
        <table>
            <tr>
                <th>Id Fornecedor</th>
                <th>Nome</th>
                <th>CNPJ</th>
                <th>Endereco</th>
                <th>Telefone</th>
                <th>Modificar</th>
                <th>Excluir</th>
            </tr>
            <% for (Fornecedor fornecedor : fornecedores) { %>
                <tr>
                    <td><% out.print(fornecedor.getId()); %></td>
                    <td><% out.print(fornecedor.getNome()); %></td>
                    <td><% out.print(fornecedor.getCnpj()); %></td>
                    <td><% out.print(fornecedor.getEndereco()); %></td>
                    <td><% out.print(fornecedor.getTelefone()); %></td>
                    <td></td>
                    <td></td>
                </tr>
            <%}%>
        </table>
        <form>
            <button type="button"><a href="adm_adicionar_fornecedor.jsp">Adicionar Fornecedor</a></button>
        </form>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
