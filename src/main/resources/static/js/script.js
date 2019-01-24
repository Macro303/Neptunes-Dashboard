function getRandomInt(max) {
	var value = Math.floor(Math.random() * Math.floor(max));
	console.log("Random: " + value)
	return value
}

function getGameStars(pie, stars){
	$.ajax({
	    url: '/game',
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

function getTeamPlayerStars(pie, teamName, stars){
 	$.ajax({
 	    url: "/teams/" + teamName + "/players",
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
                getGameStars(pie, stars)
 	        }
 	    },
 	    error: function(xhr, status, error){
 	        alert("#ERR: xhr.status=" + xhr.status + ", xhr.statusText=" + xhr.statusText + "\nstatus=" + status + ", error=" + error);
 	    }
 	});
 }

function getTeamStars(pie, totalStars){
 	$.ajax({
 	    url: "/teams",
 	    type: 'GET',
 	    contentType: 'application/json',
 	    dataType: 'json',
 	    success: function (data) {
	        console.log(data);
 	        if(pie != null){
 	            var starCount = 0
 	            for(teamCount = 0; teamCount < data.length; teamCount++){
 	                var team = data[teamCount]
 	                pie.data.labels[teamCount + 1] = team.name;
 	                var teamStars = 0
 	                for(memberCount = 0; memberCount < team.members.length; memberCount++){
 	                    var member = team.members[memberCount]
 	                    teamStars += member.stars
 	                }
 	                pie.data.datasets[0].data[teamCount + 1] = teamStars;
 	                starCount += teamStars;
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

 function getPlayerStars(pie, totalStars){
	$.ajax({
		url: "/players",
		type: 'GET',
		contentType: 'application/json',
		dataType: 'json',
		success: function (data) {
		   console.log(data);
			if(pie != null){
				var starCount = 0
				for(count = 0; count < data.length; count++){
					var player = data[count]
					pie.data.labels[count + 1] = player.alias;
					pie.data.datasets[0].data[count + 1] = player.stars;
					starCount += player.stars;
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