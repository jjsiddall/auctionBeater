$(function () {

	for (var i=0;i<$('#chart_ids').data("idarray").length;i++)
	{ 
		var idnum ='#'+$('#chart_ids').data("idarray")[i]
	
        $(idnum).highcharts({
            chart: {
                type: 'scatter',
                zoomType: 'xy'
            },
            title: {
                text: 'Meter Versus Price'
            },
            xAxis: {
                title: {
                    enabled: true,
                    text: 'Meter (Miles)'
                },
                startOnTick: true,
                endOnTick: true,
                showLastLabel: true
            },
            yAxis: {
                title: {
                    text: 'Price (USD)'
                }
            },
            plotOptions: {
                scatter: {
                    marker: {
                        radius: 5,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    },
                    tooltip: {
                        headerFormat: '<b>{series.name}</b><br>',
                        pointFormat: '{point.x}mi, {point.y}USD'
                    }
                }
            },
            series: [{
                name: 'Trucks',
                color: 'rgba(119, 152, 191, .5)',
                data: $(idnum).data("dataset")
            }]
        });
	}
});
    
