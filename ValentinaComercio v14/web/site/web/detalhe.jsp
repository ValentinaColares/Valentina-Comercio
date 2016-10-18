<%@include file="cabecalho.jsp" %> 

<% 
    Produto obj = new Produto();
    obj = pDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    
    
%>


<div class="content">
    <div class="single">
            <div class="container">
                    <div class="single-grids">
                            <div class="col-md-4 single-grid1">
                                    <h2>account</h2>
                                            <ul>
                                                    <li><a href="login.html">login</a></li>
                                                    <li><a href="login.html">Register</a></li>
                                                    <li><a href="login.html">Forgot Your Password</a></li>
                                                    <li><a href="account.html">my account</a></li>
                                                    <li><a href="login.html">address books</a></li>
                                                    <li><a href="login.html">wishlist</a></li>
                                                    <li><a href="login.html">order history</a></li>
                                                    <li><a href="login.html">downloads</a></li>
                                                    <li><a href="login.html">reward points</a></li>
                                                    <li><a href="login.html">return</a></li>
                                                    <li><a href="login.html">transaction</a></li>
                                                    <li><a href="login.html">newsletter</a></li>
                                                    <li><a href="login.html">recurring payments</a></li>
                                            </ul>
                            </div>
                        <%%>
                            <div class="col-md-4 single-grid">		
                                    <div class="flexslider">
                                            <ul class="slides">
                                                    <li data-thumb="images/si.jpg">
                                                            <div class="thumb-image"> <img src="../../Fotos/<%=obj.getImagem1() %>" data-imagezoom="true" class="img-responsive"> </div>
                                                    </li>
                                                    <li data-thumb="images/si1.jpg">
                                                             <div class="thumb-image"> <img src="../../Fotos/<%=obj.getImagem2() %>" data-imagezoom="true" class="img-responsive"> </div>
                                                    </li>
                                                    <li data-thumb="images/si2.jpg">
                                                       <div class="thumb-image"> <img src="../../Fotos/<%=obj.getImagem3() %>" data-imagezoom="true" class="img-responsive"> </div>
                                                    </li> 
                                            </ul>
                                    </div>
                            </div>	
                            <div class="col-md-4 single-grid simpleCart_shelfItem">		
                                    <h3><%=obj.getTitulo() %></h3>
                                            <p>Condition  New With the boom of the swimwear market, there are so many places providing swimming costumes that you may not know where to look first. If you want to facilitate your search, drop in at our one-stop store, and you?ll be able to equip yourself properly for water activities.</p>
                                                    <!--<ul class="size">
                                                            <h3>Size</h3>
                                                                    <li><a href="#">25</a></li>
                                                                    <li><a href="#">26</a></li>
                                                                    <li><a href="#">27</a></li>
                                                                    <li><a href="#">28</a></li>
                                                                    <li><a href="#">29</a></li>
                                                                    <li><a href="#">30</a></li>
                                                                    <li><a href="#">31</a></li>
                                                                    <li><a href="#">32</a></li>
                                                                    <li><a href="#">33</a></li>
                                                    </ul> 
                                                    <ul class="size">
                                                            <h3>Length</h3>
                                                                    <li><a href="#">32</a></li>
                                                                    <li><a href="#">34</a></li>
                                                    </ul>-->
                                            <div class="galry">
                                                    <div class="prices">
                                                            <h5 class="item_price"><%=obj.getPreco() %></h5>
                                                    </div>
                                                    <div class="rating">
                                                            <span>?</span>
                                                            <span>?</span>
                                                            <span>?</span>
                                                            <span>?</span>
                                                            <span>?</span>
                                                    </div>
                                                    <div class="clearfix"></div>
                                            </div>
                                            <form action="carrinho.jsp" method="post"> 
                                                <input type="hidden" name="txtCodigo" value="<%=obj.getCodigo()%>"/>
                                                <p class="qty"> Qtd : </p><input min="1" type="number" id="quantity" name="txtQuantidade" value="1" class="form-control input-small">
                                                
                                                <div class="btn_form">
                                                    <button class="add-cart item_add">Adicionar ao carrinho</button>	
                                                </div>
                                            </form>
                                            <div class="tag">
                                                    <p>Category : <a href="#"> <%=obj.getCodcategoria().getNome()%> </a></p>
                                                    <p>Tag : <a href="#"> Lorem ipsum </a></p>
                                            </div>
                            </div>
                            <div class="clearfix"> </div>
                    </div>
            </div>
    </div>
<!-- collapse -->
    <div class="collpse">
    <div class="container">
    <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Description
                    </a>
              </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                    <%=obj.getDescricao()%>
              </div>
            </div>
      </div>
      <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
              <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                       additional information
                    </a>
              </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
              <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
              </div>
            </div>
      </div>
      <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
              <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      reviews (5)
                    </a>
              </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
              <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
              </div>
            </div>
      </div>
      <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFour">
              <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      help
                    </a>
              </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
              <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
              </div>
            </div>
      </div>
    </div>
</div>
</div>
            <% %>
<!-- collapse -->
   
    <div class="related-products">
        <h3>Produtos</h3>
       <%for(Produto objP: Plista){ %>
        <div class="col-md-3 gallery-grid ">
                <a href="detalhe.jsp?codigo=<%=objP.getCodigo()%>"> <img src="../../Fotos/<%=objP.getImagem1()%> " width="150" height="150" class="img-responsive" alt=""/>
                <div class="gallery-info">
                <div class="quick">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                </div>
                </div></a>
                <div class="galy-info">
                        <p><%=objP.getCodigo() %></p>
                        <p><%=objP.getTitulo() %></p>
                        <div class="galry">
                        <div class="prices">
                        <h5 class="item_price"><%=objP.getPreco() %></h5>
                        </div>
                <div class="rating">
                                                <span>?</span>
                                                <span>?</span>
                                                <span>?</span>
                                                <span>?</span>
                                                <span>?</span>
                                        </div>

                <div class="clearfix"></div>
                </div>
                </div>
        </div>
        <% } %> 
   
   </div>
   
   
</div>

<%@include file="rodape.jsp" %>


