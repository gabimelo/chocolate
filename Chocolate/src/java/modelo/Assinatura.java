/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import DAO.DAOProcedencia;
import DAO.DAOTipo;
import java.sql.SQLException;

/**
 *
 * @author gabriela
 */
public class Assinatura {
    private String id;
    private String usernameCliente;
    private String preco;
    private String numIteracao;
    private String idProcedencia;
    private String idTipo;
    private String quantidade;
    private String ativo;

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }   

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsernameCliente() {
        return usernameCliente;
    }

    public void setUsernameCliente(String usernameCliente) {
        this.usernameCliente = usernameCliente;
    }

    public String getPreco() {
        return preco;
    }
    
    
    public void setPreco(String preco) {
        this.preco = preco;
    }

    public void setPrecoByCalculo() throws SQLException {
        int quantidade = Integer.parseInt(this.quantidade);
        DAOProcedencia DAO = new DAOProcedencia();
        int preco_procedencia = Integer.parseInt(DAO.findPrecoById(this.idProcedencia));       
        DAOTipo DAOTipo = new DAOTipo();
        int preco_tipo = Integer.parseInt(DAOTipo.findPrecoById(this.idTipo));  
        
        int preco = quantidade * preco_procedencia * preco_tipo;
        
        this.preco = Integer.toString(preco);
    }

    public String getNumIteracao() {
        return numIteracao;
    }

    public void setNumIteracao(String numIteracao) {
        this.numIteracao = numIteracao;
    }

    public String getIdProcedencia() {
        return idProcedencia;
    }

    public void setIdProcedencia(String idProcedencia) {
        this.idProcedencia = idProcedencia;
    }
    
    public void setIdProcedenciaByNomeProcedencia(String nomeProcedencia) throws SQLException {
        DAOProcedencia DAO = new DAOProcedencia();
        this.idProcedencia = DAO.findIdByNome(nomeProcedencia);
    }

    public String getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(String idTipo) {
        this.idTipo = idTipo;
    }
    
    public void setIdTipoByNomeTipo(String nomeTipo) throws SQLException {
        DAOTipo DAO = new DAOTipo();
        this.idTipo = DAO.findIdByNome(nomeTipo);
    }

    public String getAtivo() {
        return ativo;
    }

    public void setAtivo(String ativo) {
        this.ativo = ativo;
    }
    
    
}
