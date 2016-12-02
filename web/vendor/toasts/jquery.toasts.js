/**
 * jquery.toasts.js v1.0.0
 * http://www.cerocreativo.cl
 *
 * Toasts messages inspired by Google's Material Design
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
	
	var pluginName	= "toasts",
		obj 		= "",
		queueList 	= 0,
		closeToast 	= false;

	var methods = {
		init: function (options) {
			var element = this;
			var defaults = {
				wrapperId: 		"cc",
				oneAtTime: 		true,
				appendType: 	"append",
				parent: 		"body",
				padding: 		"16px",
				class: 			null,
				position: 		"top right"

			};
			var settings = $.extend({}, defaults, options);

			// Get Toast Position
			var position = settings.position,
				posClass = "";

			if (position.includes("top")) {
				posClass += "toast-align-top ";
			} 
			if (position.includes("bottom")) {
				posClass += "toast-align-bottom ";
			}
			if (position.includes("left")) {
				posClass += "toast-align-left ";
			}
			if (position.includes("right")) {
				posClass += "toast-align-right ";
			}

			var n = "toasts-wrapper-"+settings.wrapperId,
				c = '<div id="'+n+'" class="toasts-container '+posClass+'"></div>',
				p = $(settings.parent);


			// Create DOM element
			$("body").data("toasts-wrapper",n);
			p.append(c);

			obj 			= $("#"+n,p).data("oneAtTime",settings.oneAtTime);
			queueList 		= 0;

			if (settings.class){
				obj.addClass(settings.class);
			} else {
				var style = {
					"padding":settings.padding
				};
				obj.css(style);
			}

			if (settings.oneAtTime) {
				obj.addClass('toasts-wrapper-one-at-time');
			}
			if (settings.appendType == 'prepend' && settings.oneAtTime == false) {
				obj.addClass('toasts-wrapper-prepend');
			}

			obj.on("click",".toast.open .btn",function(){
				var toast = $(this).closest(".toast");
				functions.closeToast(toast);
			});

			//Always return the "this" object for other plugins.
			//Not this time, cause we are calling the plugin without an element
			//return this;
		},
		add: function(options){ 
			var defaults = {
				msg: 			'',
				permanent: 		false,
				disappearTime: 	5000
			};

			var options = $.extend({}, defaults, options);

			var msg 		= options.msg,
				uniqid		= Date.now(),
				id 			= "toast-"+ uniqid;


			// New Snackbar
			var toastMsg 		= $('<span class="toast-message">'+msg+'</span>'),
				toastContent 	= $('<div class="toast-content"></div>').append(toastMsg),
				toastWrapper 	= $('<div class="toast"></div>').append(toastContent),
				newToast 		= $('<div id="'+id+'" class="toast-wrapper"></div>').append(toastWrapper);

			// Set Custom Properties on new Snackbar
			// -------------------------------------
			newToast.data("permanent",options.permanent).data("disappearTime",options.disappearTime).data("uniqid",uniqid);

			// Add Snackbar to Queue List
			// --------------------------
			functions.addToast(newToast);
		},
		position: function(position){
			if (position.split(/\s+/).length == 2){
				functions.setPosition(position);
			} else {
				console.log("Couldn't set position.");
			}
		}
	} // end methods


	var functions = {
		setPosition: function(position){
			var posClass = "";
			if (position.includes("top")) {
				posClass += "toast-align-top ";
			} 
			if (position.includes("bottom")) {
				posClass += "toast-align-bottom ";
			}
			if (position.includes("left")) {
				posClass += "toast-align-left ";
			}
			if (position.includes("right")) {
				posClass += "toast-align-right ";
			}
			functions.removePosition();
			obj.addClass(posClass);
		},
		removePosition: function(){
			obj.removeClass("toast-align-top toast-align-bottom toast-align-left toast-align-right");
		},
		addToQueue: function(toast){
			if (obj.data("oneAtTime")){
				if (queueList == 0) {
					queueList = queueList +1;
					functions.showToast(toast);
				} else {
					queueList = queueList +1;
				}
			} else {
				functions.showToast(toast);
			}
		},
		addToast: function(toast){
			// Add to the DOM
			if (obj.hasClass('toasts-wrapper-prepend')) {
				obj.prepend(toast);
			} else {
				obj.append(toast);
			}
			var height = toast.outerHeight();
			if (height >= 64){
				$(".toast-message",toast).addClass("toast-multiline");
			}

			functions.addToQueue(toast);
		},
		showToast: function(toast){
			if (obj.hasClass("toasts-wrapper-one-at-time")){

			}
			$.event.trigger({
				type: 		"show.cc.toast",
				message: 	"toast has been showed",
			});
			var showTime = setTimeout(function(){
				toast.addClass("open");
			},0);

			var permanent	 	= toast.data("permanent"),
				disappearTime	= toast.data("disappearTime");

			// Set close timer
			// ----------------
			if (!permanent) {
				closeToast = setTimeout(function(){
					functions.removeToast(toast);
				}, disappearTime);
			}
		},
		closeToast: function(toast){
			if (closeToast){
				clearTimeout(closeToast);
			}
			functions.removeToast(toast);
		},
		removeToast: function(toast){
			queueList = queueList - 1;
			toast.removeClass("open").one("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend", function () {
				toast.remove();
				if (queueList >= 1) {
					var nextToast = $(".toast-wrapper",obj).first();
					functions.showToast(nextToast);
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