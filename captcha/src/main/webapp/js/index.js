const hp_mod = rollDice(8);
const mp_mod = rollDice(4);

window.onload = function () {
	
	let stats = getStats();
	const statsCP = [...stats];
	
	let chName = document.getElementById("name").addEventListener("input",getNameVal);
	let chRace = getRaceVal(5); //human by default
	chRace = document.getElementById("race").addEventListener("input",getRaceVal);
	
	let slcStats = [
		document.querySelector('select#str'),
		document.querySelector('select#dex'),
		document.querySelector('select#con'),
		document.querySelector('select#int'),
		document.querySelector('select#wis'),
		document.querySelector('select#car')
	];
	
	distributeSlc(slcStats);
	 
	/* RESET STATS SELECTION */
	document.getElementById("resetStatsSlc").addEventListener("click",function(){
		stats = [...statsCP];
		slcStats.forEach((slc) => {
			slc.disabled = false;
			slc.value = "";
		});
		distributeSlc(slcStats);
	});
	
	/* UNIQUE STATS OPTIONS */
	slcStats.forEach(slc => {
		slc.addEventListener("input",function(){
			slc.disabled = true;
			val = slc.value
			let i = stats.indexOf(parseInt(val));
			if (i !== -1) stats.splice(i, 1);
			distributeSlc(slcStats);
			slc.value = val;
			getFinalStats();
		});
	});
	
	/* CREATE OPTIONS IN SELECT  */
	function distributeSlc(slcStats){
		slcStats.forEach(slc => {
			if (slc.value == "") slc.innerHTML = "";
			slc.appendChild(document.createElement("option"));
			stats.forEach(stat => {
				let o = document.createElement("option");
				o.value = stat;
				o.text = stat;
				slc.appendChild(o);
			});
		});
	}
	
	/* SAVE SELECTED STATS BY POSITION */
	function saveStat(stat, val){
		switch(stat.id) {
		case "str":
			savedStats[0] = val;
		case "dex":
			savedStats[1] = val;
		case "con":
			savedStats[2] = val;
		case "int":
			savedStats[3] = val;
		case "wis":
			savedStats[4] = val;
		case "car":
			savedStats[5] = val;
		}
	}
}

/* Stats methods */
function rollDice(d){
	return Math.floor(Math.random() * d) + 1;
}
function getStats(){
	let arr = [];
	let arrlength = 6;
	for (let i = 0 ; i < arrlength ; i++){
		arr[i] = rollStat()
	}
	return arr;
}
function rollStat(){
	let arr = [];
	let arrlength = 4;
	for (let i = 0 ; i < arrlength ; i++){
		arr[i] = rollDice(6);
	}
	arr.shift(arr.sort(function(a,b){return a - b}));
	let value = 0;
	arr.forEach (function(v){
		value += v;
	});
	return value;
}
/* Stats methods */

/* Name - Race methods */
function getNameVal() {
	let val = document.querySelector('#name').value;
  	document.getElementById("chName").innerHTML = val;
  	console.log(val);
  	return val;
  	
}
function getRaceVal() {
	let val = document.querySelector('#race').value;
	document.getElementById("chRace").innerHTML = getRace(val);
	return val; //devuelve el int
}
function getRace(i){
	let str_mod = document.getElementById("str_mod");
	let dex_mod = document.getElementById("dex_mod");
	let con_mod = document.getElementById("con_mod");
	let int_mod = document.getElementById("int_mod");
	let wis_mod = document.getElementById("wis_mod");
	let car_mod = document.getElementById("car_mod");
	str_mod.innerHTML = 0;
	dex_mod.innerHTML = 0;
	con_mod.innerHTML = 0;
	int_mod.innerHTML = 0;
	wis_mod.innerHTML = 0;
	car_mod.innerHTML = 0;
	let r = "";
	document.getElementById("imgchart").src = "img/"+i+".png";
	switch(i) {
		case "0":
			dex_mod.innerHTML = "2";
			int_mod.innerHTML = "2";
			con_mod.innerHTML = "-2";
			r="Elf";
			break;
		case "1":
			con_mod.innerHTML = "2";
			wis_mod.innerHTML = "2";
			car_mod.innerHTML = "-2";
			r="Dwarf";
			break;
		case "2":
			con_mod.innerHTML = "2";
			car_mod.innerHTML = "2";
			str_mod.innerHTML = "-2";
			r="Gnome";
			break;
		case "3":
			dex_mod.innerHTML = "2";
			str_mod.innerHTML = "-2";
			r="Hoobit";
			break;
		case "4":
			str_mod.innerHTML = "2";
			con_mod.innerHTML = "2";
			car_mod.innerHTML = "-2";
			r="Hybrid Orc";
			break;
		case "5":
			r="Human";
			break;
	}
	getFinalStats();
	document.getElementById("rName").value = r;
	return r;
}
/* Name - Race methods */

function getFinalStats(){
	
	let modStats = [
		parseInt(document.querySelector('td#str_mod').innerHTML),
		parseInt(document.querySelector('td#dex_mod').innerHTML),
		parseInt(document.querySelector('td#con_mod').innerHTML),
		parseInt(document.querySelector('td#int_mod').innerHTML),
		parseInt(document.querySelector('td#wis_mod').innerHTML),
		parseInt(document.querySelector('td#car_mod').innerHTML)
	];
	
	let baseStats = [
		isNaN(parseInt(document.querySelector('select#str').value)) ? 0 : parseInt(document.querySelector('select#str').value),
		isNaN(parseInt(document.querySelector('select#dex').value)) ? 0 : parseInt(document.querySelector('select#dex').value),
		isNaN(parseInt(document.querySelector('select#con').value)) ? 0 : parseInt(document.querySelector('select#con').value),
		isNaN(parseInt(document.querySelector('select#int').value)) ? 0 : parseInt(document.querySelector('select#int').value),
		isNaN(parseInt(document.querySelector('select#wis').value)) ? 0 : parseInt(document.querySelector('select#wis').value),
		isNaN(parseInt(document.querySelector('select#car').value)) ? 0 : parseInt(document.querySelector('select#car').value)
	];
	
	let finalStats = [
		baseStats[0] + modStats[0] < 0 ? 0 : baseStats[0] + modStats[0],
		baseStats[1] + modStats[1] < 0 ? 0 : baseStats[1] + modStats[1],
		baseStats[2] + modStats[2] < 0 ? 0 : baseStats[2] + modStats[2],
		baseStats[3] + modStats[3] < 0 ? 0 : baseStats[3] + modStats[3],
		baseStats[4] + modStats[4] < 0 ? 0 : baseStats[4] + modStats[4],
		baseStats[5] + modStats[5] < 0 ? 0 : baseStats[5] + modStats[5]
	];
	
	document.getElementById("str_final").innerHTML = finalStats[0];
	document.getElementById("fstr").value = finalStats[0];
	
	document.getElementById("dex_final").innerHTML = finalStats[1];
	document.getElementById("fdex").value = finalStats[1];
	
	document.getElementById("con_final").innerHTML = finalStats[2];
	document.getElementById("fcon").value = finalStats[2];
	
	document.getElementById("int_final").innerHTML = finalStats[3];
	document.getElementById("fint").value = finalStats[3];
	
	document.getElementById("wis_final").innerHTML = finalStats[4];
	document.getElementById("fwis").value = finalStats[4];
	
	document.getElementById("car_final").innerHTML = finalStats[5];
	document.getElementById("fcar").value = finalStats[5];

	let hp = Math.round(finalStats[2] * hp_mod);
	let mp = Math.round(((finalStats[3] + finalStats[4]) / 2) * mp_mod);

	document.getElementById("hp_points").innerHTML = "HP: ("+hp+")";
	document.getElementById("mp_points").innerHTML = "MP: ("+mp+")";
	document.querySelector(".hpbar").style = "width:"+(hp/160*100)+"%";
	document.querySelector(".mpbar").style = "width:"+(mp/160*100)+"%";
	document.getElementById("fhp").value = hp;
	document.getElementById("fmp").value = mp;
}