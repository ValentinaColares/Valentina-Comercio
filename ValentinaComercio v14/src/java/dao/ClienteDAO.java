/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Cliente;

/**
 *
 * @author aluno
 */
public class ClienteDAO extends GenericDAO<Cliente, Integer> {
    
    public ClienteDAO(){
        super(Cliente.class);
    }
    public Cliente login(String filtro) throws Exception{
        return (Cliente)em.createNamedQuery("Cliente.findByEmail").setParameter("filtro", filtro).getSingleResult();
    }
}
