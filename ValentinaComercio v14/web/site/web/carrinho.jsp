<%@page import="modelo.ItemCarrinho"%>
<%@include file="cabecalho.jsp" %>

<%
    Produto obj = pDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtCodigo")));
    ItemCarrinho Icarrinho = new ItemCarrinho();
    
    if(request.getParameter("txtCodigo") == null || request.getParameter("txtQuantidade") == null){
        //volta pra tela da listagem
    }else{ 
        if(session.getAttribute("CarrinhoCompras") != null){
            Icarrinho.setProduto(obj);
            Icarrinho.setQuantidade(Integer.parseInt(request.getParameter("txtQuantidade")));
        }else{
            Icarrinho = new ItemCarrinho();
            Icarrinho.setProduto(obj);
            Icarrinho.setQuantidade(Integer.parseInt(request.getParameter("txtQuantidade")));
        }
        
    }
    
    

%>

<!-- checkout -->
<div class="content">
<div class="cart-items">
    <div class="container">
            <h2>Meu carrinho</h2>
                <script>$(document).ready(function(c) {
                            $('.close1').on('click', function(c){
                                    $('.cart-header').fadeOut('slow', function(c){
                                            $('.cart-header').remove();
                                    });
                                    });	  
                            });
               </script>
             <div class="cart-header">
                     <div class="close1"> </div>
                    <div class="cart-sec simpleCart_shelfItem">
                                    <div class="cart-item cyc">
                                             <img src="../../Fotos/<%=obj.getImagem1() %>" class="img-responsive" alt="">
                                    </div>
                               <div class="cart-item-info">
                                    <h3><a href="#"> <%=obj.getTitulo()%> </a></h3>
                                    <ul class="qty">
                                            <li><p>Min. order value:</p></li>
                                            <li><p>FREE delivery</p></li>
                                    </ul>
                                             <div class="delivery">
                                             <p>Preço : <%=obj.getPreco()%></p>
                                             <!-- <span>Delivered in 1-1:30 hours</span> -->
                                             <div class="clearfix"></div>
                            </div>	
                               </div>
                               <div class="clearfix"></div>

                    </div>
                    <form action="finalizarCompra.jsp" method="post">      
                        
                        <div class="btn_form">
                            <button class="add-cart item_add">Adicionar ao carrinho</button>	
                        </div>
                    </form>
             </div>
             <script>$(document).ready(function(c) {
                            $('.close2').on('click', function(c){
                                            $('.cart-header2').fadeOut('slow', function(c){
                                    $('.cart-header2').remove();
                            });
                            });	  
                            });
             </script>
              <script>$(document).ready(function(c) {
                            $('.close3').on('click', function(c){
                                            $('.cart-header3').fadeOut('slow', function(c){
                                    $('.cart-header3').remove();
                            });
                            });	  
                            });
             </script>		
    </div>
</div>
<!-- checkout -->	


<%@include file="rodape.jsp" %>
