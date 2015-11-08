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

	var ejemplo = Function()
	{
		var radarChartData = {
			labels : [ "Eating", "Drinking", "Sleeping", "Designing", "Coding",
					"Cycling", "Running" ],
			datasets : [ {
				label : "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 65, 59, 90, 81, 56, 55, 40 ]
			}, {
				label : "My Second dataset",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [ 28, 48, 40, 19, 96, 27, 100 ]
			} ]
		};
		
		var ctx = document.getElementById("canva").getContext("2d");
		window.myBar = new Chart(ctx).Radar(radarChartData, {
			responsive : true
		});

	}
	return {
		init : function() {
			proyectosRegistrados();
			ejemplo();
		}
	};

}();