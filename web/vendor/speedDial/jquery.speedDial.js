/**
 * jquery.speedDial.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * FAB Speed Dial effect inspired by Google's Material Design
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
	
	var pluginName	= "speedDial",
		obj 		= "";

	var methods = {
		init: function (options) {
			var defaults = {
				mode: "fling",
				direction: "up",
				position: "fixed",
				xPos: ["right","0px"],
				yPos: ["top","0px"],
				clickHide: false,
			}

			var settings = {}

			return this.each(function(){
				var element 	= this,
					$element	= $(this),
					trigger		= $(".md-fab-trigger",element),
					actions		= $(".md-fab-actions",element);

				var dataMode 		= $element.data("mode"),
					dataDir 		= $element.data("direction"),
					dataPos 		= $element.data("position"),
					dataxPos		= $element.data("xPos"),
					datayPos		= $element.data("yPos"),
					dataCH			= $element.data("clickHide"),
					metaData		= {
						mode: 		dataMode,
						direction: 	dataDir,
						position: 	dataPos,
						xPos: 		dataxPos,
						yPos: 		datayPos,
						clickHide: 	dataCH,
 					};

				settings = $.extend({}, defaults, options, metaData);

				var px 		= settings.xPos[0],
					py 		= settings.yPos[0],
					style 	= {
						"position": settings.position,
						"width":"100px",
						"height":"100px"
					};
					style[px] = settings.xPos[1];
					style[py] = settings.yPos[1];
					
				// var	wrapper = $("<div class='cc-speed-dial-wrapper'></div>").css(style),
				// 	parent 	= $element.wrap(wrapper);

				$element.addClass("cc-md-fab-speed-dial");

				var d = "md-"+settings.direction,
					m = "md-"+settings.mode;
				$element.addClass(d).addClass(m);


				// Bind click event on trigger
				trigger.on("click",function(){
					var activeMode = settings.mode;
					if ($element.hasClass("md-is-open")){
						functions.closespeedDial($element);
					} else {
						functions.openspeedDial($element);
					}
				});

				$(".btn",actions).on("click",function(){
					if (settings.clickHide) {
						functions.closespeedDial($element);
					}
				});

				//Always return the "this" object for other plugins.
				//Not this time, cause we are calling the plugin without an element
				//return this;
			});

		},
		open: function(){ 
			return this.each(function(){
				functions.openspeedDial(this);
			});
		},
		close: function(){ 
			return this.each(function(){
				functions.closespeedDial(this);
			});
		},
		mode: function(mode){
			return this.each(function(){
				functions.changeDialMode(this,mode);
			});
		},
		direction: function(direction){
			return this.each(function(){
				functions.changeDialDirection(this,direction);
			});
		}
	} // end methods


	var functions = {
		openspeedDial: function(element){
			var $element	= $(element),
				trigger		= $(".md-fab-trigger",element),
				actions		= $(".md-fab-actions",element);

			$element.removeClass("md-is-open").addClass("md-is-open");
			trigger.attr("aria-expanded","true");
			actions.attr("aria-hidden","false");
		},
		closespeedDial: function(element){
			var $element	= $(element),
				trigger		= $(".md-fab-trigger",element),
				actions		= $(".md-fab-actions",element);

			$element.removeClass("md-is-open");
			trigger.attr("aria-expanded","false");
			actions.attr("aria-hidden","true");
		},
		changeDialMode: function(element,mode){
			var $element	= $(element),
				mode 		= "md-"+mode;
			$element.removeClass("md-scale md-fling").addClass(mode);
		},
		changeDialDirection: function(element,direction){
			var $element	= $(element),
				direction 		= "md-"+direction;
			$element.removeClass("md-up md-down md-left md-right").addClass(direction);
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