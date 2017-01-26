/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Venda;

/**
 *
 * @author aluno
 */
public class VendaDAO extends GenericDAO<Venda, Integer> {
    public VendaDAO(){
        super(Venda.class);
    }
    
    public Venda filtro(String filtro) throws Exception{
        return (Venda)em.createNamedQuery("Venda.findFiltro").setParameter("filtro", filtro).getSingleResult();
    }
}
