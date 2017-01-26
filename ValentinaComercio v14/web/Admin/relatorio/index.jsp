<%@page import="dao.ItemvendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="modelo.Venda"%>
<%@page import="java.util.List"%>
<%@page import="dao.VendaDAO"%>
<%@include file="../cabecalho.jsp" %>

<% 
    
    VendaDAO Vendadao = new VendaDAO();
    ItemvendaDAO itemVdao = new ItemvendaDAO();
    List<Venda> lista;
    List<Itemvenda> itemVendalista = new ArrayList();
    
    if (request.getParameter("txtFiltro") != null) {
        lista = Vendadao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
    
        //verifico se é excluir
        if(request.getParameter("codigo") != null){
            Venda obj = Vendadao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                Boolean funcionou = Vendadao.excluir(obj);
                if(funcionou){
                    //aqui depois vai ter uma janela
                }
            }
        }
        
        lista = Vendadao.listar();
        itemVendalista = itemVdao.listar();
    }
    
    
    
    

%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Relatório de Vendas

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de vendas
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->

<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            </div>
        </form>
        <div class="panel-body">
           
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Código do Cliente</th>
                        <th>Data da Venda</th>
                        <th>Produtos</th>
                        <th>Valor da Venda</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%for(Venda item: lista)
                    {
                    %>
                    <tr>
                        <td><%=item.getCodigo() %></td>
                        <td><%= item.getCodcliente()%></td>
                        <td><%=item.getDatavenda() %></td>
                        
                        
                        <td><table class="table table-bordered table-hover">
                            <% for(Itemvenda itemVenda: itemVendalista){ %>
                            <tr>    
                                <th>Título do Produto</th>
                                <th>Preço do Produto</th>
                                <th>Quantidade</th>
                            </tr>
                                <td><%=itemVenda.getProduto().getTitulo() %></td>
                                <td><%=itemVenda.getProduto().getPreco() %></td>
                                <td><%=itemVenda.getQuant() %></td> 
                            <%} %>
                        </table></td>
            
                        <td><%=item.getTotal() %></td>
                        <td>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getCodigo()%>">Excluir</button>  
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
           
                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
        </div>
                
                
<%@include file="../modalExcluir.jsp" %>
<%@include file="../rodape.jsp" %>

