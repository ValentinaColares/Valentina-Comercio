<%@page import="util.Criptografia"%>
<%@include file="cabecalho.jsp" %>

<%   
    if (request.getMethod().equals("POST")) {
        //tentativa de login
        
        Cliente cliente = Clientedao.login(request.getParameter("txtEmail"));
        //arrumar login...
        String senhaCerta = cliente.getSenha();
        if(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(senhaCerta)){
            //criar a minha session
            session.setAttribute("cliente", cliente);
            //redirecionar para home
            response.sendRedirect("resumoVenda.jsp"); //depois eu vou direto pra venda
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
				 <p>Faça agora mesmo seu cadastro, é simples e rápido!</p>
				 <a class="acount-btn" href="novaConta.jsp">Criar nova conta</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>REGISTRO DE CLIENTES</h3>
				<p>Se você já possui uma conta conosco, por favor, logue-se.</p>
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