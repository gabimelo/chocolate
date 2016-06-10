<%-- 
    Document   : modificar_dados_conta
    Created on : Jun 9, 2016, 8:38:51 PM
    Author     : gabriela
--%>

<%@page import="modelo.Cliente"%>
<%@page import="DAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar conta</title>
    </head>
    <body>
        <h1>Modificar dados da conta</h1>
        <%
            String usernameCliente =  (String)session.getAttribute("cliente");
            DAOCliente DAO = new DAOCliente();
            Cliente cliente = new Cliente();
            cliente.setUsername(usernameCliente);
            cliente = DAO.findByUsername(cliente);
        %>
        
        <form name="Modificacao de Cadastro Form" action="confirmacao_modificacao_cadastro.jsp">
            <p>Nome de usuário (username):</p>
            <input type="text" name="username" value="<% out.print(cliente.getUsername()); %>" disabled />
            <p>Nome:</p>
            <input type="text" name="nome" value="<% out.print(cliente.getNome()); %>" disabled />
            <p>Sobrenome:</p>
            <input type="text" name="sobrenome" value="<% out.print(cliente.getSobrenome()); %>" disabled />
            <p>CPF:</p>
            <input type="text" name="cpf" value="<% out.print(cliente.getCpf()); %>" disabled />
            <p>Senha:</p>
            <input type="text" name="senha" value="<% out.print(cliente.getSenha()); %>" />
            <p>Endereço:</p>
            <input type="text" name="endereco" value="<% out.print(cliente.getEndereco()); %>" />
            <p>Telefone:</p>
            <input type="text" name="telefone" value="<% out.print(cliente.getTelefone()); %>" />
            <br />
            <input type="submit" value="Modificar Dados" />
            <button type="button"><a href="minha_conta.jsp">Voltar para minha conta</a></button>
        </form>
    </body>
</html>
