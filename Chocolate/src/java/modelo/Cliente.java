/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author gabriela
 */
public class Cliente {
    private int id;
    private String nome;
    private String sobrenome;
    private String cpf;
    private String senha;
    private String endereco;
    private String telefone;

    public void setId(int id) {
        this.id = id;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getSenha() {
        return senha;
    }

    public String getEndereco() {
        return endereco;
    }

    public String getTelefone() {
        return telefone;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public void setSenha(String senha){
        this.senha = senha;
    }
    
    public void setEndereco(String endereco){
        this.endereco = endereco;
    }
    
    public void setTelefone(String telefone){
        this.telefone = telefone;
    }
}
