function getRandomInt(max) {
	var value = Math.floor(Math.random() * Math.floor(max));
	console.log("Random: " + value)
	return value
}

function getTotalStars(pie, stars){
	$.ajax({
	    url: '/game/totalStars',
	    type: 'GET',
	    contentType: 'application/json',
	    dataType: 'json',
	    success: function (data) {
	        console.log(data);
	        if(pie != null){
	            pie.data.datasets[0].data[0] = data.totalStars - stars;
                pie.update();
	        }
	    },
	    error: function(xhr, status, error){
	        alert("#ERR: xhr.status=" + xhr.status + ", xhr.statusText=" + xhr.statusText + "\nstatus=" + status + ", error=" + error);
	    }
	});
}

function getMembers(pie, teamName, stars){
 	$.ajax({
 	    url: "/players?sort=stars&filter=team:" + teamName,
 	    type: 'GET',
 	    contentType: 'application/json',
 	    dataType: 'json',
 	    success: function (data) {
	        console.log(data);
 	        if(pie != null){
 	            for(count = 0; count < data.length; count++){
 	                var member = data[count]
 	                pie.data.labels[count + 1] = member.alias;
 	                pie.data.datasets[0].data[count + 1] = member.stars;
                }
                getTotalStars(pie, stars)
 	        }
 	    },
 	    error: function(xhr, status, error){
 	        alert("#ERR: xhr.status=" + xhr.status + ", xhr.statusText=" + xhr.statusText + "\nstatus=" + status + ", error=" + error);
 	    }
 	});
 }

function getTeams(pie, totalStars){
 	$.ajax({
 	    url: "/teams?sort=stars",
 	    type: 'GET',
 	    contentType: 'application/json',
 	    dataType: 'json',
 	    success: function (data) {
	        console.log(data);
 	        if(pie != null){
 	            var starCount = 0
 	            for(count = 0; count < data.length; count++){
 	                var team = data[count]
 	                pie.data.labels[count + 1] = team.name;
 	                pie.data.datasets[0].data[count + 1] = team.totalStars;
 	                starCount += team.totalStars;
                }
	            pie.data.datasets[0].data[0] = totalStars - starCount;
                pie.update();
 	        }
 	    },
 	    error: function(xhr, status, error){
 	        alert("#ERR: xhr.status=" + xhr.status + ", xhr.statusText=" + xhr.statusText + "\nstatus=" + status + ", error=" + error);
 	    }
 	});
 }

 $(function() {
    $("table").tablesorter({
        theme : "materialize",
        widthFixed: true
    });
});