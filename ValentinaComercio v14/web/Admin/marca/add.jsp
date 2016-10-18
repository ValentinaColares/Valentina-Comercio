<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    if (request.getParameter("txtNome") != null) {
        MarcaDAO dao = new MarcaDAO();
        Marca obj = new Marca();

        obj.setNome(request.getParameter("txtNome"));
        Boolean resultado = dao.incluir(obj);
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
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
            Marca
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



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>
