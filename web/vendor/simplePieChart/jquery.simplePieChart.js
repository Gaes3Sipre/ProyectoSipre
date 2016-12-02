/**
 * jquery.simplePieChart.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * Simple SVG Pie Charts
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
	
	var pluginName	= "simplePieChart",
		obj 		= "";

	var methods = {
		init: function (options) {
			var defaults = {
				type: 			"default",
				barColor: 		"#E5E6E6",
				trackColor: 	"#F2F3F3",
				lineCap: 		"square",
				lineWidth: 		"5",
				size: 			"110",
				duration: 		false,
				percent: 		"50",
				onStart: 		function(){},
				onStop: 		function(){},
				onStep: 		function(){}
			}

			var settings = {}

			return this.each(function(){
				var element 	= this,
					$element	= $(this);

				var dataType 		= $element.data("type"),
					dataBarColor	= $element.data("barColor"),
					dataTrackColor	= $element.data("trackColor"),
					dataLineCap		= $element.data("lineCap"),
					dataLineWidth 	= $element.data("lineWidth"),
					dataSize 		= $element.data("size"),
					dataDuration 	= $element.data("duration"),
					dataPercent 	= $element.data("percent"),
					metaData		= {
						type: 		dataType,
						barColor: 	dataBarColor,
						trackColor: dataTrackColor,
						lineCap: 	dataLineCap,
						lineWidth: 	dataLineWidth,
						size: 		dataSize,
						duration: 	dataDuration,
						percent: 	dataPercent,
 					};

				settings = $.extend({}, defaults, options, metaData);

				// Auto-defaults Chart Structure
				// --------------------------------------------------
				var center 		= settings.size /2,
					radio 		= center - (settings.lineWidth),
					pi 			= 2*3.14*radio,
					percent 	= pi - (settings.percent * pi / 100),
					template	=	'<div class="cc-spc-wrapper" role="pie-chart" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-valuenow="0" data-diameter="'+settings.size+'">' +
										'<div class="cc-spc-chart-percent"><span>'+settings.percent+'</span>%</div>'+
										'<svg class="cc-spc-svg" width="'+settings.size+'" height="'+settings.size+'">'+
											'<circle class="cc-spc-track" cx="'+center+'" cy="'+center+'" r="'+radio+'" fill="transparent" stroke="'+settings.trackColor+'" stroke-width="'+settings.lineWidth+'" />'+
											'<circle class="cc-spc-bar" cx="'+center+'" cy="'+center+'" r="'+radio+'" fill="transparent" stroke="'+settings.barColor+'" stroke-width="'+settings.lineWidth+'" stroke-dasharray="'+pi+'" stroke-dashoffset="'+pi+'" stroke-linecap="'+settings.lineCap+'" />'+
										'</svg>'+
									'</div>',
					classType 	= "cc-spc-"+settings.type,
					style 		= {
						"width":settings.size+"px",
						"height":settings.size+"px"
					}
					if (settings.trackColor == "inherit") {
						classType += " inherit-track-color";
					}


				// Chart Elements
				// --------------------------------------------------
				var chart 	= $element.append(template).addClass(classType),
					wrapper = $(".cc-spc-wrapper",chart).data("pi",pi).data("duration",settings.duration).css(style),
					track 	= $(".cc-spc-track",wrapper),
					bar 	= $(".cc-spc-bar",wrapper);

				// Set Progress Value
				functions.setProgress($element,settings.percent);


				//Always return the "this" object for other plugins.
				//Not this time, cause we are calling the plugin without an element
				return this;
			});

		},
		set: function(value){ 
			return this.each(function(){
				functions.setProgress(this,value);
			});
		}
	} // end methods


	var functions = {
		setProgress: function(element,value){
			var chart 	= $(element),
				wrapper = $(".cc-spc-wrapper",chart),
				track 	= $(".cc-spc-track",wrapper),
				bar 	= $(".cc-spc-bar",wrapper),
				text 	= $(".cc-spc-chart-percent span",wrapper);

			var duration 	= wrapper.data("duration"),
				valFrom		= wrapper.data("valuenow"),
				valTo		= value,
				pi 			= wrapper.data("pi"),
				percent 	= pi - (value * pi / 100);

			if (duration) {
				var barStyle 	= {
					"stroke-dashoffset": percent,
					"transition-duration": duration+"ms"
				}

				// Update Text - Animation
				$({countTo:valFrom}).animate({countTo:valTo},{
					duration: 	duration,
					easing: 	$.bez([0.25, 0.8, 0.25, 1]),
					step: function(){
						var step = Math.round(this.countTo);
						text.text(step);
					},
					complete: function(){

					}
				});
			} else {
				var barStyle 	= {
					"stroke-dashoffset": percent,
					"transition-duration": "0ms"
				}

				// Update Text
				text.text(valTo);
			}

			var styleTimeout = setTimeout(function(){
				bar.css(barStyle);
			},0);

			wrapper.attr("aria-valuenow",value);
			wrapper.data("valuenow",value);
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


	/*!
	 * Bez @VERSION
	 * http://github.com/rdallasgray/bez
	 * 
	 * A plugin to convert CSS3 cubic-bezier co-ordinates to jQuery-compatible easing functions
	 * 
	 * With thanks to Nikolay Nemshilov for clarification on the cubic-bezier maths
	 * See http://st-on-it.blogspot.com/2011/05/calculating-cubic-bezier-function.html
	 * 
	 * Copyright @YEAR Robert Dallas Gray. All rights reserved.
	 * Provided under the FreeBSD license: https://github.com/rdallasgray/bez/blob/master/LICENSE.txt
	*/
	jQuery.extend({bez:function(encodedFuncName,coOrdArray){if(jQuery.isArray(encodedFuncName)){coOrdArray=encodedFuncName;encodedFuncName="bez_"+coOrdArray.join("_").replace(/\./g,"p")}if(typeof jQuery.easing[encodedFuncName]!=="function"){var polyBez=function(p1,p2){var A=[null,null],B=[null,null],C=[null,null],bezCoOrd=function(t,ax){C[ax]=3*p1[ax],B[ax]=3*(p2[ax]-p1[ax])-C[ax],A[ax]=1-C[ax]-B[ax];return t*(C[ax]+t*(B[ax]+t*A[ax]))},xDeriv=function(t){return C[0]+t*(2*B[0]+3*A[0]*t)},xForT=function(t){var x=t,i=0,z;while(++i<14){z=bezCoOrd(x,0)-t;if(Math.abs(z)<.001)break;x-=z/xDeriv(x)}return x};return function(t){return bezCoOrd(xForT(t),1)}};jQuery.easing[encodedFuncName]=function(x,t,b,c,d){return c*polyBez([coOrdArray[0],coOrdArray[1]],[coOrdArray[2],coOrdArray[3]])(t/d)+b}}return encodedFuncName}});;

})(jQuery);