<%@include file="cabecalho.jsp" %> 

<%
    Produto obj = new Produto();
    //Plista = pDAO.listar();
    if(request.getParameter("marca")!= null){
        Plista = pDAO.listarFiltro(Integer.parseInt(request.getParameter("marca")), "M");
    }
    else{
        
        if(request.getParameter("categoria")!= null){
            Plista = pDAO.listarFiltro(Integer.parseInt(request.getParameter("categoria")), "C");
        }
        else{
            Plista = pDAO.listar();
        }
    }


%>

<div class="product-model">	 
<div class="container">
        <h2>Produtos</h2>			
         <div class="col-md-9 product-model-sec">
            <!--Come�a aqui -->
         <%
            for(Produto Pitem : Plista){
         %>
        <a href="detalhe.jsp?codigo=<%=Pitem.getCodigo()%>"><div class="product-grid">
                <div class="more-product"><span> </span></div>						
                <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <img src="../../Fotos/<%=Pitem.getImagem1() %>"  class="img-responsive" alt="">
                        <div class="b-wrapper">
                        <h4 class="b-animate b-from-left  b-delay03">							
                        <button> + </button>
                        </h4>
                        </div>
                </div>
        </a>					
                <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                                <h4><%=Pitem.getTitulo() %></h4>								
                                <span class="item_price"><%=Pitem.getPreco() %></span>
                                <div class="ofr">
                                  
                          <p class="disc"></p>
                                </div>
                                <input type="text" class="item_quantity" value="<%Pitem.getQuant(); %>" />
                                <input type="button" class="item_add items" value="+">
                                <div class="clearfix"> </div>
                        </div>												
                </div>
        </div>
            <% } %>
                                     <!-- Acaba aqui -->
 
                        </div>	
                <div class="rsidebar span_1_of_left">
                         <section  class="sky-form">
                                 <div class="product_right">
                                         <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
                                         <div class="tab1">
                                                 <ul class="place">								
                                                         <li class="sort">All Clothing</li>
                                                         <li class="by"><img src="images/do.png" alt=""></li>
                                                                <div class="clearfix"> </div>
                                                  </ul>
                                                 <div class="single-bottom">						
                                                                <a href="#"><p>Sports</p></a>
                                                                <a href="#"><p>Gym</p></a>
                                                                <a href="#"><p>Bikins</p></a>
                                                                <a href="#"><p>shorts</p></a>
                                             </div>
                                      </div>						  
                                          <div class="tab2">
                                                 <ul class="place">								
                                                         <li class="sort">All women Clothing</li>
                                                         <li class="by"><img src="images/do.png" alt=""></li>
                                                                <div class="clearfix"> </div>
                                                  </ul>
                                                 <div class="single-bottom">						
                                                                <a href="#"><p>Bikins</p></a>
                                                                <a href="#"><p>Shorts</p></a>									
                                             </div>
                                      </div>
                                          <div class="tab3">
                                                 <ul class="place">								
                                                         <li class="sort">All Men Clothing</li>
                                                         <li class="by"><img src="images/do.png" alt=""></li>
                                                                <div class="clearfix"> </div>
                                                  </ul>
                                                 <div class="single-bottom">						
                                                                <a href="#"><p>Sports</p></a>
                                             </div>
                                      </div>
                                          <div class="tab4">
                                                 <ul class="place">								
                                                         <li class="sort">All Kids</li>
                                                         <li class="by"><img src="images/do.png" alt=""></li>
                                                                <div class="clearfix"> </div>
                                                  </ul>
                                                 <div class="single-bottom">						
                                                                <a href="#"><p>Standing Lamps</p></a>
                                                                <a href="#"><p>shorts</p></a>
                                                                <a href="#"><p>Bikini</p></a>
                                             </div>
                                      </div>
 -->
                                         <!--script-->
                                        <script>
                                                $(document).ready(function(){
                                                        $(".tab1 .single-bottom").hide();
                                                        $(".tab2 .single-bottom").hide();
                                                        $(".tab3 .single-bottom").hide();
                                                        $(".tab4 .single-bottom").hide();
                                                        $(".tab5 .single-bottom").hide();

                                                        $(".tab1 ul").click(function(){
                                                                $(".tab1 .single-bottom").slideToggle(300);
                                                                $(".tab2 .single-bottom").hide();
                                                                $(".tab3 .single-bottom").hide();
                                                                $(".tab4 .single-bottom").hide();
                                                                $(".tab5 .single-bottom").hide();
                                                        })
                                                        $(".tab2 ul").click(function(){
                                                                $(".tab2 .single-bottom").slideToggle(300);
                                                                $(".tab1 .single-bottom").hide();
                                                                $(".tab3 .single-bottom").hide();
                                                                $(".tab4 .single-bottom").hide();
                                                                $(".tab5 .single-bottom").hide();
                                                        })
                                                        $(".tab3 ul").click(function(){
                                                                $(".tab3 .single-bottom").slideToggle(300);
                                                                $(".tab4 .single-bottom").hide();
                                                                $(".tab5 .single-bottom").hide();
                                                                $(".tab2 .single-bottom").hide();
                                                                $(".tab1 .single-bottom").hide();
                                                        })
                                                        $(".tab4 ul").click(function(){
                                                                $(".tab4 .single-bottom").slideToggle(300);
                                                                $(".tab5 .single-bottom").hide();
                                                                $(".tab3 .single-bottom").hide();
                                                                $(".tab2 .single-bottom").hide();
                                                                $(".tab1 .single-bottom").hide();
                                                        })	
                                                        $(".tab5 ul").click(function(){
                                                                $(".tab5 .single-bottom").slideToggle(300);
                                                                $(".tab4 .single-bottom").hide();
                                                                $(".tab3 .single-bottom").hide();
                                                                $(".tab2 .single-bottom").hide();
                                                                $(".tab1 .single-bottom").hide();
                                                        })	
                                                });
                                        </script>
                                        <!-- script -->					 
                         </section>

                         <section  class="sky-form">
                                 <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS</h4>
                                 <div class="row row1 scroll-pane">
                                         <div class="col col-4">
                                                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
                                         </div>
                                         <div class="col col-4">
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>70% - 60% (5)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>50% - 40% (7)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (2)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (5)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
                                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
                                         </div>
                                 </div>
                         </section>  				 

                         <section  class="sky-form">
                                        <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Price</h4>
                                                <ul class="dropdown-menu1">
                                                         <li><a href="">								               
                                                        <div id="slider-range"></div>							
                                                        <input type="text" id="amount" style="border: 0; font-weight: NORMAL;   font-family: 'Dosis-Regular';" />
                                                 </a></li>			
                                          </ul>
                           </section>
                           
                           
                                 <script type="text/javascript" src="js/jquery-ui.min.js"></script>
                                 <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
                                <script type='text/javascript'>//<![CDATA[ 
                                $(window).load(function(){
                                 $( "#slider-range" ).slider({
                                                        range: true,
                                                        min: 0,
                                                        max: 100000,
                                                        values: [ 500, 100000 ],
                                                        slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
                                                        }
                                 });
                                $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

                                });//]]> 
                                </script>
                                


                         <section  class="sky-form">
                                        <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Type</h4>
                                                <div class="row row1 scroll-pane">
                                                        <div class="col col-4">
                                                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Alla (30)</label>
                                                        </div>
                                                        <div class="col col-4">
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Amante   (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Roxy      (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>River Land        (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Penny  (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>N-Gal  (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Penny  (30)</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>N-Gal  (30)</label>
                                                        </div>
                                                </div>
                           </section>
                           <section  class="sky-form">
                                        <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Brand</h4>
                                                <div class="row row1 scroll-pane">
                                                        <div class="col col-4">
                                                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Everyday</label>
                                                        </div>
                                                        <div class="col col-4">
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Dorothy Perkins</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vero Moda </label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nidhi Munim</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Omana Fashion</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>PrettySecrets</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Gold Medal</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Dorothy Perkins</label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vero Moda </label>
                                                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nidhi Munim</label>
                                                        </div>
                                                </div>
                           </section>				   
                 </div>				 
      </div>
        </div>
</div>
 
</div>
-->
<%@include file="rodape.jsp" %> 
