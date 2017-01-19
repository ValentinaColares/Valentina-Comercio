<%@page import="dao.VendaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Venda"%>
<%@page import="dao.ItemvendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="modelo.ItemCarrinho"%>
<%@page import="modelo.Carrinho"%>
<%@include file="cabecalho.jsp" %>
<%
    Carrinho carrinho = new Carrinho();
    Itemvenda itemVenda = new Itemvenda();
    Cliente cliente = new Cliente();
    ItemvendaDAO itemVendaDAO = new ItemvendaDAO();
    Venda venda = new Venda();
    VendaDAO vendaDAO = new VendaDAO();
    List<Itemvenda> listItemvenda = new ArrayList();
    Date data = new Date();

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
    for(ItemCarrinho itemCar: carrinho.getListaCarrinho() ){
        itemVenda.setProduto(itemCar.getProduto());
        itemVenda.setPreco(itemCar.getProduto().getPreco().doubleValue());
        itemVenda.setQuant(itemCar.getQuantidade());
        //itemVenda.setItemvendaPK(itemvendaPK);
        listItemvenda.add(itemVenda);
        
        itemVendaDAO.incluir(itemVenda);
    }
    
    venda.setCodcliente(cliente.getCodigo());
    venda.setCodstatus(1);
    venda.setDatavenda(data);
    venda.setTotal(carrinho.valorTotal());  
    venda.setItemvendaList(listItemvenda);
    
    vendaDAO.incluir(venda);

    
    

%>  
    
    <h2 class="venda">Verifique se seu dados est�o corretos e finalize a compra</h2>

    <table class="table table-bordered table-hover">
    
        <tr>
            
            <th>Produtos:</th>
            <th>Pre�o:</th>
        </tr>
        <%for (ItemCarrinho itemCar : carrinho.getListaCarrinho()) {%>
        <tr>              
            <th><%=itemCar.getProduto().getTitulo()%></th>
            <th><%=itemCar.getProduto().getPreco() %></th>
                <%}%>
        </tr>
    </table >
    
    <table class="table table-bordered table-hover">
        <tr>
            <th>Endere�o:</th>
            <th><%=cliente.getEndereco()%>, <%=cliente.getBairro()%>, <%=cliente.getCidade()%></th>
        </tr>
        <tr>
            <th>Valor Total:</th>
            <th><%=carrinho.valorTotal()%></th>
        </tr>
    </table>

    
        
        
    <div class="container">
        <div class="btn_form">
            <a href="venda.jsp" class="add-cart item_add">Finalizar Compra</a>	
        </div>
    </div>

<%@include file="rodape.jsp" %>
