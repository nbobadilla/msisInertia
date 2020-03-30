<cfoutput>
	<!DOCTYPE html>
	<html class="h-full bg-grey-lighter">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<title>Inertia ColdBox Test</title>
		<link rel="stylesheet" href="#html.elixirPath( "/css/app.css" )#">
		<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet" type="text/css">
    	<link href="https://cdn.jsdelivr.net/npm/quasar@1.9.12/dist/quasar.min.css" rel="stylesheet" type="text/css">
	</head>
	<body class="font-sans leading-none text-grey-darkest antialiased">
		<div class="container">
			#renderView()#
		</div>
	
		<script src="#html.elixirPath( "/js/runtime.js" )#"></script>
		<script src="#html.elixirPath( "/js/vendor.js" )#"></script>
		<script src="#html.elixirPath( "/js/app.js" )#"></script>
		<!--- <script src="https://cdn.jsdelivr.net/npm/vue@^2.0.0/dist/vue.min.js"></script> --->
		<script src="https://cdn.jsdelivr.net/npm/quasar@1.9.12/dist/quasar.umd.min.js"></script>
		<script>

		
			// start the UI; assumes you have a <div id="q-app"></div> in your <body>
			new Vue({
			  el: '##q-app',
			  data: function () {
				return {
				  right: false,
				  left: false,
				  tab: 'Dashboard',
				  quickSearchText: '',
				  studentid: '',
				  coe: ''
				}
			  },
			  methods: {},
			  // ...etc
			})
		</script>
		<cfabort />
	</body>
	</html>
	</cfoutput>