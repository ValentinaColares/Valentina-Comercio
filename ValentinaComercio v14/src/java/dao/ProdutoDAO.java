/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Produto;

/**
 *
 * @author aluno
 */
public class ProdutoDAO extends GenericDAO<Produto, Integer> {
    
    public ProdutoDAO(){
        super(Produto.class);
    }
    public List<Produto> listaDestaque() {
        List<Produto> lista;
        try{
            lista = em.createNamedQuery("Produto.destaqueHome").getResultList();
        }
        catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
    public List<Produto> listaGaleria() {
        List<Produto> lista;
        try{
            lista = em.createNamedQuery("Produto.galeriaHome").getResultList();
        }
        catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
    
    
    public List<Produto> listarFiltro(Integer codigo, String tipo){
        List<Produto> lista;
        try{
            String namedQuery;
            if(tipo.equals("M")){
                namedQuery = "findCodMarca";
            }else{
                namedQuery = "findCodCategoria";
            }
            lista = em.createNamedQuery("Produto." + namedQuery).setParameter("codigo", codigo).getResultList();
        }catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
}
