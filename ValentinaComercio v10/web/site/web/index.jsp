
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@include file="cabecalho.jsp" %> 
<% 
    List<Produto> lista;
    ProdutoDAO dao = new ProdutoDAO();
    lista = dao.listar();
%>
		<div class="banner-section">
			<div class="container">
				<div class="banner-grids">
					<div class="col-md-6 banner-grid">
						<h2>the latest collections</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						<a href="products.html" class="button"> shop now </a>
					</div>
				<div class="col-md-6 banner-grid1">
						<img src="images/p2.png" class="img-responsive" alt=""/>
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
			<div class="item">
				<img class="lazyOwl" data-src="images/b1.jpg" alt="name">
				<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b2.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b3.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b4.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b1.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b6.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b7.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b1.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b2.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
			<div class="item">
				<img class="lazyOwl" data-src="images/b3.jpg" alt="name">
			<div class="item-info">
					<h5>Lorem ipsum</h5>
				</div>
			</div>
		</div>
		<!--sreen-gallery-cursual-->
		</div>
		</div>
		<div class="gallery">
			<div class="container">
			<h3>Produtos</h3>
			<div class="gallery-grids">
                            <!--Aqui começa meu produto -->
                            <%for(Produto item: lista) { %>
                            <div class="col-md-3 gallery-grid ">
                                    <a href="products.html"> <img src="<%=item.getImagem1() %>" class="img-responsive" alt=""/>
                                    <div class="gallery-info">
                                    <div class="quick">
                                    <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                                    </div>
                                    </div></a>
                                    <div class="galy-info">
                                            <p><%=item.getCodigo() %></p>
                                            <p><%=item.getTitulo() %></p>
                                            <div class="galry">
                                            <div class="prices">
                                            <h5 class="item_price"><%=item.getPreco() %></h5>
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
		<div class="subscribe">
	 <div class="container">
	 <div class="subscribe1">
		 <h4>the latest from swim wear</h4>
		 </div>
		 <div class="subscribe2">
		 <form>
			 <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
			 <input type="submit" value="JOIN">
		 </form>
	 </div>
	 <div class="clearfix"></div>
	 </div>
</div>

<%@include file="rodape.jsp" %>