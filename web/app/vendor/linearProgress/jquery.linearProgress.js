/**
 * jquery.linearProgress.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * Linear Progress effect inspired by Google's Material Design
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright (c) 2015 Paulo Mendez,
 * http://www.cerocreativo.cl
 * http://www.rockandthemes.com
 *
 */

;(function ($) {
	"use strict";
	
	var pluginName	= "linearProgress",
		obj 		= "";

	var methods = {
		init: function (options) {
			var defaults = {
				mode: 	"indeterminate",
				state: 	"play",
				value: 	"20",
				buffer: "50",
				type: 	"primary",
				size: 	"initial",
				template:
					'<div class="md-progress-linear" role="progressbar" md-mode="" aria-valuemax="100" aria-valuemin="0" aria-valuenow="88" value="88">' +
						'<div class="md-container">' +
							'<div class="md-dashed"></div>' +
							'<div class="md-bar md-bar1"></div>' +
							'<div class="md-bar md-bar2"></div>' +
						'</div>' +
					'</div',
			}

			var settings = {}

			return this.each(function(){
				var element 	= this,
					$element	= $(this);

				var dataMode 		= $element.data("mode"),
					dataState 		= $element.data("state"),
					dataVal 		= $element.data("value"),
					dataBuffer		= $element.data("buffer"),
					dataType 		= $element.data("type"),
					dataSize		= $element.data("size"),
					metaData		= {
						mode: 		dataMode,
						state: 		dataState,
						value: 		dataVal,
						buffer: 	dataBuffer,
						type: 		dataType,
						size: 		dataSize
 					};

				settings = $.extend({}, defaults, options, metaData);


				// Auto-defaults the mode to either `determinate` or `indeterminate` mode; if not specified
				// --------------------------------------------------
				if ((settings.mode == "determinate") || (settings.mode == "indeterminate") || (settings.mode == "buffer") || (settings.mode == "query")) {
					var mode 		= "md-mode-"+ settings.mode,
						actualMode 	= settings.mode;
				} else {
					var mode 		= "md-mode-indeterminate",
						actualMode 	= "indeterminate";
				}

				var classType = "cc-preloader-"+settings.type;


				// Preloader Elements
				// --------------------------------------------------
				var preloader 		= $element.append(settings.template).addClass(classType).css({"width":"100%"}),
					container 		= $(".md-container",preloader),
					dashed 			= $(".md-dashed",container),
					bar1 			= $(".md-bar1",container),
					bar2 			= $(".md-bar2",container);


				container.addClass(mode);


				// Set Progress Value
				if ((settings.value) && (actualMode == "determinate")) {
					functions.setProgress($element,"P",settings.value);
				}

				// Set Progress & Buffer Value
				if ((settings.value) && (actualMode == "buffer")) {
					functions.setProgress($element,"P",settings.value);
					functions.setProgress($element,"B",settings.buffer);
				}

				// Set Progress State
				if ((settings.state) && (actualMode == "indeterminate")){
					$element.data("actual-mode",actualMode);
				}


				//Always return the "this" object for other plugins.
				//Not this time, cause we are calling the plugin without an element
				return this;
			});

		},
		setProgress: function(value){ 
			return this.each(function(){
				functions.setProgress(this,"P",value);
			});
		},
		setBuffer: function(value){ 
			return this.each(function(){
				functions.setProgress(this,"B",value);
			});
		},
		play: function(){
			return this.each(function(){
				functions.setState(this,"play");
			});
		},
		pause: function(){
			return this.each(function(){
				functions.setState(this,"pause");
			});
		},
		show: function(){
			return this.each(function(){
				functions.setState(this,"show");
			});
		},
		hide: function(){
			return this.each(function(){
				functions.setState(this,"hide");
			});
		}

	} // end methods


	var functions = {
		setProgress: function(element,type,value){
			var preloader 		= $(element),
				container 		= $(".md-container",preloader),
				dashed 			= $(".md-dashed",container),
				bar1 			= $(".md-bar1",container),
				bar2 			= $(".md-bar2",container);

			var translate 		= (value-100)/2,
				scale			= value/100,
				styles 			= {
					"transform":"translateX("+translate+"%) scale("+scale+",1)"
				};

			if (type == "P") {
				bar2.css(styles);
			}

			if (type == "B"){
				bar1.css(styles);
			}

			preloader.attr("aria-valuenow",value);
			preloader.attr("value",value);
		}
	}// end functions



	$.fn[pluginName] = function(methodOrOptions){
		if ( methods[methodOrOptions] ) {
			return methods[ methodOrOptions ].apply( this, Array.prototype.slice.call( arguments, 1 ));
		} else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {
			// Default to "init"
			return methods.init.apply( this, arguments );
		} else {
			$.error( 'Method ' +  methodOrOptions + ' does not exist on '+pluginName );
		}    
	};

})(jQuery);