<%@page import="java.math.BigDecimal"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    String msg = "";
    String classe = "";
    
    ProdutoDAO dao = new ProdutoDAO();
    Produto obj = new Produto();
    
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> clista = cDAO.listar();

    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mlista = mDAO.listar();
    
    if(request.getMethod().equals("POST")){

        Upload up = new Upload();
        up.setFolderUpload("Fotos");

        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp"); //volta pra index
            return;
        }
        //buscar o obj a partir da chave primaria
        //exibe as informa��es od obj no form
        
        Integer codigo = Integer.parseInt(request.getParameter("codigo"));
        obj = dao.buscarPorChavePrimaria(codigo);

        if(up.formProcess(getServletContext(), request)){
            if(up.getForm().get("txtTitulo") == null){
                //volta pra tela da listagem
                response.sendRedirect("index.jsp");
                return;
            }
            //verifica se o campo esta vazio
            if(up.getForm().get("txtCodigo").toString().isEmpty()){
                //volta pra tela da listagem
                response.sendRedirect("index.jsp");
                return;
            }


            obj.setTitulo(up.getForm().get("txtTitulo").toString());
            obj.setDescricao(up.getForm().get("txtDescricao").toString());
            obj.setQuant(Integer.parseInt(up.getForm().get("txtQuant").toString()));
            BigDecimal bd = new BigDecimal(up.getForm().get("txtPreco").toString());
            obj.setPreco(bd);
            
            if(up.getForm().get("txtDestaque") != null){
                obj.setDestaque(true);
            }else{
                obj.setDestaque(false);
            }
            
            if(!up.getFiles().isEmpty()){
                if(up.getFiles().size() > 0){
                    obj.setImagem1(up.getFiles().get(0));
                    
                    if(up.getFiles().size() > 1){
                        obj.setImagem2(up.getFiles().get(1));
                        
                        if(up.getFiles().size() > 2){
                            obj.setImagem3(up.getFiles().get(2));
                        }
                    }
                }
            }

            //Agora as foreigns keys
            Categoria categoria = new Categoria();    
            categoria.setCodigo(Integer.parseInt(up.getForm().get("selCategoria").toString()));
            obj.setCodcategoria(categoria);

            Marca marca = new Marca();    
            marca.setCodigo(Integer.parseInt(up.getForm().get("selMarca").toString()));
            obj.setCodmarca(marca);

            Boolean resultado = dao.alterar(obj);
            if (resultado) {
                msg = "Registro alterado com sucesso";
                classe = "alert-success";
            } else {
                msg = "N�o foi poss�vel alterar";
                classe = "alert-danger";
            }
        }
    }else{    
        
        //METHOD GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new ProdutoDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
        
    

%>    
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Com�rcio Eletr�nico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Produto
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post" enctype="multipart/form-data">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Codigo</label>
                        <input class="form-control" type="text"  name="txtCodigo" readonly required value="<%=obj.getCodigo() %>" />
                        <label>Titulo:</label>
                        <input class="form-control" type="text"  name="txtTitulo"  required value="<%=obj.getTitulo() %>" />
                        <label>Descri��o:</label>
                        <input class="form-control" type="text"  name="txtDescricao"  required value="<%=obj.getDescricao() %>" />
                        <label>Quantidade:</label>
                        <input class="form-control" type="text"  name="txtQuant"  required value="<%=obj.getQuant() %>" />
                        <label>Pre�o:</label>
                        <input class="form-control" type="text"  name="txtPreco"  required value="<%=obj.getPreco() %>" />
                        <label>Destaque:</label>
                        <input class="form-control" type="checkbox"  name="txtDestaque"  value="<%=obj.getDestaque() %>"/>
                        <label>Imagem 1:</label>
                        <input type="file" name="txtImg1"/><br/>
                        <label>Imagem 2:</label>
                        <input type="file" name="txtImg2"/><br/>
                        <label>Imagem 3:</label>
                        <input type="file" name="txtImg3"/><br/>
                        
                        <label>Categoria:</label>
                        <select name="selCategoria" >
                            <option value="<%=obj.getCodcategoria() %>">Selecione</option>
                            <% 
                                for(Categoria cat: clista) {
                            %>
                            <option value="<%=cat.getCodigo() %>" ><%=cat.getNome() %></option>
                            <% 
                                }
                            %>   
                        </select> <br />
                        
                        <label>Marca:</label>
                        <select name="selMarca">
                            <option value="<%=obj.getCodmarca() %>">Selecione</option>
                            <% 
                                for(Marca mar: mlista) {
                            %>
                            <option value="<%=mar.getCodigo() %>" ><%=mar.getNome() %></option>
                            <% 
                                }
                            %>   
                        </select> <br />
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>