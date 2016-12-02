/**
 * bemat-admin-common.js v1.1.0
 * http://www.cerocreativo.cl
 *
 * Copyright 2015 - 2016, Cerocreativo.cl
 * http://www.cerocreativo.cl
 */


/**
 * TOC:
 * 1. Init functions
 * 2. Common functions & variables
 * 2.1. Global common variables
 * 2.2. Private functions
 * 2.3. Public functions
 * 3. Define namespace
 * 4. Helper functions
 */


;$(function(){
	"use strict";

	var App = function(){
		var dis = this;
		$(document).ready(function(){
			dis.init();
		})
	};
	var cc = App.prototype;

	// 1. Init
	// ----------------------------------------------------------------------------
	cc.init = function(){
		// Preload functions
		AppPreload.init();
		
		// AJAX Navigation
		AppAjaxNavigation.init();

		// Header
		AppHeader.init();

		// Sidebar
		AppSidebar.init();
		
		// Page OnLoad Functions
		AppOnLoad.init();
	}


	// 2. Common functions & variables
	// ----------------------------------------------------------------------------
	// 2.1. Global common variables
	var $body 			= $("body"),
		$document 		= $(document),
		$window 		= $(window);
		$.page 			= $("#page-wrapper");
		$.sidebar 		= $("#left-content");
		$.sidebarToggle = $("#sidebar-toggle");
		$.mainContent	= $("#right-content");
		$.appComponents = [];
		$.appFeatures 	= [];
		$.ajaxContainer = $("#right-content-wrapper .right-content-outter .right-content-inner");


	// 2.2. Private Functions
	// ----------------------------------------------------------------------------
	var AppFeatures = {
		init: function(){
			$.appFeatures = [
				{name:"idletimer",feature:"AppFeatures.idleTimer"},
				{name:"hierarchicaldisplay",feature:"AppFeatures.hierachicalDisplay"},
				{name:"prettyPrint",feature:"AppFeatures.prettyPrint"},
				{name:"materialSelect",feature:"AppFeatures.materialSelect"},
			]
		},
		breakpoints: function(){
			var bp = 
				'<div id="ScreenSize" class="device-breakpoints">'+
					'<div class="visible-xs" data-breakpoint="xs">XS</div>'+
					'<div class="visible-sm" data-breakpoint="sm">SM</div>'+
					'<div class="visible-md" data-breakpoint="md">MD</div>'+
					'<div class="visible-lg" data-breakpoint="lg">LG</div>'+
				'</div>';
			$body.prepend(bp);
		},
		windowResize: function(){
			// Responsive Width Check using Modernizr Media Queries
			$window.on("load resize", function(){
				var sidebarClass 	= "",
					sizeIndex 		= 0;

				if(Modernizr.mq('(min-width: 1200px)')){
					sidebarClass 	= "LG";
					sizeIndex 		= 5;
				} else if(Modernizr.mq('(min-width: 992px)')){
					sidebarClass 	= "MD";
					sizeIndex 		= 4;
				} else if(Modernizr.mq('(min-width: 768px)')){
					sidebarClass 	= "SM";
					sizeIndex 		= 3;
				} else if(Modernizr.mq('(min-width: 480px)')){
					sidebarClass 	= "XS";
					sizeIndex 		= 2;
				} else if(Modernizr.mq('(max-width: 480px)')){
					sidebarClass 	= "XXS";
					sizeIndex 		= 1;
				}
				$body.removeClass("bematScreenLG bematScreenMD bematScreenSM bematScreenXS bematScreenXXS").addClass("bematScreen"+sidebarClass);

				$.event.trigger({
					type: 	"bemat-screen-resize",
					size: 	sidebarClass,
					index: 	sizeIndex
				});
			});
		},
		idleTimer: function(){			
			if ($.idle) {
				$document.idleTimer( {
					timeout: $.idleTimeout, 
					idle: true
				});
				
				$document.on("idle.idleTimer", function(event, elem, obj){
					$.event.trigger({
						type: 	"idleOn"
					});
				});

				$document.on("active.idleTimer", function(event, elem, obj, triggerevent){
					$.event.trigger({
						type: 	"idleOff"
					});
				});
			}
		},
		hierachicalDisplay: function(){
			$('[data-animation="hierarchical-display"]').hierarchicalDisplay();
		},
		prettyPrint: function(){
			$("pre").addClass("prettyprint linenums");
			prettyPrint();
		},
		clipboard: function(){

		},
		materialSelect: function(){
			$("select").selectpicker({
				dropupAuto: false,
				size: 5
			});
		},
		appBackground: function(){
			if ($.appBackgroundImage) {
				var style = {
					"background-image":"url(img/bgs/pattern/" + $.appBackgroundImage +")",
					"background-repeat":"repeat"
				};
				$("html").css(style);
			}
		}
	};
	
	
	var AppPreload = {
		init: function(){
			AppAjaxNavigation.showPreloader();
			
			// Load all system required JS Scripts
			AppPreload.loadScripts();
		},
		loadScripts: function(){
			var appComponentsActive = [], appComponentsJS = [], appComponentsCSS = [];
			$LAB
			.script(
				"js/bemat-config.js",
				"js/bemat-circularLoader.js",
				"js/bemat-components.js"
			)
			.wait(function(){
				if (typeOf($.bematAppComponents) == "array") {					
					$.each($.bematAppComponents, function( key, value ) {
						if ((typeOf(value.register) == "undefined" ) || (value.register != false)) {
							var name 		= value.name,
								component 	= value.component,
								js 			= value.js,
								css 		= value.css;

							appComponentsActive.push({name:name,component:component});
							
							if ((typeOf(js) != "undefined") && (js.length > 0)) {
								appComponentsJS.push(js);
							}
							if ((typeOf(css) != "undefined") && (css.length > 0)) {
								appComponentsCSS.push(css);
							}
						}
					});
					
					$.appComponents = appComponentsActive;
					
					appComponentsJS = $.map(appComponentsJS, function(i){
						return i;
					});
					
					appComponentsCSS = $.map(appComponentsCSS, function(i){
						return i;
					});
				}
			})
			.wait()
			.script(
				// System Required Third Party Scripts
				"vendor/lazyload/lazyload.js",
				"vendor/i18next/i18next.min.js",
				"vendor/i18next/i18nextXHRBackend.min.js",
				"vendor/i18next/i18next-jquery.min.js",
				"vendor/idle-timer/idle-timer.1.0.1.min.js",
				"vendor/perfectscrollbar/perfect-scrollbar.jquery.min.js",
				"vendor/tinycon/tinycon.min.js",
				"vendor/hierarchicaldisplay/jquery.zmd.hierarchical-display.min.js"
			)
			.wait(function(){
				// System Required Third Party CSS Style Sheets
				var cssFiles = [
					"vendor/flag-icon-css/flag-icon.min.css",
					"vendor/animations/animate.css",
					"vendor/hierarchicaldisplay/zmd.hierarchical-display.min.css"
				];
				AppLoadScript.loadCSS(cssFiles);
			})
			.wait(function(){
				/** 
				 * DEMO MODE
				 * This portion of code can be deleted on a production environment
				 * From the ".wait(function())" to the next close bracket.
				 */
				
				if ($.demoMode) {
					console.log("[DEMO MODE] Loading demo settings");
					$LAB.script("js/bemat-admin-demo.js");
				}
				
				
			})
			.wait(function(){
				// Optional Component Scripts and Style Sheets
				$LAB
				.script(appComponentsJS)
				.wait(function(){
					AppLoadScript.loadCSS(appComponentsCSS);
				})
				.wait(function(){
					// When all actions are done, load the system components
					AppPreload.done();
				});
			});
		},
		done: function(){
			/* All scripts has been loaded */
			
			// Load System Components
			AppComponents.init();
			
			// Load System Features
			AppFeatures.init();
			
			// Run IdleTimer
			AppFeatures.idleTimer();
			
			// Set App Background
			AppFeatures.appBackground();
			
			
			$.event.trigger({
				type: 		"scriptload",
				message: 	"The system scripts has been fully loaded",
			});
		}
	};
	
	var AppLanguage = {
		init: function(){
			if ($.appMultiLanguage) {
				i18next.use(window.i18nextXHRBackend).init({
					load: 'unspecific',
					fallbackLng: $.appDefaultLanguage,
					lng: $.appDefaultLanguage,
					useDataAttrOptions: true,
					debug: false,
					backend: {
						loadPath: 'locales/{{lng}}.json',
						addPath: 'locales/add/{{lng}}/{{ns}}',
						allowMultiLoading: false
					},
				}, function(err, t) {
					// for options see
					// https://github.com/i18next/jquery-i18next#initialize-the-plugin
					i18nextJquery.init(i18next, $,{
						useOptionsAttr: true
					});
					
					AppLanguage.doLocale();
				});
			
			
				// Listen for language change
				$("#language-selector-list").on("click","a",function(e){
					var obj	= $(this),
						lng = obj.data("language");
					
					//i18next.changeLanguage(lng, (err, t) => {
					i18next.changeLanguage(lng, function(err, t){
						obj.parents("ul").find("li").removeClass("active");
						obj.parent("li").addClass("active");
						
						AppLanguage.doLocale();
						
					});
				});			
			}
		},
		doLocale: function(){
			if ($.appMultiLanguage) {
				if ( $.isFunction($.fn.localize) ) {
					$body.localize();
				} else {
					if ($.debug) {
						console.log("[AppLanguage] .localize() Error.");
					}
				}
			}
		}
		
	};
	
	var AppAjaxNavigation = {
		init: function(){
			$.ajaxNav 				= false;
			$.ajaxNavCircularLoader = $("#circular-loader");
			$.preloaderActive;
			
			// HTML5Mode
			if ((Modernizr.history) && ($.ajaxNavHtml5Mode)) {				
				$window.on("popstate", function(event){
					AppAjaxNavigation.checkURL();
				});
			} else {				
				// Listen for url hashchange
				$window.on("hashchange",function(e){
					if ($.ajaxNav) {
						AppAjaxNavigation.checkURL();
						$.ajaxNav = false;
					} else {
						if ($.debug){
							console.log("[AjaxNAV] Ajax nav blocked");
						}
					}
				});
			}
			$document.on("click",'#sidebar a[target="_blank"]', function(e) {
				e.preventDefault();
				var uri = $(e.currentTarget);
				window.open(uri.attr("href"))
				return false;
			}),
			$document.on("click",'#sidebar a[target="_top"]', function(e) {
				e.preventDefault();
				var uri = $(e.currentTarget);
				window.location = uri.attr("href")
				console.log("SALIENDO");
				return false;
			}),
			$document.on("click",'#sidebar a[href="#"]',function(e){
				e.preventDefault();
				return false;
			}),
			$document.on("click",'#sidebar a[href!="#"]',function(e){
				$.ajaxNav = true;
				e.preventDefault();
				var t = $(e.currentTarget),
					h = window.location.hash,
					s = window.location.search,
					r = window.location.href,
					n1 = r.replace(s, "").replace(h, "") + "#" + t.attr("href"),
					n2 = t.attr("href");
					
					
				if (t.attr("target")) {
					window.setTimeout(function(){
						if ((Modernizr.history) && ($.ajaxNavHtml5Mode)) {
							history.pushState(null,null, n2);
							AppAjaxNavigation.checkURL();
						} else {
							var nU = (s) ? window.location.href = n1 : window.location.hash = n2;
						}
					},150);
				} else {
					if ((Modernizr.history) && ($.ajaxNavHtml5Mode)) {
						history.pushState(null,null, n2);
						AppAjaxNavigation.checkURL();
					} else {
						var nU = (s) ? window.location.href = n1 : window.location.hash = n2;
					}
				}
			});			
		},
		materialPageTransition: function(state){
			if (typeOf($.ajaxNavMaterialTransition) == "boolean") {
				if (state == 1) {
					$.ajaxNavMaterialTransition = true;
				} else if (state == 0) {
					$.ajaxNavMaterialTransition = false;
				}
			}
		},
		locationProvider: function(){
			
		
		},
		checkURL: function() {
			if ((Modernizr.history) && ($.ajaxNavHtml5Mode)) {
				var base 		= $("base");
				var baseURI 	= base.context.baseURI,
					fullURI	 	= $(location).attr("href"),
					a 			= fullURI.replace(baseURI,"");
			} else {
				var a = location.href.split("#").splice(1).join("#");
				if (!a) try {
					var b = window.document.URL;
					b && b.indexOf("#", 0) > 0 && b.indexOf("#", 0) < b.length + 1 && (a = b.substring(b.indexOf("#", 0) + 1))
				} catch (c) {}
			}
			
			if ((!a) && ($.defaultHomePage)) {
				a = $.defaultHomePage;
			}
			//var container = $.ajaxContainer;
			var container = $(".right-content-inner");
			if (container, a) {
				// Set .active page state
				$("#sidebar li.active").removeClass("active"), $('#sidebar li:has(a[href="' + a + '"])').addClass("active");
				
				// Set page title
				var d = $('#sidebar a[href="' + a + '"]').attr("title");
				document.title = d || document.title;
				
				// Loading the New URL
				// ---------------------------------------
				
				// Show Preloader
				AppAjaxNavigation.showPreloader();
				
				// Load URL
				AppAjaxNavigation.loadURL(a + location.search, container);
				
				
			} else {
				// If no active Pathname
				// Sets automatically the first view to the "href" path of the first sidebar item
				
				var a = $('#sidebar > ul > li:first-child > a[href!="#"]'),
					a = a.attr("href");

				if ((Modernizr.history) && ($.ajaxNavHtml5Mode)) {
					history.pushState(null,null, a);
					AppAjaxNavigation.checkURL();
					a = null;
				} else {
					$.ajaxNav = 1;
					window.location.hash = a, a = null;
				}
			}
		},
		loadURL: function(url,container){
			// Carga cualquier contenido de la url "url" en cualquier contenedor "container" mediante AJAX
			if ($.debug){
				console.log("[AjaxNAV] Loading url: "+url);
			}
			$.ajax({
				"type":		"GET",
				"url":		url,
				"dataType":	"html",
				"cache": 	!0,
				"beforeSend": function(){
					container.animate({
						"opacity":"1"
					},$.ajaxNavFadeDuration,function(){
						/**
						 * Destroy Plugins
						 */
						
						// Destroy all components instances of the page
						if (typeof pageDestroy == "function") try {					
							pageLoadScripts 		= void 0;
							pageRequiredComponents 	= void 0;
							doneScriptsLoad 		= void 0;
							pageRequiredFeatures	= void 0;
							
							pageDestroy(), $.debug && console.log("[AjaxNAV] pageDestroy()");
						} catch (e) {
							pageDestroy = void 0, $.debug && console.error("[AjaxNAV] pageDestroy() Catch Error");
						}
					});

					// Set Breadcrumb
				},
				"success": function(data){
					if (!$.ajaxNavMaterialTransition) {
						/**
						 * Page Normal Transition
						 */
						 
						container.animate({
							"opacity":"0"
						},$.ajaxNavFadeDuration,function(){
						
							// Insert the new page data
							container.html(data);
							
							// Set Scrollbar Top
							$("#right-content-wrapper").scrollTop(0);
							
							
							/**
							 * Load Required Vendor Scripts and Stylesheets
							 * 
							 * Use: "pageLoadScripts" and "pageLoadCSS" variables
							 */
							AppAjaxNavigation.pageLoadedActions(pageLoadScripts,pageLoadCSS,pageRequiredComponents,pageRequiredFeatures);
							
							
							
							// Translate Active Page
							AppLanguage.doLocale();
							
							
							// Show the new page
							container.animate({
								"opacity":"1"
							},$.ajaxNavFadeDuration, function(){
								// Trigger "Load" Signal
								$.event.trigger({
									type: 		"pageload",
									message: 	"The page has been fully loaded",
								});
								
								if ($.debug){
									console.log("[AjaxNAV] Page loaded");
								}
								var navigation = setTimeout(function(){
									// Hide Preloader
									AppAjaxNavigation.hidePreloader();
								},0);
							});
							
							// Unset Variables
							url 		= null;
							container 	= null;
						});	
					} else {
						
						
						var pageOutAnimation = setTimeout(function(){
							// Translate Out Animation
							container.wrapInner('<div class="materialTransitionTranslateOut"></div>');
							var pageOutAnimation = setTimeout(function(){
								$(".materialTransitionTranslateOut").addClass("out");
							},0);

							
								// Insert the new page data
								//container.html(data);
								var newContainer = '<div class="newContainer mptIn"></div>',
									newContainer = $(newContainer);
								
								$("#right-content-wrapper .right-content-outter").prepend(newContainer);
								newContainer.html(data);
								
								
								
								// Set Scrollbar Top
								//$("#right-content-wrapper").scrollTop(0);
								
								
								/**
								 * Load Required Vendor Scripts and Stylesheets
								 * 
								 * Use: "pageLoadScripts" and "pageLoadCSS" variables
								 */
								AppAjaxNavigation.pageLoadedActions(pageLoadScripts,pageLoadCSS,pageRequiredComponents,pageRequiredFeatures);
								
								
								
								// Translate Active Page
								AppLanguage.doLocale();
							
							
							
							var pageInAnimation = setTimeout(function(){								
								$(".newContainer").addClass("in");

								$(".newContainer").onCSSTransitionEnd(function(){
									$(".newContainer").removeClass("newContainer mptIn in").addClass("right-content-inner");
									
									// Trigger "Load" Signal
									$.event.trigger({
										type: 		"pageload",
										message: 	"The page has been fully loaded",
									});
									
									if ($.debug){
										console.log("[AjaxNAV] Page loaded");
									}
									
									AppAjaxNavigation.hidePreloader();
								});
							},600);
							
							
							
							
							
							
							
							
							container.addClass("mptOut").onCSSAnimationEnd(function(){
								$( this ).removeClass("mptOut");
								$( this ).remove();
								
								
								
								// var pageInAnimation = setTimeout(function(){
									// $(".newContainer").addClass("in").onCSSTransitionEnd(function(){
										// $(".newContainer").removeClass("newContainer mptIn in").addClass("right-content-inner");
										
										//Trigger "Load" Signal
										// $.event.trigger({
											// type: 		"pageload",
											// message: 	"The page has been fully loaded",
										// });
										
										// if ($.debug){
											// console.log("[AjaxNAV] Page loaded");
										// }
										
										// AppAjaxNavigation.hidePreloader();
									// });
								// },0);
								
								// Unset Variables
								url 		= null;
								container 	= null;
								
							});
						},0);
					}
				},
				"error": function(){
					if ($.debug){
						console.log("[AjaxNAV] Error loading the page");
					}
					
					// Hide Preloader
					AppAjaxNavigation.hidePreloader();
				}
			});
		},
		pageLoadedActions: function(scripts,css,components,features){
			if ($.debug) { console.log("[pageLoadedActions] Init"); }
			
			$LAB.setOptions({AlwaysPreserveOrder:true,UseLocalXHR:false})
			.wait(function(){
				if ((typeOf(pageLoadScripts) == "array") && (pageLoadScripts.length > 0)) try {
					AppLoadScript.loadJS(pageLoadScripts), $.debug && console.log("[pageLoadedActions] Loading: pageLoadScript");
				} catch (e) {
					pageLoadScripts = void 0, $.debug && console.error("[pageLoadedActions] Error Executing: AppLoadScript.loadJS()");
				}
			})
			.wait(function(){
				if ((typeOf(pageLoadCSS) == "array") && (pageLoadCSS.length > 0)) try {
					AppLoadScript.loadCSS(pageLoadCSS), $.debug && console.log("[pageLoadedActions] Loading: pageLoadCSS");
				} catch (e) {
					pageLoadCSS = void 0, $.debug && console.error("[pageLoadedActions] Error Executing: AppLoadScript.loadCSS()");
				}
			})
			.wait(function(){
				if ((typeOf(pageRequiredComponents) == "array") && (pageRequiredComponents.length > 0)) try {
					AppComponents.reload(pageRequiredComponents), $.debug && console.log("[pageLoadedActions] Loading: pageRequiredComponents: "+pageRequiredComponents);
				} catch (e) {
					pageRequiredComponents = void 0, $.debug && console.error("[pageLoadedActions] Error Executing: AppComponents.reload()");
				}
			})
			.wait(function(){
				if ((typeOf(pageRequiredFeatures) == "array") && (pageRequiredFeatures.length > 0)) try {
					AppLoadScript.loadFeature(pageRequiredFeatures), $.debug && console.log("[pageLoadedActions] Loading: pageRequiredFeatures");
				} catch (e) {
					pageRequiredFeatures = void 0, $.debug && console.error("[pageLoadedActions] Error Executing: AppLoadScript.loadFeature()");
				}
			})
			.wait(function(){
				if (typeOf(doneScriptsLoad)) try {
					doneScriptsLoad(), $.debug && console.log("[pageLoadedActions] Executing: doneScriptsLoad()");
				} catch (e) {
					doneScriptsLoad = void 0, $.debug && console.error("[pageLoadedActions] Error Executing: doneScriptsLoad()");
				}
			})
			.wait(function(){
				pageLoadScripts 		= void 0;
				pageLoadCSS 			= void 0;
				pageRequiredComponents 	= void 0;
				pageRequiredFeatures 	= void 0;
				doneScriptsLoad 		= void 0;

				if ($.debug) { console.log("[pageLoadedActions] Finished"); }
			});
		},
		setBreadCrumb: function(){
			console.log("Seting breadcrumb.");
		},
		showPreloader: function(){
			if ((typeOf($.preloaderActive) == "undefined") || (!$.preloaderActive)) {
				$.preloaderActive = true;
				
				var templateLineal 		= 	'<div id="ajax-preloader">'+
											'<div id="ajax-preloader-progressbar" aria-busy="true" aria-label="Loading" role="progressbar"></div>'+
											'</div>';
				var templateCircular	=	'<div id="circular-loader" md-mode="indeterminate" aria-valuemin="0" aria-valuemax="100" role="progressbar">'+
											'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" style="width: 50px; height: 50px;">'+
											'<path fill="none" transform="" d="" style="stroke-width: 5px;"></path>'+
											'</svg>'+
											'</div>';
				$.ajaxNavCircularLoader	= $(templateCircular);
				

				
				// Circular Preloader
				var showCP = function(){
					//$.ajaxContainer.parent().prepend($.ajaxNavCircularLoader);
					$("#right-content-wrapper .right-content-outter").prepend($.ajaxNavCircularLoader);
					
					var circularPreloaderShow = setTimeout(function(){
						$.ajaxNavCircularLoader.addAnimatedClass("in");
					},0);
				}
				
				if (typeof progressLink == 'function') {
					progressLink($.ajaxNavCircularLoader);
					showCP();
				} else {
					$document.on("scriptload",function(){
						progressLink($.ajaxNavCircularLoader);
						showCP();
					});
				}
				
				// Linear Preloader
				if (!$("#ajax-preloader",$body).exists()) {
					$body.prepend(templateLineal);
					var linearPreloaderShow = setTimeout(function(){
						$("#ajax-preloader").addAnimatedClass("progressIn");
					},0);
				}
				
				// Update System State
				$body.addClass("ajax-loading").attr("aria-busy","true");

			}

			
		},
		hidePreloader: function(){
			if ($.preloaderActive) {
				$.preloaderActive = false;				
				
				// Circular Preloader
				var circularPreloaderHide = setTimeout(function(){
					$.ajaxNavCircularLoader.addAnimatedClass("out",function(){
						progressLink.destroy();
						$.ajaxNavCircularLoader.remove();
					});
				},0);
				
				
				// Linear Preloader
				var linearLoader = $("#ajax-preloader");
				
				var linearPreloaderHide = setTimeout(function(){
					linearLoader.removeAnimatedClass("progressIn",function(){
						linearLoader.remove();
					});
				},0);


				// Update Document State
				$body.removeClass("ajax-loading").attr("aria-busy","false");			
			}

		},
		hideSplashScreen: function(){
			$("#splash-screen").fadeOut(800,function(){
				$body.addClass("system-loaded");
				$.event.trigger({
					type: 		"systemload",
					message: 	"The system has been fully loaded",
				});
				$(this).remove();
				
				AppAjaxNavigation.hidePreloader();
				
				if ($.debug) { console.log("[App] System Fully Loaded"); }
			});
		}
	};

	var AppHeader = {
		init: function(){
			AppFullScreen.init();
		}
	};
	
	var AppFullScreen = {
		init: function(){
			var fullScreenState = 0;
			var fullScreenBtn = $("#fullscreen-toggle");
			var fullscreenEnabled = document.fullscreenEnabled || document.mozFullScreenEnabled || document.webkitFullscreenEnabled;

			fullScreenBtn.on("click",function(){
				if (fullscreenEnabled) {
					if ($.debug) {
						AppFullScreen.toggle();
					}
				} else {
					if ($.debug) {
						console.log("[FullScreen] Fullscreen Mode Disabled");
					}
				}
			});
			
			$document.on("webkitfullscreenchange mozfullscreenchange fullscreenchange MSFullscreenChange", function() {
				var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;

				if (fullscreenElement) {
					fullScreenState = 1;
					fullScreenBtn.html('<i class="material-icons">fullscreen_exit</i>');
				} else {
					fullScreenState = 0;
					fullScreenBtn.html('<i class="material-icons">fullscreen</i>');
				}
			});
		},
		toggle: function(){
			if (!document.fullscreenElement &&    // alternative standard method
			!document.mozFullScreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement ) {  // current working methods
				if (document.documentElement.requestFullscreen) {
					document.documentElement.requestFullscreen();
				} else if (document.documentElement.msRequestFullscreen) {
					document.documentElement.msRequestFullscreen();
				} else if (document.documentElement.mozRequestFullScreen) {
					document.documentElement.mozRequestFullScreen();
				} else if (document.documentElement.webkitRequestFullscreen) {
					document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
				}
			} else {
				if (document.exitFullscreen) {
					document.exitFullscreen();
				} else if (document.msExitFullscreen) {
					document.msExitFullscreen();
				} else if (document.mozCancelFullScreen) {
					document.mozCancelFullScreen();
				} else if (document.webkitExitFullscreen) {
					document.webkitExitFullscreen();
				}
			}
		},
		state: function(){
			return fullScreenState;
		}
	};

	var AppSidebar = {
		init: function(){
			$.sidebarToggle.on("click",function(){
				AppSidebar.toggle();
			});
			
			AppSidebar.open();
			AppSidebar.userbox();
			AppSidebar.backdrop();

			var sideMenu	= $("#sidebar"),
				parent		= sideMenu.find("li").has("ul").children("ul");
			
			// Set Submenu Style
			sideMenu.find("li").has("ul").children("a").append("<span class='menu-item-submenu-arrow'><i class='fa fa-angle-right'></i></span>");
			$("li:last-child",parent).addClass("lastChild").has("ul").addClass("hasMenu");	
			sideMenu.find('li').not('.open').has('ul').children('ul').wrapInner("<div class='submenu-inner-wrapper'>");
			
			// Bind Click Event
			sideMenu.find('li').has('ul').children('a').on('click', function(e){
				e.preventDefault();
				AppSidebar.submenuToggle($(this));
			});

		},
		open: function(){
			$.sidebarToggle.data("state","open").removeClass("SidebarClose").addClass("SidebarOpen")

			/* Open Event */
			$body.removeClass("sidebar-close").addClass("sidebar-open");
			$.sidebar.data("state","open").addClass("SidebarOpen").removeClass("SidebarClose");
			$.mainContent.addClass("SidebarOpen").removeClass("SidebarClose");
		},
		close: function(){
			$.sidebarToggle.data("state","close").removeClass("SidebarOpen").addClass("SidebarClose");

			/* Close Event */
			$body.removeClass("sidebar-open").addClass("sidebar-close");
			$.sidebar.data("state","closed").removeClass("SidebarOpen").addClass("SidebarClose");
			$.mainContent.removeClass("SidebarOpen").addClass("SidebarClose");
		},
		toggle: function(){
			var st = $.sidebar.data("state");
			if (st == "closed") {
				AppSidebar.open();
			} else  if (st == "open") {
				AppSidebar.close();
			}
		},
		update: function(){
		
		},
		autoCollapse: function(state){
			if (typeOf($.sidebarMenuAutoCollapse) == "boolean") {
				if (state == 1) {
					$.sidebarMenuAutoCollapse = true;
				} else if (state == 0) {
					$.sidebarMenuAutoCollapse = false;
				}
			}
		},
		submenuToggle: function(element){		
			var parentLi 			= $(element).parent("li"),
				parentParent		= parentLi.offsetParent("ul");

			var getSubmenu = function(element,type){
				var obj;
				if ($(element).children(".submenu-inner-wrapper").exists()) {
					obj = element.children(".submenu-inner-wrapper").children("li").has("ul");
				} else {
					obj = element.children("li").has("ul");
				}
				
				if (type == "index") {
					return obj.length;
				} else if (type == "obj"){
					return obj;
				}
			}

			if (($.sidebarMenuAutoCollapse) && (getSubmenu(parentParent,"index") > 1)) {
				var parentMenusX = getSubmenu(parentParent,"obj");
				$.each(parentMenusX,function(){
					var ele = $(this).children("a");
					if ($(this) == element) {
						console.log("el mismo");
					}
					if ($(this).data("state") == "open") {
						AppSidebar.submenu("close",ele);
					}
				});
			}
			AppSidebar.submenu("toggle",element);

		},
		submenu: function(event,element){
			var item 			= element.parent("li"),
				itemSubmenu 	= item.children("ul"),
				innerWrapper	= itemSubmenu.children(".submenu-inner-wrapper"),
				innerHeight		= innerWrapper.outerHeight(true);

			// Get Submenu Height
			if (innerHeight == 0){
				var clone	= innerWrapper.clone(),
					style	= {
						"display":"block",
						"border":"1px solid red",
						"position":"absolute",
						"top":"0px",
						"left":"0px",
					},
					innerHeight	= clone.css(style).insertAfter(item.children("ul")).outerHeight(true);

				clone.remove();
			}

			// Display Submenu
			itemSubmenu.css({"display":"block"});
			
			var innerHeight		= innerHeight,
				itemState		= item.data("state"),
				slideUpFx		= {
					"margin-top":"-"+innerHeight+"px"
				};
			
			
			/**
			 * Open/Close Function Animations FX
			 */
			var updateSubmenuState = function(item,state){
				var c = state;
				if (item.hasClass("lastChild")) { c += " lastChild"; }
				if (item.hasClass("hasMenu")) { c += " hasMenu"; }
				item.removeClass().addClass(c).data("state",state);
			}
			var submenuOpen = function(){
				// Open Submenu Effect
				var slideDownFx	= {
					"margin-top":"0px"
				};
				updateSubmenuState(item,"opening");
				innerWrapper.css(slideUpFx);
				var stylizeIt = setTimeout(function(){
					innerWrapper.css(slideDownFx).onCSSTransitionEnd(function(){
						if (item.data("state") == "opening") {
							updateSubmenuState(item,"open");
						}
					});
				},10);
			}
			var submenuClose = function(){
				// Close Submenu Effect
				updateSubmenuState(item,"closing");
				
				var stylizeIt = setTimeout(function(){
					innerWrapper.css(slideUpFx).onCSSTransitionEnd(function(){
						if (item.data("state") == "closing") {
							updateSubmenuState(item,"closed");
							item.children("ul").css({"display":"none"});
						}
					});
				},10);
			}
				
			/**
			 * Open/Close/Toggle Events
			 */
			if (event == "toggle"){
				if (itemState == "open") {
					submenuClose();
				} else if ((typeOf(itemState) === "undefined") || (itemState == "closed")) {
					submenuOpen();
				}
			} else if (event == "open") {
				submenuOpen();
			} else if (event == "close") {
				submenuClose();
			}
		},
		userbox: function(){
			var overlay = '<div class="userbox-bg-overlay"></div>';
			$("#userbox",$.sidebar).append(overlay);
		},
		backdrop: function(){
			$window.on("bemat-screen-resize",function(e){
				if (e.index <= 2){
					var backdrop = $("#sidebar-backdrop");
					if (backdrop.length) {
						$body.addClass("backdrop-active");
					} else {
						$('<div id="sidebar-backdrop"></div>').insertBefore("#page-wrapper");
					}
				} else {
					var backdrop = $("#sidebar-backdrop");
					if (backdrop.length) {
						backdrop.fadeOut();

						$body.removeClass("backdrop-active");
					}
				}
			})

			$body.on("click","#sidebar-backdrop",function(){
				$body.removeClass("sidebar-open").addClass("sidebar-close");
				AppSidebar.close();
			});
		}
	};
	
	
	var AppLoadScript = {
		loadJS: function(scripts){
			$LAB
			.setOptions({AlwaysPreserveOrder:true,UseLocalXHR:false})
			.script(scripts)
			.wait(function(){
				if ($.debug){
					console.log("[AppLoadScript] loadJS: Scripts loaded");
				}
			});
		},
		loadCSS: function(urls, callback, nocache){
		
			if (typeof nocache=='undefined') nocache=false; // default don't refresh
			$.when.apply($,
				$.map(urls, function(url){
					if (nocache) url += '?_ts=' + new Date().getTime(); // refresh? 
					return $.get(url, function(){                    
						$('<link>', {rel:'stylesheet', type:'text/css', 'href':url}).appendTo('head');                    
					});
				})
			).then(function(){
				if (typeof callback=='function') callback();
				if ($.debug){
					console.log("[AppLoadScript] loadCSS: Styles sheets loaded");
				}
			});
		},
		loadFeature: function(features){
			var i = 0;
			var c = [];
			for (i = 0; i < features.length; i++) {		
				$.appFeatures.some(function (obj) {
					if (obj.name === features[i]) {
						if ($.debug) {
							console.log("[AppLoadFeature] Re-loading Feature: "+obj.name);
						}
						var cf = obj.feature +"()";
						eval(cf);
					}
				});
			}
			
			
		}
	};
	
	var AppOnLoad = {
		init: function(){
			$window.load(function(){
				// Handle Window Resize
				AppFeatures.windowResize();
				
				// Navigate to Default Page
				var navigate = setTimeout(function(){
					AppAjaxNavigation.checkURL();
					
					// Hide Splash Screen
					var navigation = setTimeout(function(){
						AppAjaxNavigation.hideSplashScreen();
					},500);
				},2000);
				
				// Translations
				AppLanguage.init();
				
			});
		}
	};

	var AppTheme = {
		init: function(){

		},
		switchTheme: function(){
		
		},
		darkHeader: function(){
			$body.addClass("dark-header");
		},
		darkHeaderBrand: function(){
			$body.addClass("dark-header-brand");
		},
		darkHeaderToolbar: function(){
			$body.addClass("dark-header-toolbar");
		},
		darkSidebar: function(){
			$body.addClass("dark-sidebar");
		},
		lightHeader: function(){
			$body.removeClass("dark-header dark-header-brand dark-header-toolbar");
		},
		lightHeaderBrand: function(){
			$body.removeClass("dark-header-brand");
		},
		lightHeaderToolbar: function(){
			$body.removeClass("dark-header-toolbar");
		},
		lightSidebar: function(){
			$body.removeClass("dark-sidebar");
		},
		collapsedSidebar: function(){
			$body.addClass("sidebar-collapsed");
		},
		normalSidebar: function(){
			$body.removeClass("sidebar-collapsed");
		},
		headerNormal: function(){
			if ($(".page-header").exists()) {
				$(".page-header").removeClass("alternative-header");
			}
		},		
		headerAlternative: function(){
			if ($(".page-header").exists()) {
				$(".page-header").addClass("alternative-header");
			}
		},
		footerNormal: function(){
			if ($body.hasClass("fixed-footer")){
				$body.removeClass("fixed-footer");
			}
		},
		footerFixed: function(){
			$body.addClass("fixed-footer");
		},
		layoutNormal: function(){
			if ($body.hasClass("container")){
				$body.removeClass("container").addClass("container-fluid");
			}
		},
		layoutBoxed: function(){
			if ($body.hasClass("container-fluid")){
				$body.removeClass("container-fluid").addClass("container");
			}
		}
	}

	var AppComponents = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] Init");}
			ComponentScrollbar.init();
			ComponentPanel.init();
			ComponentCheckbox.init();
			ComponentSelect.init();
			ComponentDropdown.init();
			ComponentTooltip.init();
			ComponentModals.init();
			ComponentFloatingLabels.init();
			ComponentScrollbar.init();
			ComponentMaterialRipple.init();
			ComponentSnackbar.init();
			ComponentToast.init();
			ComponentSubheader.init();
			ComponentSimplePieCharts.init();
			ComponentLinearProgress.init();
			ComponentCircularProgress.init();
			ComponentSpeedDial.init();
			ComponentCKEditor.init();
		},
		reload: function(components){
			if ($.debug){
				console.log("[AppComponents] Reload Init");
				//console.log($.appComponents);
				//console.log(components);
			}
			var i = 0;
			var c = [];
			for (i = 0; i < components.length; i++) {
				$.appComponents.some(function (obj) {
					if (obj.name === components[i]) {
						if ($.debug){
							console.log("[AppComponents] RE-Loading Component: "+obj.component);
						}
						var cf = obj.component +".init()";
						eval(cf);
					}
				});
			}
		}
	}

	var ComponentPanel = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Panel Init");}
		
			// Panel
			var panel = $(".panel-footer").prev(".panel-body").addClass("panel-body-footer");

			// Panel Group
			$(".panel-group .panel .in").each(function() {
				var panel = $(this).parent();
				panel.addClass("open");
			});
			$(".panel-group").on("hide.bs.collapse", function(e) {
				var content = $(e.target);
				var panel = content.parent();
				panel.removeClass("open");
			});
			$(".panel-group").on("show.bs.collapse", function(e) {
				var content = $(e.target);
				var panel = content.parent();
				var group = panel.closest(".panel-group");
				group.find(".panel.expanded").removeClass("open");
				panel.addClass("open");
			});


			// Panel Heading Tools
			// ---------------------------------------------------------------------
			
			// Collapsible Panels
			$("#right-content").on("click",".panel-tools-collapse", function (e) {
				e.preventDefault();
				var btn 	= $(this),
					panel 	= btn.closest(".panel");
					//panel 	= btn.parent().parent().parent(".panel");

				if (panel.data("state") == "panel-collapsed") {
					$(".panel-body",panel).slideDown("slow",function(){
						btn.removeClass("collapsed");
					});
					panel.data("state","panel-open").addClass("panel-open").removeClass("panel-collapsed");
				} else {
					$(".panel-body",panel).slideUp("slow",function(){
						btn.addClass("collapsed");
					});
					panel.data("state","panel-collapsed").addClass("panel-collapsed").removeClass("panel-open");
				}
			});

			// Close Panel
			$("#right-content").on("click",".panel-tools-close",function(e) {
				e.preventDefault();
				var btn 	= $(this),
					panel 	= btn.closest(".panel");

				panel.fadeOut("slow");
			});	
		}
	};

	var ComponentCheckbox = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Checkbox Init");}
			
			if ($("body input[type=checkbox].switch,body input[type=radio].switch").exists()){
				$("body input[type=checkbox].switch,body input[type=radio].switch").iCheck({
					checkboxClass: 'custom-switch',
					radioClass: 'custom-switch',
					inheritClass: true,
				});			
			}
			if ($("body input[type=checkbox].checkbox").exists()){
				$("body input[type=checkbox].checkbox").iCheck({
					checkboxClass: 'custom-check',
					inheritClass: true,
				});			
			}
			if ($("body input[type=radio].radio").exists()){
				$("body input[type=radio].radio").iCheck({
					radioClass: 'custom-radio',
					inheritClass: true,
				});			
			}
		}
	};

	var ComponentSelect = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Selectbox Init");}
			
			if ($("select").exists()){
				$("select").selectpicker({
					dropupAuto: false,
					size: 5
				});
			}
			$(".bootstrap-select").on({
				"show.bs.dropdown":function(){
					var obj 		= $(this),
						parent 		= obj.siblings(".bs-select-hidden"),
						btn 		= $(".btn.dropdown-toggle",obj),
						dropdown 	= $(".dropdown-menu",obj),
						content 	= $(".inner",dropdown),
						id 			= $(".selected",dropdown).data("original-index"),
						idReal		= id+1,
						length		= $("li",dropdown).length,
						height 		= parent.outerHeight(),
						itemHeight	= 48,
						padding 	= 8,
						top 		= 0,
						scroll 		= 0,
						factor 		= 0,
						constant 	= itemHeight * 1 / height;				

					if (btn.hasClass("btn-default")){
						btn.removeClass("btn-default");
					}

					if (idReal > 3){
						var iR	= length - idReal;

						if (iR >= 2) {
							factor = 2;
							scroll = length - (iR + 3);
						} else if (iR == 1) {
							factor = 3;
							scroll = length - 2;
						} else if (iR == 0) {
							factor = (length >= 5) ? 4 : 3;
							scroll = length - 3;
						}

						top 	= factor * height * constant + padding;

						content.scrollTop(itemHeight * scroll);

						var style 	= {
								"top":"-"+top+"px"
							};
						dropdown.css(style);
					} else {
						top 	= height * id * constant + padding;
						style 	= {
							"top":"-"+top+"px"
						};

						dropdown.css(style);
						content.scrollTop(0);
					}
					var focusTimer = setTimeout(function(){
						parent.focus();
					},0);

				},
				"hide.bs.dropdown":  function(e) {
					var obj 		= $(this),
						parent 		= obj.siblings(".bs-select-hidden"),
						dropdown 	= $(".dropdown-menu",obj);

					var focusTimer = setTimeout(function(){
						parent.focus();
					},0);
				},
			});
		}
	};

	var ComponentDropdown = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Dropdown Init");}
			
			$(".dropdown,.dropup,.btn-group,.input-group-btn").on({
				"show.bs.dropdown":function(){
					var obj 		= $(this),
						btn 		= $('[data-toggle="dropdown"]',obj),
						menu 		= $('.dropdown-menu', obj),
						menuWidth 	= menu.outerWidth(true),
						btnWidth 	= btn.outerWidth(true),
						style 		= {
							"min-width":btnWidth+"px"
						};

					if (menuWidth < btnWidth) {
						menu.css(style);
					}

					/* Dropup Item Animation */
					var items 	= $("li",menu),
						t 		= items.length,
						x 		= 0;

					$.each(items,function(){
						var nCi 	= t - x,
							nC 		= "animation-delay-pos"+nCi;
						$(this).addClass(nC);
						x = x+1;
					});
				},
				"shown.bs.dropdown": function () {
					// Commented for debug
					//this.closable	= false;
				},
				"click": function(){
					this.closable	= true;
				},
				"hide.bs.dropdown":  function(e) {
					var obj = $(this);
					if (this.closable) {
						e.preventDefault();
						obj.addClass("closing");

						$('.dropdown-menu', obj).one("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend", function () {
							obj.removeClass('open closing');
						});

					} else {
						return false;
					}
				}
			});
		}
	};

	var ComponentTooltip = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Tooltip Init");}
			
			if ($("#language-selector").exists()){
				$("#language-selector").tooltip();
			}
			
			if ($('[data-toggle="tooltip"]').exists()){
				$('[data-toggle="tooltip"]').tooltip({
					template: '<div class="tooltip" role="tooltip"><div class="tooltip-wrapper"><div class="tooltip-background"></div><div class="tooltip-inner"></div></div></div>',
				});
			}
			
			$('[data-toggle="tooltip"]').on({
				"shown.bs.tooltip": function(){
					var obj 		= $(this),
						tip 		= obj.data("bs.tooltip").tip(),
						h 			= tip.height()/2,
						w 			= tip.width()/2,
						hipo 		= Math.sqrt(h * h + w * w),
						hipo2 		= hipo * 2,
						placement 	= {
							"top"		: "50% bottom 0px",
							"bottom"	: "50% top 0px",
							"left"		: "right 50% 0px",
							"right"		: "left 50% 0px"
						},
						placementActual = placement[obj.data("placement")],
						styles 		= {
							"width":hipo2+"px",
							"height":hipo2+"px",
							"top":"50%",
							"left":"50%",
							"margin-top":"-"+hipo2/2+"px",
							"margin-left":"-"+hipo2/2+"px",
							"transform-origin":placementActual +" !important"
						};

					$(".tooltip-background",tip).css(styles);
					var timeout = setTimeout(function(){
						$(".tooltip-background",tip).addClass("tooltip-show");
					},100);
				},
				"hide.bs.tooltip": function(){
					var obj = $(this),
						tip = obj.data("bs.tooltip").tip();

					$(".tooltip-background",tip).removeClass("tooltip-show");
				}
			});
		}
	};

	var ComponentModals = {
		init: function(){		
			if ($.debug) { console.log("[AppComponents] > Modals Init");}		
			$(".modal").on({
				"show.bs.modal":function(e){
					var obj 		= $(this),
						btn 		= $(e.relatedTarget),
						bw 			= btn.outerWidth(),
						bh 			= btn.outerHeight(),
						modal 		= $(".modal-dialog",e.target),
						mw 			= modal.outerWidth(),
						mh 			= modal.outerHeight(),
						rw 			= bw / mw,
						rh 			= bh / mh,
						offset 		= btn.offset();

					modal.data("scale",rw).data("top",offset.top).data("left",offset.left);

					var styles = {
						"transform":"scale("+rw+")",
						"opacity":0,
						"top":offset.top,
						"left":offset.left,
					}
					modal.css(styles);

					var timeOut = setTimeout(function(){
						var stylesX = {
							"transform":"scale(1) translate(-50%,-50%)",
							"opacity":1,
							"top":"50%",
							"left":"50%"
						}
						modal.css(stylesX);
					},550);
				},
				"shown.bs.modal":function(e){
					var modal 		= $(".modal-dialog",e.target);
					var styles = {
						"transform":"scale(1) translate(-50%,-50%)",
						"opacity":1,
						"top":"50%",
						"left":"50%"
					}
					//modal.css(styles);
				},
				"hide.bs.modal":function(e){
					var modal 		= $(".modal-dialog",e.target),
						scale 		= modal.data("scale"),
						top 		= modal.data("top"),
						left 		= modal.data("left");

					var styles = {
						"transform":"scale("+scale+")",
						"opacity":0,
						"top":top,
						"left":left,
					}
					modal.css(styles);
				}
			});
		}
	}

	var ComponentFloatingLabels = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > FloatingLabels Init");}
			$(".floating-label .form-control").on("keyup change", function(e) {
				var input = $(e.currentTarget);
				if ($.trim(input.val()) !== '') {
					input.addClass("filled").removeClass("static");
				} else {
					input.removeClass("filled").removeClass("static");
				}
			});
			
			if ($(".form-control").exists()){
				$(".floating-label .form-control").each(function() {
					var input = $(this);
					if ($.trim(input.val()) !== "") {
						input.addClass("static").addClass("filled");
					}
				});
				$(".form-horizontal .form-control").each(function() {
					$(this).after('<div class="form-control-line"></div>');
				});			
			}

		}
	};

	var ComponentScrollbar = {		
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Scrollbar Init");}		
			//$("#sidebar-wrapper,#right-content-wrapper").addClass("scrollbar-dynamic").scrollbar();
			//$(".has-custom-scrollbar").addClass("scrollbar-dynamic").scrollbar();
			
			$("#sidebar-wrapper,#right-content-wrapper, .side-panel-body, .panel-body").perfectScrollbar();
			$(".has-custom-scrollbar").perfectScrollbar();
		}
	};

	var ComponentMaterialRipple = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > MaterialRipple Init");}

			if ($(".btn").exists()){
				$(".btn").materialRipple({
					style: "light"
				});
			}

			if ($("#sidebar").exists()){
				$("#sidebar").find("a").materialRipple({
					style: "dark"
				});
			}
			
			if ($(".dropdown-menu li").exists()){
				$(".dropdown-menu li").materialRipple({
					style: "dark"
				});
			}
		}
	};

	var ComponentSnackbar = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Snackbar Init");}
			$.snackbar();
		}
	};
	
	var ComponentToast = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Toast Init");}
			$.toasts({
				oneAtTime: false,
				padding: "76px 16px 16px 16px"
			});
		}
	};

	var ComponentSubheader = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > Subheader Init");}
			$("[data-toggle='subheader']").subheader();
		}
	};

	var ComponentSimplePieCharts = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > SimplePieCharts Init");}
			$("[data-toggle='simple-pie-chart']").simplePieChart({
				size: 130,
				duration: 1000
			});
		}
	};

	var ComponentLinearProgress = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > LinearProgress Init");}
			$("[data-toggle='linear-progress']").linearProgress();
		}
	};

	var ComponentCircularProgress = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > CircularProgress Init");}
			$("[data-toggle='circular-progress']").circularProgress();
		}
	};

	var ComponentSpeedDial = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > SpeedDial Init");}
			$("[data-toggle='speed-dial']").speedDial();
		}
	};
	
	var ComponentCKEditor = {
		init: function(){
			if ($.debug) { console.log("[AppComponents] > CKEditor Init");}
			CKEDITOR.skinName = $.ckeditorSkin;
		}
	};


	// 2.3. Public Functions
	// ----------------------------------------------------------------------------
	cc.loadScript = {
		load: function(scripts){
			AppLoadScript.loadJS(scripts);
		}
	}
	
	cc.system = {
		setUpComponents: function(){
			AppComponents.init();
		},
		pageTransitionNormal: function(){
		
		},
		materialPageTransition: function(){
			AppAjaxNavigation.materialPageTransition(1);
		},
		normalPageTransition: function(){
			AppAjaxNavigation.materialPageTransition(0);
		},
		sidebarSubmenuAccordion: function(){
			AppSidebar.autoCollapse(1);
		},
		sidebarSubmenuNormal: function(){
			AppSidebar.autoCollapse(0);
		}
	}
	
	cc.navigate = {
		go: function(url){
			console.log("[AppNavigate] Going to: "+url);
			AppAjaxNavigation.loadURL(url,$.ajaxContainer);
		}
	}
	
	cc.sidebar = {
		toggle: function(){
			AppSidebar.toggle();
		}
	}

	cc.theme = {
		darkHeaderFull: function(){
			AppTheme.darkHeaderFull();
		},
		darkHeaderBrand: function(){
			AppTheme.darkHeaderBrand();
		},
		darkHeaderToolbar: function(){
			AppTheme.darkHeaderToolbar();
		},
		darkSidebar: function(){
			AppTheme.darkSidebar();
		},
		lightHeaderFull: function(){
			AppTheme.lightHeaderFull();
		},
		lightHeaderBrand: function(){
			AppTheme.lightHeaderBrand();
		},
		lightHeaderToolbar: function(){
			AppTheme.lightHeaderToolbar();
		},
		lightSidebar: function(){
			AppTheme.lightSidebar();
		},
		sidebarCollapsed: function(){
			AppTheme.collapsedSidebar();
		},
		sidebarNormal: function(){
			AppTheme.normalSidebar();
		},
		pageHeaderNormal: function(){
			AppTheme.headerNormal();
		},
		pageHeaderAlternative: function(){
			AppTheme.headerAlternative();
		},
		footerNormal: function(){
			AppTheme.footerNormal();
		},
		footerFixed: function(){
			AppTheme.footerFixed();
		},
		layoutNormal: function(){
			AppTheme.layoutNormal();
		},
		layoutBoxed: function(){
			AppTheme.layoutBoxed();
		}
	}



	// 3. Define Namespace
	// ----------------------------------------------------------------------------
	window.bematadmin 		= window.bematadmin || {};
	window.bematadmin.App 	= new App;
}(jQuery));



// 4. Helper Functions
// --------------------------------------------

/**
 * uniqId() Function to create unique ids
 * @return {[type]} [description]
 */
function uniqId() {
	var d = new Date();
	var n = d.getMilliseconds();
	return Math.round(new Date().getTime() + (Math.random() * 1000));
}

/**
 * Rand Function PHP Clone
 */
function rand(min,max){
	var argc = arguments.length;
	if (argc === 0) {
		min = 0;
		max = 2147483647;
	} else if (argc === 1) {
		throw new Error('Warning: rand() expects exactly 2 parameters, 1 given');
	}
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

/**
 * TypeOf
 * typeOf(); //undefined
 * typeOf(null); //null
 * typeOf(NaN); //number
 * typeOf(5); //number
 * typeOf({}); //object
 * typeOf([]); //array
 * typeOf(''); //string
 * typeOf(function () {}); //function
 * typeOf(/a/) //regexp
 * typeOf(new Date()) //date
 */
function typeOf(obj) {
  return {}.toString.call(obj).split(' ')[1].slice(0, -1).toLowerCase();
}

/**
 * Toggle Text
 */
jQuery.fn.extend({
	toggleText: function (a, b){
		var isClicked = false;
		var that = this;
		this.click(function (){
			if (isClicked) { that.text(a); isClicked = false; }
			else { that.text(b); isClicked = true; }
		});
		return this;
	}
});

/**
 * Exists Element
 */
jQuery.fn.exists = function(){return this.length>0;}


/**
 * Animate.css jQuery Transition End Callback
 */
$.fn.extend({
    animateCss: function(animationName,callback) {
        var animationEnd 	= 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
		var transitionEnd 	= 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend';
        $(this).addClass("animated "+animationName).one(transitionEnd, function() {
            $(this).removeClass("animated "+animationName);
			if (callback) {
				callback();
			}
        });
    },
	addAnimatedClass: function(animation,callback){
		var animationEnd 	= 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
		var transitionEnd 	= 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend';
		$(this).addClass(animation).one(animationEnd+" "+transitionEnd, function() {
			if (callback) {
				callback();
			}
		});
	},
	removeAnimatedClass: function(animation,callback){
		var transitionEnd 	= 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend';
		$(this).removeClass(animation).one(transitionEnd, function() {
			if (callback) {
				callback();
			}
		});
	}
});


/**
 * Animate.css jQuery Transition End Callback
 */
var s = document.body || document.documentElement, s = s.style, prefixAnimation = '', prefixTransition = '';

if( s.WebkitAnimation == '' )	prefixAnimation	 = '-webkit-';
if( s.MozAnimation == '' )		prefixAnimation	 = '-moz-';
if( s.OAnimation == '' )		prefixAnimation	 = '-o-';

if( s.WebkitTransition == '' )	prefixTransition = '-webkit-';
if( s.MozTransition == '' )		prefixTransition = '-moz-';
if( s.OTransition == '' )		prefixTransition = '-o-';

$.fn.extend({
	onCSSAnimationEnd: function( callback )
	{
		var $this = $( this ).eq( 0 );
		$this.one( 'webkitAnimationEnd mozAnimationEnd oAnimationEnd oanimationend animationend', callback );
		if( ( prefixAnimation == '' && !( 'animation' in s ) ) || $this.css( prefixAnimation + 'animation-duration' ) == '0s' ) callback();
		return this;
	},
	onCSSTransitionEnd: function( callback )
	{
		var $this = $( this ).eq( 0 );
		$this.one( 'webkitTransitionEnd mozTransitionEnd oTransitionEnd otransitionend transitionend', callback );
		if( ( prefixTransition == '' && !( 'transition' in s ) ) || $this.css( prefixTransition + 'transition-duration' ) == '0s' ) callback();
		return this;
	}
});