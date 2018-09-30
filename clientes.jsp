<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>Clientes</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}

/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #000000;
	text-decoration: none; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #000000;
	text-decoration: none;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
	color: #000000;
	font-weight: normal;
}

/* ~~this fixed width container surrounds the other divs~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}

/* ~~ the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo ~~ */
.header {
	background-color: #ADB96E;
}

/* ~~ These are the columns for the layout. ~~ 

1) Padding is only placed on the top and/or bottom of the divs. The elements within these divs have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

2) No margin has been given to the columns since they are all floated. If you must add margin, avoid placing it on the side you're floating toward (for example: a right margin on a div set to float right). Many times, padding can be used instead. For divs where this rule must be broken, you should add a "display:inline" declaration to the div's rule to tame a bug where some versions of Internet Explorer double the margin.

3) Since classes can be used multiple times in a document (and an element can also have multiple classes applied), the columns have been assigned class names instead of IDs. For example, two sidebar divs could be stacked if necessary. These can very easily be changed to IDs if that's your preference, as long as you'll only be using them once per document.

4) If you prefer your nav on the right instead of the left, simply float these columns the opposite direction (all right instead of all left) and they'll render in reverse order. There's no need to move the divs around in the HTML source.

*/
.sidebar1 {
	float: left;
	width: 180px;
	background-color: #EADCAE;
	padding-bottom: 10px;
}
.content {
	padding: 10px 0;
	width: 780px;
	float: left;
	text-align: justify;
}

/* ~~ This grouped selector gives the lists in the .content area space ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* this padding mirrors the right padding in the headings and paragraph rule above. Padding was placed on the bottom for space between other elements on the lists and on the left to create the indention. These may be adjusted as you wish. */
}

/* ~~ The navigation list styles (can be removed if you choose to use a premade flyout menu like Spry) ~~ */
ul.nav {
	list-style: none; /* this removes the list marker */
	border-top: 1px solid #666; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	margin-bottom: 15px; /* this creates the space between the navigation on the content below */
}
ul.nav li {
	border-bottom: 1px solid #666; /* this creates the button separation */
}
ul.nav a, ul.nav a:visited { /* grouping these selectors makes sure that your links retain their button look even after being visited */
	padding: 5px 5px 5px 15px;
	display: block; /* this gives the link block properties causing it to fill the whole LI containing it. This causes the entire area to react to a mouse click. */
	width: 160px;  /*this width makes the entire button clickable for IE6. If you don't need to support IE6, it can be removed. Calculate the proper width by subtracting the padding on this link from the width of your sidebar container. */
	text-decoration: none;
	background-color: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ The footer ~~ */
.footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* this gives IE6 hasLayout to properly clear */
	clear: both; /* this clear property forces the .container to understand where the columns end and contain them */
}

/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the #footer is removed or taken out of the #container */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
.container .content blockquote blockquote blockquote blockquote blockquote blockquote .usuarios strong {
	font-size: 18px;
}
.man_user {
	font-weight: bold;
}
.container .content blockquote blockquote blockquote blockquote blockquote .man_user strong {
	font-size: 123%;
}
.container .content table tr td {
	text-align: center;
}
a {
	font-family: Verdana, Geneva, sans-serif;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></head>

<body bgcolor="#666666" text="#000000">



<div class="container">
  <div class="header"><a href="#"><img src="ImagemSite.gif" alt="Insert Logo Here" name="Insert_logo" width="183" height="114" id="Insert_logo" style="background-color: #C6D580; display:block;" /></a> 
    <!-- end .header --></div>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="index.jsp"title="Principal" target="_parent" id="linkUsuario">Principal</a></li>
      <li><a href="bairro.jsp">Bairros</a></li>
      <li><a href="clientes.jsp">Clientes</a></li>
      <li><a href="usuarios.jsp" title="Usuários" target="_parent" id="linkUsuario">Usuários</a></li>
    </ul>
    <p>If you would like the navigation along the top, simply move the ul.nav to the top of the page and recreate the styling.</p>
  <!-- end .sidebar1 --></div>
  <div class="content">
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <blockquote>
              <p class="man_user"><strong>Manutenção de Clientes </strong></p>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <form id="form1" name="form1" method="post" action="">
      <p><a href="cadClientes.jsp">Novo<img src="ImagemSite.png" width="40" height="40" alt="Novo" /></a>
        Imprimir<a href="imprimir_clientes.jsp"><img src="ImagemSite.png" width="40" height="40" alt="Imprimir" /></a>     </p>
                  <p>&nbsp;</p>
      <table width="785" height="84" border="1">
                    <tr bgcolor="#666666" style="font-weight: bold">
                      <td width="60"><a href="clientes.jsp?ordenacao=codigo">Código</a></td>
                      <td width="98"><a href="clientes.jsp?ordenacao=nome">Nome Cliente</a></td>
                      <td width="117">CPF</td>
                      <td width="73">RG</td>
                      <td width="103">Telefone</td>
                      <td width="137">Email</td>
                      <td width="61">Alterar</td>
                      <td width="84">Excluir</td>
                    </tr>
                    <%
	try
	{
		Class.forName("org.postgresql.Driver");
		
	
		String url = "jdbc:postgresql://localhost/cursojavaweb";
		String user = "postgres";
		String senha = "ADMIN";
		
		Connection con = DriverManager.getConnection(url,user,senha);
		
		
		
		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
		ResultSet.CONCUR_READ_ONLY);
		
		if( request.getParameter("acao") != null)
		{
			st.executeUpdate("delete from clientes where cli_codigo = " + request.getParameter("codigo"));	
		}
		
		ResultSet rs = null;
		
		if(request.getParameter("ordenacao") == null)
		
			rs = st.executeQuery("select * from clientes order by cli_codigo");
			
		else if(request.getParameter("ordenacao").equals("codigo"))
		
			rs = st.executeQuery("select * from clientes order by cli_codigo");
			
		else if(request.getParameter("ordenacao").equals("nome"))
		
			rs = st.executeQuery("Select * from clientes order by cli_nome");
		
		while(rs.next())
		{	
	%>
                    <tr>
                      <td><%=rs.getString("cli_codigo")%></td>
                      <td><%=rs.getString("cli_nome")%></td>
                      <td bgcolor="#D6D6D6"><%=rs.getString("cli_telefone")%></td>
                      <td><%=rs.getString("cpf")%></td>
                      <td><%=rs.getString("rg")%></td>                 
                      <td><%=rs.getString("email")%></td>
                      <td><a href="alteraClientes.jsp?codigo=<%=rs.getString("cli_codigo")%>&amp;nome=<%=rs.getString("cli_nome")%>&amp;telefone=<%=rs.getString("cli_telefone")%>&amp;cpf=<%=rs.getString("cpf")%>&amp;rg=<%=rs.getString("rg")%>&amp;email=<%=rs.getString("email")%>&amp;bairro=<%=rs.getString("bairro")%>">
                      <img src="ImagemSite.png" width="40" height="40" alt="Alterar" /></a></td>
                      <td><a href="clientes.jsp?acao=excluir&amp;codigo=<%=rs.getString("cli_codigo")%>"><img src="ImagemSite.png" width="40" height="40" alt="Excluir" /></a></td>
                    </tr>
                    <%
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
                  </table>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </form>
    <table width="200%">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <h1>&nbsp;</h1>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <!-- end .content --></div>
  <div class="footer">
    <p>This .footer contains the declaration position:relative; to give Internet Explorer 6 hasLayout for the .footer and cause it to clear correctly. If you're not required to support IE6, you may remove it.</p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
