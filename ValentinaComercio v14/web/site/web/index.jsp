
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@include file="cabecalho.jsp" %> 
<% 
    List <Produto> ListaDestaque = pDAO.listaDestaque();
    List <Produto> ListaGaleria = pDAO.listaGaleria();
%>

		<div class="banner-section">
			<div class="container">
				<div class="banner-grids">
					<div class="col-md-6 banner-grid">
						<h2>Centrifuga de frutas - Em breve</h2>
						<p>Centrifuga de sucos Britania 800w de Potencia</p>
						<a href="produtos.jsp" class="button"> Confira </a>
					</div>
				<div class="col-md-6 banner-grid1">
						<img src="centrifuga.jpg" class="img-responsive" alt=""/>
                                                <br/><br/><br/><br/>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		</div>
		<div class="banner-bottom">
		<div class="gallery-cursual">
		<!--requried-jsfiles-for owl-->
		<script src="js/owl.carousel.js"></script>
			<script>
				$(document).ready(function() {
					$("#owl-demo").owlCarousel({
						items : 3,
						lazyLoad : true,
						autoPlay : true,
						pagination : false,
					});
				});
			</script>
		<!--requried-jsfiles-for owl -->
		<!--start content-slider-->

		<div id="owl-demo" class="owl-carousel text-center">
                    <%for(Produto obj: ListaGaleria){ %>
			<div class="item">
				<img class="lazyOwl" data-src="../../Fotos/<%=obj.getImagem1()%>" alt="name">
				<div class="item-info">
					<h5><%=obj.getTitulo()%></h5>
				</div>
			</div>
		    <%} %>	
	        </div>
		</div>
		<!--sreen-gallery-cursual-->
		</div>
		</div>
		<div class="gallery">
			<div class="container">
			<h3>Produtos em Destaque</h3>
			<div class="gallery-grids">
                            <!--Aqui começa meu produto -->
                            <%for(Produto Pitem: ListaDestaque) { %>
                            <div class="col-md-3 gallery-grid ">
                                    <a href="detalhe.jsp?codigo=<%=Pitem.getCodigo()%>"> <img src="../../Fotos/<%=Pitem.getImagem1() %>" width="150" height="150" class="img-responsive" alt=""/>
                                    <div class="gallery-info">
                                    <div class="quick">
                                    <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                                    </div>
                                    </div></a>
                                    <div class="galy-info">
                                            <p><%=Pitem.getCodigo() %></p>
                                            <p><%=Pitem.getTitulo() %></p>
                                            <div class="galry">
                                            <div class="prices">
                                            <h5 class="item_price"><%=Pitem.getPreco() %></h5>
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
                            <!--Aqui acaba meu produto -->    
                            <div class="clearfix"></div>
			</div>
		</div>
		</div>
		

<%@include file="rodape.jsp" %>