<!DOCTYPE html>
<html lang="en">
<head>
	<title>BIT 269's Neptune's Pride</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.datatables.net/1.10.18/css/dataTables.semanticui.css" rel="stylesheet" type="text/css"/>
	<link href="/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="navbar"></div>
<div class="ui container">
	<div class="ui inverted container segment opacity">
		<h1 class="ui center aligned header">Previous Games</h1>
	</div>
	<div class="ui four stackable cards">
		<#list games as game>
			<div class="ui orange card opacity">
				<div class="content">
					<div class="header">${(game.game.name)!"Unknown"}</div>
					<div class="description"><b>${game.teamName}:</b> ${game.winnerNames?join(", ")}</div>
				</div>
			</div>
		</#list>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.semanticui.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/patternomaly@1.3.2/dist/patternomaly.min.js" type="text/javascript"></script>
<script src="/script.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#navbar").load("/navbar.html");
});
</script>
</body>
</html>