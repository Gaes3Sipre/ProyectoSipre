/**
 * jquery.subheader.js v1.0.0
 * http://www.cerocreativo.cl
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

	var pluginName  = "subheader",
		obj 		= "";

	var methods = {
		init: function (options) {
			var defaults = {
				height: 	"250px",
				class: 		null,
				templateSubheader:
					'<div class="subheader-inner">' +
					'<span class="subheader-content"></span>' +
					'</div>',
				templateApp:
					'<div class="subheader-app-list">'+
					'<div class="subheader-app-list-wrapper"></div>'+
					'</div>',
			}

			var settings = {}

			return this.each(function(){
				var element 	= this,
					$element 	= $(this);

				// Plugin Settings
				//--------------------------------------------------
				var metaData = {
					height: 		$element.data("height"),
					class: 	$element.data("class"),
				}
				settings = $.extend({}, defaults, options, metaData);

				// App List Structure
				//--------------------------------------------------
				var subheaders 	= $(".list-subheader",$element);
				$.each(subheaders,function(){
					var subheader 	= $(this).wrapInner(settings.templateSubheader);
				});

				$element.wrapInner(settings.templateApp);


				// App List Elements
				//--------------------------------------------------
				var appList = $(".subheader-app-list",$element),
					wrapper = $(".subheader-app-list-wrapper",appList);

				if (settings.class){
					appList.addClass(settings.class);
				} else {
					appList.css({"height":settings.height});
				}
				

				// Scroll Listener
				//--------------------------------------------------
				wrapper.on('scroll.sticky',function(e) {
					$("section",this).each(function(){
						var $this 			= $(this),
							top 			= $this.position().top,
							height 			= $this.outerHeight(true),
							subheader 		= $this.find(".list-subheader"),
							subheaderHeight	= subheader.outerHeight(true),
							subheaderSticky = subheader.data("mode");

						if (top < 0) {
							if (subheaderSticky == "sticky") {
								$this.addClass("sticky");
								$this.addClass("sticky").css('paddingTop', subheaderHeight);
								subheader.css({
									'top'  : (height + top < subheaderHeight) ? (subheaderHeight - (top + height)) * -1 : '',
									'width': $this.outerWidth(true)
								});
							}
						} else {
							$this.removeClass("sticky").css('paddingTop', '');
						}
					});
				});

				//Always return the "this" object for other plugins.
				return this;
			});
		},
	} // end methods

	var functions = {

	}// end functions

	$.fn[pluginName] = function(methodOrOptions){
		if (!$.data(this, 'plugin_' + pluginName)) {
			if ( methods[methodOrOptions] ) {
				return methods[ methodOrOptions ].apply( this, Array.prototype.slice.call( arguments, 1 ));
			} else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {
				$.data(this, 'plugin_'+pluginName,"loaded");
				// Default to "init"
				return methods.init.apply( this, arguments );
			} else {
				$.error( 'Method ' +  methodOrOptions + ' does not exist on '+pluginName );
			}
		} else {
			$.error( 'There are already another instance of the plugin '+pluginName+' running.');
		}
	};
})(jQuery);