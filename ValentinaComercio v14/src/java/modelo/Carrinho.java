/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author aluno
 */
public class Carrinho {
    private List<ItemCarrinho> listaCarrinho;
    private BigDecimal total;

    public List<ItemCarrinho> getListaCarrinho() {
        return listaCarrinho;
    }

    public void setListaCarrinho(List<ItemCarrinho> listaCarrinho) {
        this.listaCarrinho = listaCarrinho;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Double valorTotal(){
        Double resultado = 0.0;
        for(ItemCarrinho item: listaCarrinho){
            resultado = resultado + (item.getProduto().getPreco().doubleValue() * item.getQuantidade());
        }
         
        return resultado;
    }
    
}
