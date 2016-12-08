/**
 * BEMAT ADMIN COMPONENTS
 */

$.bematAppComponents = [
	{
		name: 		"Panel",
		component: 	"ComponentPanel"
	},
	{
		name: 		"Checkbox",
		component: 	"ComponentCheckbox",
		js:			["vendor/iCheck/icheck.min.js"]
	},
	{
		name: 		"Select",
		component: 	"ComponentSelect",
		js:			["vendor/bootstrap-select/bootstrap-select.min.js"]
	},
	{
		name: 		"Dropdown",
		component: 	"ComponentDropdown"
	},
	{
		name: 		"Tooltip",
		component: 	"ComponentTooltip"
	},
	{
		name: 		"Modals",
		component: 	"ComponentModals"
	},
	{
		name: 		"FloatingLabels",
		component: 	"ComponentFloatingLabels"
	},
	{
		name: 		"Scrollbar",
		component: 	"ComponentScrollbar"
	},
	{
		name: 		"MaterialRipple",
		component: 	"ComponentMaterialRipple",
		js:			["vendor/materialRipple/jquery.materialRipple.js"]
	},
	{
		name: 		"Snackbar",
		component: 	"ComponentSnackbar",
		js:			["vendor/snackbar/jquery.snackbar.js"]
	},
	{
		name: 		"Toast",
		component: 	"ComponentToast",
		js:			["vendor/toasts/jquery.toasts.js"]
	},
	{
		name: 		"SubheaderList",
		component: 	"ComponentSubheader",
		js:			["vendor/subheader/jquery.subheader.js"]
	},
	{
		name: 		"SimplePieCharts",
		component: 	"ComponentSimplePieCharts",
		js:			["vendor/simplePieChart/jquery.simplePieChart.js"]
	},
	{
		name: 		"LinearProgress",
		component: 	"ComponentLinearProgress",
		js:			["vendor/linearProgress/jquery.linearProgress.js"]
	},
	{
		name: 		"CircularProgress",
		component: 	"ComponentCircularProgress",
		js:			["vendor/circularProgress/jquery.circularProgress.js"]
	},
	{
		name: 		"SpeedDial",
		component: 	"ComponentSpeedDial",
		js:			["vendor/speedDial/jquery.speedDial.js"]
	},
	{
		name: 		"Prettify",
		js:			["vendor/google-code-prettify/prettify.js"]
	},
	{
		name: 		"DataTables",
		js:			[
			"vendor/DataTables/js/jquery.dataTables.min.js",
			"vendor/DataTables/js/dataTables.bootstrap.min.js"
		]
	},
	{
		name: 		"FullCalendar",
		js:			[
			"vendor/fullcalendar/moment.min.js",
			"vendor/fullcalendar/fullcalendar.min.js"
		]
	},
	{
		name: 		"Sparkline",
		js:			["vendor/sparkline/jquery.sparkline.min.js"]
	},
	{
		name: 		"Peity",
		js:			["vendor/peity/jquery.peity.min.js"]
	},
	{
		name: 		"Chartist",
		js:			["vendor/chartist/chartist.min.js"]
	},
	{
		name: 		"Chartjs",
		js:			["vendor/chartjs/Chart.min.js"]
	},
	{
		name: 		"Sweetalert",
		js:			["vendor/sweetalert/sweetalert.min.js"],
		css:		["vendor/sweetalert/sweetalert.css"]
	},
	{
		name: 		"Clipboard",
		js:			["vendor/clipboard/clipboard.min.js"]
	},
	{
		name: 		"CKEditor",
		component: 	"ComponentCKEditor",
		js:			[
						"vendor/ckeditor/ckeditor.js",
						"vendor/ckeditor/adapters/jquery.js"
					]
	},
	{
		name: 		"Summernote",
		js:			[
						"vendor/summernote/summernote.min.js"
					]
	},
	{
		name: 		"Markdown",
		js:			["vendor/bootstrap-markdown/bootstrap-markdown.js"],
		css:		["vendor/bootstrap-markdown/bootstrap-markdown.min.css"]
	},
	{
		name: 		"WYSIHTML5",
		js:			["vendor/wysihtml5/bootstrap3-wysihtml5.all.min.js"]
	},
	{
		name: 		"Simditor",
		js:			[
						"vendor/simditor/module.min.js",
						"vendor/simditor/hotkeys.min.js",
						"vendor/simditor/uploader.min.js",
						"vendor/simditor/simditor.min.js"
					],
		css:		["vendor/simditor/simditor.css"]
	},
	{
		name: 		"Trumbowyg",
		js:			[
						"vendor/trumbowyg/trumbowyg.min.js",
						"vendor/trumbowyg/plugins/base64/trumbowyg.base64.min.js",
						"vendor/trumbowyg/plugins/colors/trumbowyg.colors.min.js",
						"vendor/trumbowyg/plugins/editlink/trumbowyg.editlink.min.js",
						"vendor/trumbowyg/plugins/preformatted/trumbowyg.preformatted.min.js",
						"vendor/trumbowyg/plugins/upload/trumbowyg.upload.min.js"						
					],
		css:		[
						"vendor/trumbowyg/ui/trumbowyg.min.css",
						"vendor/trumbowyg/plugins/colors/ui/trumbowyg.colors.min.css",
						"vendor/trumbowyg/plugins/preformatted/ui/trumbowyg.preformatted.min.css"
					]
	},
	{
		name: 		"MediumEditor",
		js:			["vendor/medium-editor/medium-editor.min.js"],
		css:		[
						"vendor/medium-editor/css/medium-editor.min.css",
						"vendor/medium-editor/css/themes/bootstrap.min.css"
					]
	},
	{
		name: 		"Ace",
		js:			["vendor/ace/ace.js"]
	},
	{
		name: 		"CodeMirror",
		js:			[
			"vendor/codemirror/codemirror.js",
			"vendor/codemirror/mode/javascript/javascript.js"
		],
		css:		["vendor/codemirror/codemirror.css"]
	},
	{
		name: 		"GooglePrettify",
		js:			["vendor/google-code-prettify/prettify.js"],
		css:		["vendor/google-code-prettify/themes/"+$.prettifyTheme+".css"]
	},
	{
		name: 		"Prism",
		js:			["vendor/prism/prism.js"],
		css:		["vendor/prism/prism.css"]
	},
	{
		name: 		"Highlight",
		js:			["vendor/highlight/highlight.pack.js"],
		css:		["vendor/highlight/styles/monokai-sublime.css"]
	},
	{
		name: 		"Gmaps",
		js:			[
			"http://maps.google.com/maps/api/js?sensor=true&region=nz&async=2",
			"http://cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.9/gmaps.min.js"
		]
	}
	
	

]