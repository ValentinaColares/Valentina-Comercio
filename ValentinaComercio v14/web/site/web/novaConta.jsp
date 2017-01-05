<%@page import="util.Criptografia"%>
<%@include file="cabecalho.jsp" %>

<%
    /*
    boolean achou = false;
    if (!cliLista.isEmpty()) {
        for (Cliente item : cliLista) {
            if (request.getParameter("txtEmail").equals(item.getEmail())) {
                String mensagem = "Email ja cadastrado";
                achou = true;
            }
        }
    }*/
    if (request.getMethod().equals("POST")) {

        cobj.setNome(request.getParameter("txtNome"));
        cobj.setEmail(request.getParameter("txtEmail"));
        cobj.setEstado(request.getParameter("txtEstado"));
        cobj.setCidade(request.getParameter("txtCidade"));
        cobj.setEndereco(request.getParameter("txtEndereco"));
        cobj.setBairro(request.getParameter("txtBairro"));
        cobj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        cobj.setCep(request.getParameter("txtCep"));
        Clientedao.incluir(cobj);

        response.sendRedirect("index.jsp");
    }
%>


<div class="content">
    <!-- registration -->
    <div class="main-1">
        <div class="container">
            <div class="register">
                <form method="post" action="#"> 
                    <div class="register-top-grid">
                        <h3>DADOS CADASTRAIS</h3>
                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                            <span>Nome<label>*</label></span>
                            <input type="text" name="txtNome" required> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Estado:<label>*</label></span>
                            <input type="text" name="txtEstado" required> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Cidade:<label>*</label></span>
                            <input type="text" name="txtCidade" required> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Bairro:<label>*</label></span>
                            <input type="text" name="txtBairro" required> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Endereço<label>*</label></span>
                            <input type="text" name="txtEndereco" required> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>CEP:<label>*</label></span>
                            <input type="text" name="txtCep" required> 
                        </div>
                        <div class="clearfix"> </div>
                        <!--<a class="news-letter" href="#">
                              <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
                        </a> -->
                    </div>
                    <div class="register-bottom-grid">
                        <h3>INFORMAÇÕES DE LOGIN</h3>
                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                            <span>E-mail:<label>*</label></span>
                            <input type="email" name="txtEmail" required>
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Senha:<label>*</label></span>
                            <input type="password" name="txtSenha" required>
                        </div>
                    </div>
                    <div class="register-but">

                        <input type="submit" value="submit">
                        <div class="clearfix"> </div>

                    </div>
                    <!-- <input type="submit" value="submit">
                               <div class="clearfix"> </div> -->
                </form>
                <div class="clearfix"> </div>

            </div>
        </div>
    </div>
    <!-- registration -->


</div>
<%@include file="rodape.jsp" %>