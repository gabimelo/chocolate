<%-- 
    Document   : adm_produtos
    Created on : Jun 9, 2016, 11:53:14 PM
    Author     : gabriela
--%>

<%@page import="DAO.DAOProduto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
    </head>
    <body>
        <% 
            List<Produto> produtos = new ArrayList();
            DAOProduto DAO = new DAOProduto();
            produtos = DAO.findAll();
        %>
        <h1>Produtos</h1>
        <table>
            <tr>
                <th>Id Produto</th>
                <th>Id Marca</th>
                <th>Id Fornecedor</th>
                <th>Id Tipo</th>
                <th>Id Procedencia</th>
                <th>Quantidade</th>
                <th>Descrição</th>
                <th>Modificar</th>
                <th>Excluir</th>
            </tr>
            <% for (Produto produto : produtos) { %>
                <tr>
                    <td><% out.print(produto.getId()); %></td>
                    <td><% out.print(produto.getIdMarca()); %></td>
                    <td><% out.print(produto.getIdFornecedor()); %></td>
                    <td><% out.print(produto.getIdTipo()); %></td>
                    <td><% out.print(produto.getIdProcedencia()); %></td>
                    <td><% out.print(produto.getQuantidade()); %></td>
                    <td><% out.print(produto.getDescricao()); %></td>
                    <td></td>
                    <td></td>
                </tr>
            <%}%>
        </table>
        <form>
            <button type="button"><a href="adm_adicionar_produto.jsp">Adicionar Produto</a></button>
        </form>
        <p>Voltar para <a href="administrador.jsp">Página Administrativa</a></p>
    </body>
</html>
