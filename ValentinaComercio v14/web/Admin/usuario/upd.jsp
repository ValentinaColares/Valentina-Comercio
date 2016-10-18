<%@page import="util.Criptografia"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();
    //verifica se � postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setLogin(request.getParameter("txtLogin"));
        
        if(request.getParameter("txtAdmin") != null){
            obj.setAdmin(true);
        }else{
            obj.setAdmin(false);
        }
        
        obj.setSenha(request.getParameter("txtSenha"));
        
        Boolean resultado = dao.alterar(obj);
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "N�o foi poss�vel alterar";
            classe = "alert-danger";
        }
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new UsuarioDAO();        
        obj = dao.buscarPorChavePrimaria(request.getParameter("codigo"));
        
        
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
            Usuario
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" name="txtLogin" readonly required value="<%=obj.getLogin() %>"/>
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtSenha" readonly required value="<%=obj.getSenha() %>" />
                        <label>Admin</label>
                        <input class="form-control" type="checkbox" name="txtAdmin" value="<%=obj.getAdmin() %>" />
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>
