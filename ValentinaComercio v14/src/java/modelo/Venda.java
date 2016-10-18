/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "venda")
@NamedQueries({
    @NamedQuery(name = "Venda.findAll", query = "SELECT v FROM Venda v")})
public class Venda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "codcliente")
    private int codcliente;
    @Basic(optional = false)
    @Column(name = "datavenda")
    @Temporal(TemporalType.DATE)
    private Date datavenda;
    @Basic(optional = false)
    @Column(name = "total")
    private double total;
    @Basic(optional = false)
    @Column(name = "codstatus")
    private int codstatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "venda")
    private List<Itemvenda> itemvendaList;

    public Venda() {
    }

    public Venda(Integer codigo) {
        this.codigo = codigo;
    }

    public Venda(Integer codigo, int codcliente, Date datavenda, double total, int codstatus) {
        this.codigo = codigo;
        this.codcliente = codcliente;
        this.datavenda = datavenda;
        this.total = total;
        this.codstatus = codstatus;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public int getCodcliente() {
        return codcliente;
    }

    public void setCodcliente(int codcliente) {
        this.codcliente = codcliente;
    }

    public Date getDatavenda() {
        return datavenda;
    }

    public void setDatavenda(Date datavenda) {
        this.datavenda = datavenda;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getCodstatus() {
        return codstatus;
    }

    public void setCodstatus(int codstatus) {
        this.codstatus = codstatus;
    }

    public List<Itemvenda> getItemvendaList() {
        return itemvendaList;
    }

    public void setItemvendaList(List<Itemvenda> itemvendaList) {
        this.itemvendaList = itemvendaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venda)) {
            return false;
        }
        Venda other = (Venda) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Venda[ codigo=" + codigo + " ]";
    }
    
}
