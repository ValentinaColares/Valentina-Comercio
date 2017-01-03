<%@page import="util.Criptografia"%>
<%@include file="cabecalho.jsp" %>

<% 

    if (request.getParameter("txtEmail") == null && request.getParameter("txtSenha") == null) {
        cobj.setNome(request.getParameter("txtNome"));
        cobj.setEmail(request.getParameter("txtEmail"));
        if(request.getParameter("txtSenha") == request.getParameter("txtConfirmaSenha")){
            cobj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
            Boolean resultado = Clientedao.incluir(cobj);
        }        
    }
%>


<div class="content">
 <!-- registration -->
	<div class="main-1">
		<div class="container">
			<div class="register">
		  	  <form> 
				 <div class="register-top-grid">
					<h3>DADOS CADASTRAIS</h3>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>Nome<label>*</label></span>
						<input type="text" name="txtNome"> 
					 </div>
					 <div class="wow fadeInRight" data-wow-delay="0.4s">
						<span>E-mail<label>*</label></span>
						<input type="text" name="txtEmail"> 
					 </div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
					   </a>
					 </div>
				     <div class="register-bottom-grid">
						    <h3>INFORMAÇÕES DE LOGIN</h3>
							 <div class="wow fadeInLeft" data-wow-delay="0.4s">
								<span>Senha<label>*</label></span>
								<input type="password" name="txtSenha">
							 </div>
							 <div class="wow fadeInRight" data-wow-delay="0.4s">
								<span>Confirma Senha<label>*</label></span>
								<input type="password" name="txtConfirmaSenha">
							 </div>
					 </div>
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				   <form>
					   <input type="submit" value="submit">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
		 </div>
	</div>
<!-- registration -->


</div>
<%@include file="rodape.jsp" %>