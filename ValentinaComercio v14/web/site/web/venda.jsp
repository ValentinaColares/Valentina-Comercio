<%@page import="modelo.ItemCarrinho"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Carrinho"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="modelo.Venda"%>
<%@include file="cabecalho.jsp" %>
<% 
    Venda venda = new Venda();
    Itemvenda itemVenda = new Itemvenda();
    List<Itemvenda> itemvendaLista = new ArrayList();
    
    Date data = new Date();
    
    Cliente cliente = new Cliente();
    
    Carrinho carrinho = new Carrinho();
    ItemCarrinho itemCar = new ItemCarrinho();
    List<ItemCarrinho> listaCarrinho = new ArrayList();
    
    if (session.getAttribute("carrinho") != null && session.getAttribute("cliente") != null) {
        carrinho = (Carrinho) session.getAttribute("carrinho");
        cliente = (Cliente) session.getAttribute("cliente");
    } else {
        response.sendRedirect("index.jsp");
        return;
    }
    
    if (carrinho.getListaCarrinho() == null) {
        response.sendRedirect("index.jsp");

    }
    
    listaCarrinho = carrinho.getListaCarrinho();
    
    venda.setCodcliente(cliente.getCodigo());
    venda.setCodstatus(1);
    venda.setDatavenda(data);
    venda.setTotal(carrinho.valorTotal());
    
    for(Itemvenda item: itemvendaLista){
        item.setProduto(itemCar.getProduto());
        item.setPreco(itemCar.getProduto().getPreco().doubleValue());
        item.setQuant(itemCar.getQuantidade());
        item.setVenda(venda);
    }
    
    

%>

    <h1 class="venda">Compra realizada com sucesso!</h1>

<%@include file="rodape.jsp" %>