<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AulasJava</title>
<style type="text/css">
body {
	background-repeat: repeat;
	background-color: #C9F;
	font-weight: bold;
	font-family: "Lucida Console", Monaco, monospace;
	text-align: center;
}
</style>
</head>

<body>

<%
	try
	{
		Class.forName("org.postgresql.Driver");
		//out.println("Drive carregado com sucesso!");
	
		String url = "jdbc:postgresql://localhost/cursojavaweb";
		String user = "postgres";
		String senha = "ADMIN";
		
		Connection con = DriverManager.getConnection(url,user,senha);
		//out.println("Conexão realizada com sucesso!");
		
		if(request.getParameter("usuario")!= null)
		{
		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
		ResultSet.CONCUR_READ_ONLY);
		//out.println("Passou pelo statement");
		
		ResultSet rs = st.executeQuery("select * from login where log_usuario = '"+ 
		request.getParameter("usuario") + "' and log_senha = '"+
		request.getParameter("senha")+"'");
		
		if(rs.next())
		{
			response.sendRedirect("index.jsp");
		}
		else
			out.println("Você não tem acesso ao sistema! ");
			
		}
		}
		catch(ClassNotFoundException erroClass)
		{
			out.println("Classe JDBC não localizada, erro"+ erroClass);
		}
		catch(SQLException erroSQL)
		{
		out.println("Erro de conexão como banco de dados, erro"+ erroSQL);
		}
	
	
%>

<p><img src="ImagemSite.gif" width="596" height="226" /></p>
<form id="form" name="form" method="post" action=""> 
  <table width="200" border="1">
    <tr>
      <td colspan="2">Acesso ao Sistema</td>
    </tr>
    <tr>
      <td>Usuário</td>
      <td><label for="usuario"></label>
      <input type="text" name="usuario" id="usuario" /></td>
    </tr>
    <tr>
      <td>Senha</td>
      <td><label for="senha"></label>
      <input type="password" name="senha" id="senha" /></td>
    </tr>
    <tr>
      <td><input type="reset" name="limpar" id="limpar" value="Limpar" /></td>
      <td><input type="submit" name="acesso" id="acesso" value="Acessar" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>	
</body>
</html>