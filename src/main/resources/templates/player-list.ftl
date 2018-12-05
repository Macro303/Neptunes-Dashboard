<!DOCTYPE html>
<html lang="en">
<head>
	<title>BIT 269's Neptune's Pride</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
	<link href="/styles.css" rel="stylesheet"/>
</head>
<body>
<div class="navbar-fixed">
	<nav>
		<div class="nav-wrapper blue-grey darken-4">
			<ul class="right">
				<li><a class="orange-text text-lighten-4" href="/">Home</a></li>
				<li><a class="orange-text text-lighten-4" href="/game">Game</a></li>
				<li class="active"><a class="orange-text text-lighten-2" href="/players">Players</a></li>
				<li><a class="orange-text text-lighten-4" href="/players/leaderboard">Player Leaderboard</a></li>
				<li><a class="orange-text text-lighten-4" href="/teams">Teams</a></li>
				<li><a class="orange-text text-lighten-4" href="/teams/leaderboard">Team Leaderboard</a></li>
				<li><a class="orange-text text-lighten-4" href="/help">Help</a></li>
			</ul>
		</div>
	</nav>
</div>
<div class="container">
	<div class="row">
		<#list players as player>
			<div class="card blue-grey darken-2 col s3 offset-s1 small">
				<div class="card-content grey-text text-lighten-2">
					<span class="card-title blue-text"><strong>${player.name!"Unknown"} (${player.alias!"Unknown"})</strong></span>
					<ul class="browser-default">
						<#if player.team != "Unknown">
							<li><b>Team:</b> ${player.team!"None"}</li>
						</#if>
						<li><b>Stars:</b> ${player.stars!"0"}</li>
						<li><b>Percentage:</b> ${player.percentage?string.percent!"0%"}</li>
					</ul>
				</div>
				<div class="card-action">
					<a href="/players/${player.alias!"Unknown"}">More details</a>
				</div>
			</div>
		</#list>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>