/**
 * jquery.snackbar.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * Snackbar notifications inspired by Google's Material Design
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
	
	var pluginName	= "snackbar",
		obj 		= "",
		queueList 	= 0,
		closeSnack 	= false;

	var methods = {
		init: function (options) {
			var element = this;
			var defaults = {
				wrapperId: "cc",
				oneAtTime: true,
				appendType: 'append'
			};
			var options = $.extend({}, defaults, options);

			var n = "snackbar-wrapper-"+options.wrapperId,
				c = '<div id="'+n+'"></div>';
			$("body").append(c);

			obj 			= $("#"+n,"body");
			queueList 		= 0;

			if (options.oneAtTime) {
				obj.addClass('snackbar-wrapper-one-at-time');
			}
			if (options.appendType == 'prepend' && options.oneAtTime == false) {
				obj.addClass('snackbar-wrapper-prepend');
			}

			obj.on("click",".snackbar.open .btn",function(){
				var snackbar = $(this).closest(".snackbar");
				functions.closeSnackbar(snackbar);
			});

			//Always return the "this" object for other plugins.
			//Not this time, cause we are calling the plugin without an element
			//return this;
		},
		add: function(options){ 
			var defaults = {
				type: 			'',
				msg: 			'',
				buttonText: 	'Ok',
				permanent: 		false,
				disappearTime: 	5000
			};

			var options = $.extend({}, defaults, options);

			var type 		= options.type,
				btnStyle 	= "",
				msg 		= options.msg,
				btnText 	= options.buttonText,
				uniqid		= Date.now(),
				id 			= "snackbar-"+ uniqid;

			switch (options.type) {
				case 'primary':
					btnStyle = 'btn-primary';
					break;
				case 'success':
					btnStyle = 'btn-success';
					break;
				case 'info':
					btnStyle = 'btn-info';
					break;
				case 'warning':
					btnStyle = 'btn-warning';
					break;
				case 'danger':
					btnStyle = 'btn-danger';
					break;
				default:
					btnStyle = 'btn-default';
					break;
			}

			// New Snackbar
			var snackBtn 		= $('<button type="button" class="btn '+btnStyle+' btn-flat">'+btnText+'</button>'),
				snackMsg 		= $('<span class="snackbar-message">'+msg+'</span>'),
				snackContent 	= $('<div class="snackbar-content"></div>').append(snackMsg).append(snackBtn),
				newSnack 		= $('<div id="'+id+'" class="snackbar"></div>').append(snackContent);

			// Set Custom Properties on new Snackbar
			// -------------------------------------
			newSnack.data("permanent",options.permanent).data("disappearTime",options.disappearTime).data("uniqid",uniqid);

			// Add Snackbar to Queue List
			// --------------------------
			functions.addSnackbar(newSnack);
		}
	} // end methods


	var functions = {
		addSnackbar: function(snackbar){
			// Add to the DOM
			if (obj.hasClass('snackbar-wrapper-prepend')) {
				obj.prepend(snackbar);
			} else {
				obj.append(snackbar);
			}
			var height = snackbar.outerHeight();
			if (height >= 64){
				$(".snackbar-message",snackbar).addClass("snackbar-multiline");
			}

			if (queueList > 0) {
				queueList = queueList + 1;
			} else {
				queueList = queueList + 1;
				functions.showSnackbar(snackbar);
			}
		},
		showSnackbar: function(snackbar){
			$.event.trigger({
				type: 		"show.cc.snackbar",
				message: 	"snackbar has been showed",
			});
			var showTime = setTimeout(function(){
				snackbar.addClass("open");
			},0);

			var permanent	 	= snackbar.data("permanent"),
				disappearTime	= snackbar.data("disappearTime");

			// Set close timer
			// ----------------
			if (!permanent) {
				closeSnack = setTimeout(function(){
					functions.removeSnackbar(snackbar);
				}, disappearTime);
			}
		},
		closeSnackbar: function(snackbar){
			if (closeSnack){
				clearTimeout(closeSnack);
			}
			functions.removeSnackbar(snackbar);
		},
		removeSnackbar: function(snackbar){
			queueList = queueList - 1;
			snackbar.removeClass("open").one("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend", function () {
				snackbar.remove();
				if (queueList >= 1) {
					var nextSnack = $(".snackbar",obj).first();
					functions.showSnackbar(nextSnack);
				} else {

				}
			});
		}
	}// end functions



	$[pluginName] = function(methodOrOptions){
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