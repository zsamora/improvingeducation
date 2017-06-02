window.onload = function(){
	var competencias = <?php echo $comp_general ?>;
	var metas = <?php echo $meta_general ?>;
	var general = <?php echo $prom_general ?>;
	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	type: 'bar',
	data: {
			labels: ["Competencias", "Metas","General"],
			datasets: [{
					data: [competencias, metas, general],
					backgroundColor: [
							'rgba(255, 99, 132, 0.2)',
							'rgba(100, 99, 100, 0.2)',
							'rgba(54, 162, 235, 0.2)'
					],
					borderColor: [
							'rgba(255,99,132,1)',
							'rgba(100,100,132,1)',
							'rgba(54, 162, 235, 1)'
					],
					borderWidth: 2
			}]
	},
	options: {
			legend: {
				display: false
			},
			scales: {
					yAxes: [{
							ticks: {
									beginAtZero:true
							}
					}]
			}
	}
});
	//var autoeval = <?php echo $autoeval_general ?>;
	//var superior = <?php echo $superior_general ?>;
	//var colaborador = <?php echo $colaborador_general ?>;
	var ctx2 = document.getElementById("myChart2");
	var myChart2 = new Chart(ctx2, {
	type: 'bar',
	data: {
	labels: ["General","Auto-Evaluación","Superior","Colaborador"],
	datasets: [{
			data: [competencias,0.5,0.8,0.6],
			backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(100, 99, 100, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(54, 50, 235, 0.2)'
			],
			borderColor: [
					'rgba(255,99,132,1)',
					'rgba(100,100,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 50, 235, 1)'
			],
			borderWidth: 2
	}]
	},
	options: {
		legend: {
			display: false
		},
		scales: {
				yAxes: [{
						ticks: {
								beginAtZero:true
						}
				}]
		}
	}
});
};
