
<%@page import="util.Criptografia"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        
        
        obj.setEstado(request.getParameter("txtEstado"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setBairro(request.getParameter("txtBairro"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        obj.setCep(request.getParameter("txtCep"));
        
        Boolean resultado = dao.alterar(obj);
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new ClienteDAO();
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
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Cliente
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getCodigo() %>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>E-mail</label>
                        <input class="form-control" type="text"  name="txtEmail"  required value="<%=obj.getEmail() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" type="password"  name="txtSenha" readonly required value="<%=obj.getSenha() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input class="form-control" type="text"  name="txtEstado"  value="<%=obj.getEstado() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text"  name="txtCidade"  value="<%=obj.getCidade() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Bairro</label>
                        <input class="form-control" type="text"  name="txtBairro"  value="<%=obj.getBairro() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text"  name="txtEndereco"  value="<%=obj.getEndereco() %>"/>
                    </div>
                    <div class="form-group">
                        <label>Cep</label>
                        <input class="form-control" type="text"  name="txtCep"  value="<%=obj.getCep() %>"/>
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>