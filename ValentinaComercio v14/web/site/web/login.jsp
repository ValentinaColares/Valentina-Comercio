<%@page import="util.Criptografia"%>
<%@include file="cabecalho.jsp" %>

<%   
    if (request.getMethod().equals("POST")) {
        //tentativa de login
        
        cobj = Clientedao.login(request.getParameter("txtEmail"));
        
        String loginCerto = cobj.getEmail();
        String senhaCerta = cobj.getSenha();
        if(request.getParameter("txtEmail").equals(loginCerto) && request.getParameter("txtSenha").equals(senhaCerta)){
            //criar a minha session
            session.setAttribute("cliente", cobj);
            //redirecionar para home
            response.sendRedirect("index.jsp");
        }
        
    }

%>

		<!--contact-->
			<div class="content">
 <div class="main-1">
		<div class="container">
<div class="login-page">
			   <div class="account_grid">
			   <div class="col-md-6 login-left">
			  	 <h3>NOVO CADASTRO</h3>
				 <p>Fa�a agora mesmo seu cadastro, � simples e r�pido!</p>
				 <a class="acount-btn" href="novaConta.jsp">Criar nova conta</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>REGISTRO DE CLIENTES</h3>
				<p>Se voc� j� possui uma conta conosco, por favor, logue-se.</p>
                                <form  method="post" action="#">
				  <div>
					<span>E-mail:<label>*</label></span>
                                        <input type="email" name="txtEmail" required > 
				  </div>
				  <div>
					<span>Sua Senha<label>*</label></span>
                                        <input type="password" name="txtSenha" required> 
				  </div>
				  <a class="forgot" href="#">Esqueceu sua Senha?</a>
				  <input type="submit" value="Entrar">
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>
		   </div>
		   </div>
	</div>
	</div>
<!-- login -->

<%@include file="rodape.jsp" %>