
var PrograGraficas = function() {

	var proyectosRegistrados = function() {
		var mult = document.getElementById("mult").value;
		var prog = document.getElementById("prog").value;
		var prop = document.getElementById("prop").value;
		var indi = document.getElementById("indi").value;
		var red = document.getElementById("red").value;
		var inno = document.getElementById("inno").value;
		var TT = document.getElementById("TT").value;

		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100)
		};

		var barChartData = {
			labels : [ "Multidisciplinario", "Programa Especial",
					"Propuesta de Estudio", "Proyecto individual",
					"Proyecto de red", "Proyecto de innovación",
					"Trabajo terminal" ],
			datasets : [
					{
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,0.8)",
						highlightFill : "rgba(220,220,220,0.75)",
						highlightStroke : "rgba(220,220,220,1)",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor() ]
					}, {
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,0.8)",
						highlightFill : "rgba(151,187,205,0.75)",
						highlightStroke : "rgba(151,187,205,1)",
						data : [ mult, prog, prop, indi, red, inno, TT ]
					} ]

		}
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});

	}
	
	// --------------------------------------------------------------------------

	var pieData = function(){
		var pieData = [ {
			value : document.getElementById("totalUsuGrado1").value,
			color : "#1BBAAA",
			highlight : "#610B0B",
			label : "Usuarios nivel medio superior"
		}, {
			value : document.getElementById("totalUsuGrado2").value,
			color : "#642EFE",
			highlight : "#610B0B",
			label : "Usuarios nivel superior"
		}, {
			value : document.getElementById("totalUsuGrado3").value,
			color : "#B18904",
			highlight : "#610B0B",
			label : "Posgrado"
		},

		];

		var ctx = document.getElementById("chart-area").getContext("2d");
		window.myPie = new Chart(ctx).Pie(pieData);
	};

	// --------------------------------------------------------------------------
	var polarData = function (){
		var polarData = [ {
			value : document.getElementById("proyectosArea1").value,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Ingenieria y Ciencias Fisico Matematicas"
		}, {
			value : document.getElementById("proyectosArea2").value,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Ciencias Sociales y Administrativas"
		}, {
			value : document.getElementById("proyectosArea3").value,
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "Ciencias Medico Biologicas"
		} ];

		var ctx = document.getElementById("chart-area2").getContext("2d");
		window.myPolarArea = new Chart(ctx).PolarArea(polarData, {
			responsive : true
		});
	}

	// --------------------------------------------------------------------------
	
	var pieDataProyectos = function (){
		var afsd = [{
			value : 12,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Red"
		},{
			value : 11,
			color : "#F744AS",
			highlight : "#FF5D5E",
			label : "YELLOW"
		}
		];

		var ctx = document.getElementById("chart-areaReporte").getContext("2d");		
		var a = new Chart(ctx).Pie(afsd);
	}
	
	// --------------------------------------------------------------------------

	return {
		init : function() {
			proyectosRegistrados();
			pieData();
			polarData();
		},
		proyectos : function(){
			pieDataProyectos();
		}
	};

}();