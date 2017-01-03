<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Carrinho"%>
<%@page import="modelo.ItemCarrinho"%>
<%@include file="cabecalho.jsp" %>

<%    
   
    //se o envio for post add o carrinho
    Carrinho carrinho;
    if(session.getAttribute("carrinho")!= null){
        carrinho = (Carrinho)session.getAttribute("carrinho");
    }else{
        carrinho = new Carrinho();
    }
    if(request.getMethod().equals("POST")){
        Integer codigoCar = Integer.parseInt(request.getParameter("txtCodigo"));
        Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));
    
      
        
       
        ItemCarrinho itemCarrinho = new ItemCarrinho();
        itemCarrinho.setQuantidade(qtd);
        Produto produto = pDAO.buscarPorChavePrimaria(codigoCar);
        itemCarrinho.setProduto(produto);
        
        //adiciona ao carrinho
        //verificar se a lista ja existe
         //vejo se o produto ja existe no carrinho com um for para percorrer a lista de itens, se o codigo for igual incrementa a quantidade
        if(carrinho.getListaCarrinho() == null){
            List <ItemCarrinho> listaCarrinho = new ArrayList<ItemCarrinho>();
            listaCarrinho.add(itemCarrinho);
            carrinho.setListaCarrinho(listaCarrinho);
                  
        }else{
            boolean achou = false;
            for(ItemCarrinho item2: carrinho.getListaCarrinho()){
                if(item2.getProduto().getCodigo() == codigoCar){
                    item2.setQuantidade(item2.getQuantidade() + Integer.parseInt(request.getParameter("txtQuantidade")));
                    achou = true;
                    break;
                }
                if(!achou){
                    carrinho.getListaCarrinho().add(itemCarrinho);
                }
            }
        }
        
        carrinho.valorTotal();
        //salva o meu carrinho
        
        //fazer um if para comparar oq vem do banco
        session.setAttribute("carrinho", carrinho);
        
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
                    <% 
                        if(carrinho.getListaCarrinho() != null){
                            for(ItemCarrinho item: carrinho.getListaCarrinho()){
                                
                    %>
                    <div class="cart-sec simpleCart_shelfItem">
                                    <div class="cart-item cyc">
                                             <img src="../../Fotos/<%=item.getProduto().getImagem1() %>" class="img-responsive" alt="">
                                    </div>
                               <div class="cart-item-info">
                                    <h3><a href="#"> <%=item.getProduto().getTitulo()%> </a></h3>
                                    <br>
                                    <p>Quantidade: <%=item.getQuantidade() %></p>
                                    <!-- <ul class="qty">
                                            <li><p>Min. order value:</p></li>
                                            <li><p>FREE delivery</p></li>
                                    </ul> -->
                           
                            <div class="delivery">
                                <p>Preço : <%=item.getProduto().getPreco()%></p>
                                 <!-- <span>Delivered in 1-1:30 hours</span> -->
                                <div class="clearfix"></div>
                            </div>	
                               </div>
                               <div class="clearfix"></div>

                    </div>
                    <%      }
                        } 
                    %>  
                    
                    <form action="finalizarCompra.jsp" method="post">      
                        
                        <div class="btn_form">
                            <button class="add-cart item_add">Finalizar Compra</button>	
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
