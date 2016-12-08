/**
 * jquery.circularProgress.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * Circular Progress effect inspired by Google's Material Design
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
	
	var pluginName	= "circularProgress",
		obj 		= "";

	var methods = {
		init: function (options) {
			var defaults = {
				mode: 	"indeterminate",
				state: 	"play",
				value: 	"50",
				type: 	"primary",
				size: 	"initial",
				template:
					'<div class="md-progress-circular" role="progressbar" data-mode="" aria-valuemax="100" aria-valuemin="0" data-diameter="100">' +
						'<div class="md-spinner-wrapper">' +
							'<div class="md-inner">' +
								'<div class="md-gap"></div>' +
								'<div class="md-left">' +
									'<div class="md-half-circle"></div>' +
								'</div>' +
								'<div class="md-right">' +
									'<div class="md-half-circle"></div>' +
								'</div>' +
							'</div>' +
						'</div>' +
					'</div>',
			}

			var settings = {}

			return this.each(function(){
				var element 	= this,
					$element	= $(this);

				var dataMode 		= $element.data("mode"),
					dataState 		= $element.data("state"),
					dataVal 		= $element.data("value"),
					dataType 		= $element.data("type"),
					dataSize		= $element.data("size"),
					metaData		= {
						mode: 		dataMode,
						state: 		dataState,
						value: 		dataVal,
						type: 		dataType,
						size: 		dataSize
 					};

				settings = $.extend({}, defaults, options, metaData);


				// Auto-defaults the mode to either `determinate` or `indeterminate` mode; if not specified
				// --------------------------------------------------
				if ((settings.mode == "indeterminate") || (settings.mode == "determinate")) {
					var mode 		= "md-mode-"+ settings.mode,
						actualMode 	= settings.mode;
				} else {
					var mode 		= "md-mode-indeterminate",
						actualMode 	= "indeterminate";
				}

				var classType = "cc-preloader-"+settings.type;


				// Preloader Elements
				// --------------------------------------------------
				var preloader 		= $element.append(settings.template).addClass(classType),
					spinnerWrapper 	= $(".md-spinner-wrapper",preloader),
					inner 			= $(".md-inner",spinnerWrapper),
					gap 			= $(".md-gap",inner),
					left 			= $(".md-left",inner),
					right 			= $(".md-right",inner);


				spinnerWrapper.addClass(mode);


				// Set Progress Value
				if ((settings.value) && (actualMode == "determinate")) {
					functions.setProgress($element,settings.value);
				}

				// Set Progress State
				if ((settings.state) && (actualMode == "indeterminate")){
					$element.data("actual-mode",actualMode);
					functions.setState(element,settings.state);
				}


				//Always return the "this" object for other plugins.
				//Not this time, cause we are calling the plugin without an element
				return this;
			});

		},
		set: function(value){ 
			return this.each(function(){
				functions.setProgress(this,value);
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
		setProgress: function(element,value){
			var preloader 		= $(element),
				spinnerWrapper 	= $(".md-spinner-wrapper",preloader),
				inner 			= $(".md-inner",spinnerWrapper),
				gap 			= $(".md-gap",inner),
				left 			= $(".md-left",inner),
				right 			= $(".md-right",inner);

			var gapStyles 	= {
					"border-bottom-color":(value <= 50) ? "transparent !important" : "",
					"transition": (value <= 50) ? "" : "border-bottom-color 0.1s linear"
				},
				rl 			= (value <= 50 ? 135 : (((value - 50) / 50 * 180) + 135)),
				leftStyles 	= {
					"transition": (value >= 50) ? "transform 0.1s linear" : "",
					"transform": "rotate("+rl+"deg)"
				},
				rr 			= (value >= 50 ? 45 : (value / 50 * 180 - 135)),
				rightStyles 	= {
					"transition": (value <= 50) ? "transform 0.1s linear" : "",
					"transform": "rotate("+rr+"deg)"
				};

			$(".md-half-circle",left).css(leftStyles);
			$(".md-half-circle",right).css(rightStyles);
			gap.css(gapStyles);

			preloader.attr("aria-valuenow",value);
			preloader.attr("value",value);
		},
		setState: function(element,state){
			var preloader 		= $(element),
				progress 		= $(".md-progress-circular",preloader),
				spinnerWrapper 	= $(".md-spinner-wrapper",preloader),
				mode 			= preloader.data("actual-mode");

			if (mode == "indeterminate"){
				if (state == "play"){
					progress.removeClass("cc-paused");
				} else if (state == "pause"){
					progress.addClass("cc-paused");
				} else if (state == "show"){
					spinnerWrapper.addClass("md-mode-indeterminate").removeClass("cc-hidden");
				} else if (state == "hide"){
					spinnerWrapper.removeClass("md-mode-indeterminate").addClass("cc-hidden");
				} else {
					// Method does not exist
				}
			}


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