<%@ page import="java.util.*,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/newstyles.css" />
<link type="text/css" rel="stylesheet" href="css/styles.css" />
<script src="js/index.js"></script>
</head>
<body>
	<form action="insert_bd.jsp" method="get">
		<p class="mid"><label for="name">Select you character name: </label><input placeholder="Character Name" id="name" name="name" type="text" defaultValue="Noone"></p> 
		<p class="mid">
		<label>Select your character race:</label> 
		<select id="race" name="race">
			<option value="0">Elf</option>
			<option value="1">Dwarf</option>
			<option value="2">Gnome</option>
			<option value="3">Hoobit</option>
			<option value="4">Hybrid_Orc</option>
			<option value="5" selected>Human</option>
		</select>
		</p>
		<input id="rName" name="rName" type="hidden"/>
		<input id="fstr" name="fstr" type="hidden"/>
		<input id="fdex" name="fdex" type="hidden"/>
		<input id="fcon" name="fcon" type="hidden"/>
		<input id="fint" name="fint" type="hidden"/>
		<input id="fwis" name="fwis" type="hidden"/>
		<input id="fcar" name="fcar" type="hidden"/>
		<input id="fhp" name="fhp" type="hidden"/>
		<input id="fmp" name="fmp" type="hidden"/>		
		<table class="rpgchart">
			<tbody>
				<tr>
					<th colspan="5">
						<h1><span id="chName">Noone</span> the <span id="chRace">Noone</span></h1>
					</th>
				</tr>
				<tr>
					<th rowspan="9">
						<div class="imgcontainer">
							<img id="imgchart" alt="race"/>
						</div>
					</th>
					<th>Attribute</th>
					<th>Value</th>
					<th>Mod.</th>
					<th>Final</th>
				</tr>
				<tr>
					<td>STR:</td>
					<td class="mid">
						<select class="base" id="str" name="str" required></select>
					</td>
					<td class="mod" id="str_mod">0</td>
					<td class="final" id="str_final">0</td>

				</tr>
				<tr>
					<td>DEX:</td>
					<td class="mid">
						<select class="base" id="dex" name="dex" required></select>
					</td>
					<td class="mod" id="dex_mod">0</td>
					<td class="final" id="dex_final">0</td>
				</tr>
				<tr>
					<td>CON:</td>
					<td class="mid">
						<select class="base" id="con" name="con" required></select>
					</td>
					<td class="mod" id="con_mod">0</td>
					<td class="final" id="con_final">0</td>
				</tr>
				<tr>
					<td>INT:</td>
					<td class="mid">
						<select class="base" id="int" name="int" required></select>
					</td>
					<td class="mod" id="int_mod">0</td>
					<td class="final" id="int_final">0</td>
				</tr>
				<tr>
					<td>WIS:</td>
					<td class="mid">
						<select class="base" id="wis" name="wis" required></select>
					</td>
					<td class="mod" id="wis_mod">0</td>
					<td class="final" id="wis_final">0</td>
				</tr>
				<tr>
					<td>CAR:</td>
					<td class="mid">
						<select class="base" id="car" name="car" required></select>
					</td>
					<td class="mod" id="car_mod">0</td>
					<td class="final" id="car_final">0</td>
				</tr>
				<tr>
					<td id="hp_points">HP:</td>
				<td colspan="3">
					<div class="container">
						<div class="hpbar"></div>
					</div>
				</td>
				</tr>
				<tr>
					<td id="mp_points">MP:</td>
				<td colspan="3">
					<div class="container">
						<div class="mpbar"></div>
					</div>
				</td>
				</tr>
			</tbody>
		</table>
		<p class="mid"><button type="button" id="resetStatsSlc">Reiniciar Stats</button></p>
		<p class="mid"><input type="submit" value="Guardar"></p>
		<p class="mid"><button type="button" onClick="window.location.href='menu.jsp'">Volver al Menu</button></p>
	</form>	
</body>
</html>
