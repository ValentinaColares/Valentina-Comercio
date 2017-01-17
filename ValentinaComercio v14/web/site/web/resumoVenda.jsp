<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ItemCarrinho"%>
<%@page import="modelo.Carrinho"%>
<%@include file="cabecalho.jsp" %>
<%
    Carrinho carrinho = new Carrinho();
    Venda venda = new Venda();
    Cliente cliente = new Cliente();

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


%>  
    
    <h2 class="venda">Verifique se seu dados estão corretos e finalize a compra</h2>

    <table class="table table-bordered table-hover">
    
        <tr>
            
            <th>Produtos:</th>
            <th>Preço:</th>
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
            <th>Endereço:</th>
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
