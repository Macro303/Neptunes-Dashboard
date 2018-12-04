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
		<div class="nav-wrapper grey darken-4">
			<ul class="right hide-on-med-and-down" id="nav-mobile">
				<li>
					<a href="/">Home</a>
				</li>
				<li>
					<a href="/game">Game</a>
				</li>
				<li>
					<a href="/players">Players</a>
				</li>
				<li>
					<a href="/players/leaderboard">Player Leaderboard</a>
				</li>
				<li class="active">
					<a href="/teams">Teams</a>
				</li>
				<li>
					<a href="/teams/leaderboard">Team Leaderboard</a>
				</li>
				<li>
					<a href="/help">Help</a>
				</li>
			</ul>
		</div>
	</nav>
</div>
<div class="container">
	<div class="card grey darken-2">
		<div class="card-content white-text">
			<span class="card-title">${team.name!"Unknown"}</span>
			<ul class="browser-default">
				<li><b>Stars:</b> ${team.stars!"0"}</li>
				<li><b>Percentage:</b> ${team.percentage?string.percent!"0%"}</li>
				<li><b>Fleet:</b> ${team.fleet!"0"}</li>
				<li><b>Economy:</b> ${team.economy!"0"}</li>
				<li><b>Industry:</b> ${team.industry!"0"}</li>
				<li><b>Science:</b> ${team.science!"0"}</li>
				<li><b>Ships:</b> ${team.ships!"0"}</li>
				<li><b>Technology:</b>
					<ul class="browser-default">
						<li><b>Scanning:</b> ${team.technology.scanning!"0"}</li>
						<li><b>Hyperspace:</b> ${team.technology.hyperspace!"0"}</li>
						<li><b>Terraforming:</b> ${team.technology.terraforming!"0"}</li>
						<li><b>Experimentation:</b> ${team.technology.experimentation!"0"}</li>
						<li><b>Weapons:</b> ${team.technology.weapons!"0"}</li>
						<li><b>Banking:</b> ${team.technology.banking!"0"}</li>
						<li><b>Manufacturing:</b> ${team.technology.manufacturing!"0"}</li>
					</ul>
				</li>
				<li><b>Members:</b>
					<ul class="browser-default">
						<#list team.members as member>
							<li>${member}</li>
						</#list>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>