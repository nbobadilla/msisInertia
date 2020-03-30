const elixir 	= require( "coldbox-elixir" );
const webpack 	= require( "webpack" );

elixir.config.mergeConfig({
    plugins: [
        // globally scoped items which need to be available in all templates
        new webpack.ProvidePlugin({
			$              : "jquery",
			jQuery         : "jquery",
			"window.jQuery": "jquery",
			"window.$"     : "jquery",
            "Vue"          : ["vue/dist/vue.esm.js", "default"],
            "window.Vue"   : ["vue/dist/vue.esm.js", "default"]
        })
    ]
});

// used for code splitting
/*
elixir.config.mergeConfig({
	optimization:{
		splitChunks:{
			cacheGroups:{
				shared: {
					chunks: "async",
					minChunks: 2,
					name: "includes/js/pages/shared"
				}
			}
		}
	}
});*/

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your ColdBox application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir.config.mergeConfig({
	optimization: {
	  splitChunks: {
		cacheGroups: {
		  shared: {
			chunks: "async",
			minChunks: 2,
			name: "includes/js/pages/shared"
		  }
		}
	  }
	}
  });

  module.exports = elixir(mix => {
	mix.css("app.css");
	mix.vue("app.js");
  });