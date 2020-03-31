<cfoutput>
	<!DOCTYPE html>
	<html class="h-full bg-grey-lighter">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<title>Inertia ColdBox Test</title>
		<link rel="stylesheet" href="#html.elixirPath( "/js/app.css" )#">
		<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet" type="text/css">
	</head>
	<body class="font-sans leading-none text-grey-darkest antialiased">
		<div class="container">
			#renderView()#
		</div>
	
		<script src="#html.elixirPath( "/js/runtime.js" )#"></script>
		<script src="#html.elixirPath( "/js/vendor.js" )#"></script>
		<script src="#html.elixirPath( "/js/app.js" )#"></script>
	</body>
	</html>
	</cfoutput>
