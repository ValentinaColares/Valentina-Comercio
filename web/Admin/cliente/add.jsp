<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();
    List<Cliente> lista; 
    
    if (request.getParameter("txtNome") != null) {
        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        obj.setSenha(request.getParameter("txtSenha"));
        obj.setEstado(request.getParameter("txtEstado"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setBairro(request.getParameter("txtBairro"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        obj.setCep(request.getParameter("txtCep"));

        Boolean resultado =  dao.incluir(obj); //ta dando erro no incluir
        if (resultado) {
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
    } 
    

    /*
    if(request.getParameter("txtFiltro") != null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        // Chama o método que retorna
        // todos registros do banco de dados
        lista = dao.listar();
    } */

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
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    <div class="form-group">
                        <label>E-mail</label>
                        <input class="form-control" type="text"  name="txtEmail"  required />
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" type="text"  name="txtSenha"  required />
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input class="form-control" type="text"  name="txtEstado"   />
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text"  name="txtCidade"  />
                    </div>
                    <div class="form-group">
                        <label>Bairro</label>
                        <input class="form-control" type="text"  name="txtBairro"  />
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text"  name="txtEndereco" />
                    </div>
                    <div class="form-group">
                        <label>Cep</label>
                        <input class="form-control" type="text"  name="txtCep"   />
                    </div>
                    

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>