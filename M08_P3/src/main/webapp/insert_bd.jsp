<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	String user="usr_generic";
	String password="Thico@2020";
	String host="localhost";
	String db = "examen2022"; 
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;

	// recollim valors formulari:
	String nom=request.getParameter("name");
	String race=request.getParameter("rName");
	String picture=request.getParameter("race");
	String fue=request.getParameter("fstr");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("fdex");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("fcon");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("fint");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("fwis");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("fcar");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("fhp");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("fmp");
	int npm=Integer.parseInt(pm);

try{
	Class.forName("com.mysql.jdbc.Driver").newInstance(); // Mi programa no pasa de esta linea.
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("Data is successfully inserted!");
out.println("<a href=\"menu.jsp\">GO BACK</a>");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>
