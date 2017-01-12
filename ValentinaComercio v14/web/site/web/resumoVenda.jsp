<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ItemCarrinho"%>
<%@page import="modelo.Carrinho"%>
<%@include file="cabecalho.jsp" %>
<%
    
    Carrinho carrinho = new Carrinho();
    Venda venda = new Venda();
    Cliente cliente = (Cliente)session.getAttribute("cliente");
       
    
    if(session.getAttribute("carrinho")!= null){
        carrinho = (Carrinho)session.getAttribute("carrinho");
    }else{
        response.sendRedirect("index.jsp"); 
        return;
    }
    
    if(carrinho.getListaCarrinho() == null){
        response.sendRedirect("index.jsp");
        
    }
        
    
    
%>

    <%for(ItemCarrinho itemCar: carrinho.getListaCarrinho()){ %>
    <h2 class="venda">Compra realizada com sucesso!</h2>
    <h3 class="venda"><%=itemCar %></h3> <!--Terminar -->
    <h3 class="venda"><%=cliente.getEndereco() %>, <%=cliente.getBairro() %>, <%=cliente.getCidade() %></h3>
    <%} %>

    
    
<%@include file="rodape.jsp" %>
