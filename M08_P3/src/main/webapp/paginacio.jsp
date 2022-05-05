<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
<link type="text/css" rel="stylesheet" href="css/newstyles.css" />
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<h1 class="mid">Mirar Cartas</h1>
<p class="mid"><button type="button" onClick="window.location.href='menu.jsp'">Volver al Menu</button></p>

<br><br>
<%//  variables per fer la connexio:
	String user="usr_generic";
	String password="Thico@2020";
	String host="localhost";
	String db = "examen2022";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres=null;
	ResultSet rs = null;
	ResultSet num_reg=null;
	int inicio;
	
	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("pagina");
	int pagina = Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM Carta");
int num_total_registros=0;
while(num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:"+num_total_registros+"<br>");
out.print("Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna<br>");
out.print("Mostrant la pàgina "+pagina+" de "+total_paginas+"<p><br>");
%>
<p class="mid">
<%
//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1){
    for (int i=1;i<=total_paginas;i++){
       if (pagina == i)
          //si muestro el índice de la página actual, no coloco enlace
          out.print(pagina);
       else
          //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
          out.print(" <a href=paginacio.jsp?pagina="+i+">"+i+"</a> ");
    }
}
%>
</p>
<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence="SELECT * from Carta limit "+inicio+","+TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta
	%>
	<div id="show">
	<%
	while(rs.next()) {
	//mostramos los resultados obtenidos
	//out.println(rs.getString("ID_carta"));
	//String nom=request.getParameter("nom");
	%>
	<table class="rpgchart_show">
			<tbody>
				<tr>
					<th colspan="5">
						<h1><span id="chName">Noone</span> the <span id="chRace"><%out.print(rs.getString("RACE_carta")); %></span></h1>
					</th>
				</tr>
				<tr>
					<th rowspan="9">
						<div class="imgcontainer">
							<img src="img/<%out.print(rs.getString("PIC_carta")); %>.png" id="imgchart" alt="race"/>
						</div>
					</th>
					<th colspan="2">Stats</th>
				</tr>
				<tr>
					<td>STR: </td>
					<td><%out.print(rs.getString("FUE_carta")); %></td>
				</tr>
				<tr>
					<td>DEX: </td>
					<td><%out.print(rs.getString("FUE_carta")); %></td>
				</tr>
				<tr>
					<td>CON: </td>
					<td><%out.print(rs.getString("DES_carta")); %></td>
				</tr>
				<tr>
					<td>INT: </td>
					<td><%out.print(rs.getString("INT_carta")); %></td>
				</tr>
				<tr>
					<td>WIS: </td>
					<td><%out.print(rs.getString("SAB_carta")); %></td>
				</tr>
				<tr>
					<td>CAR: </td>
					<td><%out.print(rs.getString("CAR_carta")); %></td>
				</tr>
				<tr>
					<td id="hp_points">HP: <%
					String hp = rs.getString("PV_carta");
					out.print(hp); 
					%></td>
				<td colspan="3">
					<div class="container">
						<div class="hpbar" style="width:<%out.print(Double.parseDouble(hp)/160*100); %>%;"></div>
					</div>
				</td>
				</tr>
				<tr>
					<td id="mp_points">MP: <% 
					String mp = rs.getString("PM_carta");
					out.print(mp);
					%></td>
				<td colspan="3">
					<div class="container">
						<div class="mpbar" style="width:<%out.print(Double.parseDouble(mp)/160*100); %>%;"></div>
					</div>
				</td>
				</tr>
			</tbody>
		</table>
	<% 
	}
	%>
	</div>
	<%
	//cerramos la conexión
	rs.close();
	}catch(SQLException error) {
	out.print("Error de Conexión : "+error.toString());
	}  	
	%>
