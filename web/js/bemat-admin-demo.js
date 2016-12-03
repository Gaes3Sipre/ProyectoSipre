/**
 * bemat-admin-demo.js v1.1.0
 * http://www.cerocreativo.cl
 *
 * Copyright 2016, Cerocreativo.cl
 * http://www.cerocreativo.cl
 */

var initstate = (function() {

	/**
	 * Theme Settings Panel
	 */
	$(function($){
		$(".theme-options-panel-toggle").on("click",function(){
			$(this).parents(".theme-options").toggleClass("open");
		});
		
		
		// Theme Options
		$("body").on("ifChecked","#themeOpt1",function(){
			bematadmin.App.theme.darkHeaderBrand();
		});
		$("body").on("ifUnchecked","#themeOpt1",function(){
			bematadmin.App.theme.lightHeaderBrand();
		});
		
		$("body").on("ifChecked","#themeOpt2",function(){
			bematadmin.App.theme.darkHeaderToolbar();
		});
		$("body").on("ifUnchecked","#themeOpt2",function(){
			bematadmin.App.theme.lightHeaderToolbar();
		});
		
		$("body").on("ifChecked","#themeOpt3",function(){
			bematadmin.App.theme.darkSidebar();
		});
		$("body").on("ifUnchecked","#themeOpt3",function(){
			bematadmin.App.theme.lightSidebar();
		});
		
		$("body").on("ifChecked","#themeOpt4",function(){
			bematadmin.App.theme.sidebarCollapsed();
		});
		$("body").on("ifUnchecked","#themeOpt4",function(){
			bematadmin.App.theme.sidebarNormal();
		});
		
		$("body").on("ifChecked","#themeOpt5",function(){
			bematadmin.App.theme.pageHeaderAlternative();
		});
		$("body").on("ifUnchecked","#themeOpt5",function(){
			bematadmin.App.theme.pageHeaderNormal();
		});
		
		$("body").on("ifChecked","#themeOpt6",function(){
			bematadmin.App.theme.footerFixed();
		});
		$("body").on("ifUnchecked","#themeOpt6",function(){
			bematadmin.App.theme.footerNormal();
		});
		
		$("body").on("ifChecked","#themeOpt7",function(){
			bematadmin.App.theme.layoutBoxed();
		});
		$("body").on("ifUnchecked","#themeOpt7",function(){
			bematadmin.App.theme.layoutNormal();
		});
		
		$("body").on("ifChecked","#themeOpt8",function(){
			bematadmin.App.system.materialPageTransition();
		});
		$("body").on("ifUnchecked","#themeOpt8",function(){
			bematadmin.App.system.normalPageTransition();
		});
		
		$("body").on("ifChecked","#themeOpt9",function(){
			bematadmin.App.system.sidebarSubmenuAccordion();
		});
		$("body").on("ifUnchecked","#themeOpt9",function(){
			bematadmin.App.system.sidebarSubmenuNormal();
		});
		
		
		// Theme Boxed Layout Background Image
		$("body").on("click","#patternSwitcher img",function(){
			var pattern = $(this).data("pattern"),
				style 	= {
					"background-image":"url(img/bgs/pattern/" + pattern +")",
					"background-repeat":"repeat"
				};
			$("html").css(style);
		});
		
		
		// Theme Style
		$("body").on("ifChecked","#themeStyle1",function(){
			var theme = $(this).data("theme");
			themeSwitcher(theme);
			
			$(".activeTheme").removeClass("activeTheme");
			$(this).addClass("activeTheme");
		});
		$("body").on("ifChecked","#themeStyle2",function(){
			var theme = $(this).data("theme");
			themeSwitcher(theme);
			
			$(".activeTheme").removeClass("activeTheme");
			$(this).addClass("activeTheme");
		});
		$("body").on("ifChecked","#themeStyle3",function(){
			var theme = $(this).data("theme");
			themeSwitcher(theme);
			
			$(".activeTheme").removeClass("activeTheme");
			$(this).addClass("activeTheme");
		});
		$("body").on("ifChecked","#themeStyle4",function(){
			var theme = $(this).data("theme");
			themeSwitcher(theme);
			
			$(".activeTheme").removeClass("activeTheme");
			$(this).addClass("activeTheme");
		});
		
		
		// Theme Style Sub Color
		$("body").on("click",".colorTheme",function(){
			var aTheme 	= $("input.activeTheme").data("theme"),
				sTheme 	= $(this).data("theme"),
				theme	= aTheme +"-"+sTheme;
			
			themeSwitcher(theme);
		});
		
		function themeSwitcher(theme){
			$("#theme-switcher").each(function () {
				var href = $(this).attr("href"),
					href = href.replace(/(css\/themes)(.*)(\/)/g,"css/themes/"+theme+"/");

				LazyLoad.css(href, function () {
					$.toasts("add",{
						msg: 		"Theme Activated: "+theme,
					});				
				});
			
			});
		}
		
		
		// Colored Background
		$("body").on("ifChecked","#themeStyle5",function(){
			$("#userbox").addClass("userbox-colored");
		});
		$("body").on("ifUnchecked","#themeStyle5",function(){
			$("#userbox").removeClass("userbox-colored");
		});
	});





	




})();