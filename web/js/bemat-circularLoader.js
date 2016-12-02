// ProgressConfig (var progressConfig)
var mdProgressCircular = {
	progressSize: 50,
	strokeWidth: 5,
	duration: 100,
	easeFn: linearEase,

	durationIndeterminate: 500,
	startIndeterminate: 3,
	endIndeterminate: 80,
	rotationDurationIndeterminate: 2900,
	easeFnIndeterminate: materialEase,

	easingPresets: {
		linearEase: linearEase,
		materialEase: materialEase
	}
},
scope = {
	value: "10%",
	mdDiameter: 50,
	mdMode: "indeterminate"
};
var mdUtilnow = function(){
	return new Date().getTime();
}

//progressLink();

function progressLink(element){
	var path = $("path",element);
	var svg = $("svg",element);
	var startIndeterminate = mdProgressCircular.startIndeterminate;
	var endIndeterminate = mdProgressCircular.endIndeterminate;
	var rotationIndeterminate = 0;
	var lastAnimationId = 0;
	var interval;

	startIndeterminateAnimation();
	
	function renderCircle(animateFrom, animateTo, easing, duration, rotation) {
		var id = ++lastAnimationId;
		var startTime = mdUtilnow();
		var changeInValue = animateTo - animateFrom;
		var diameter = getSize(scope.mdDiameter);;
		var pathDiameter = diameter - getStroke(diameter);
		var ease = easing || mdProgressCircular.easeFn;
		var animationDuration = duration || mdProgressCircular.duration;

		// No need to animate it if the values are the same
		if (animateTo === animateFrom) {
			path.attr('d', getSvgArc(animateTo, diameter, pathDiameter, rotation));
		} else {
			requestAnimationFrame(function animation(now) {
				//var currentTime = window.Math.min((now || mdUtilnow()) - startTime, animationDuration);
				var currentTime = window.Math.min(mdUtilnow() - startTime, animationDuration);

				path.attr('d', getSvgArc(
					ease(currentTime, animateFrom, changeInValue, animationDuration),
					diameter,
					pathDiameter,
					rotation
					));

				if (id === lastAnimationId && currentTime < animationDuration) {
					requestAnimationFrame(animation);
				}
			});
		}
	}

	function animateIndeterminate() {
		renderCircle(
			startIndeterminate,
			endIndeterminate,
			mdProgressCircular.easeFnIndeterminate,
			mdProgressCircular.durationIndeterminate,
			rotationIndeterminate
			);

		// The % 100 technically isn't necessary, but it keeps the rotation
		// under 100, instead of becoming a crazy large number.
		rotationIndeterminate = (rotationIndeterminate + endIndeterminate) % 100;

		var temp = startIndeterminate;
		startIndeterminate = -endIndeterminate;
		endIndeterminate = -temp;
	}

	function startIndeterminateAnimation() {
		if (!interval) {
			var startTime = mdUtilnow();
			var animationDuration = mdProgressCircular.rotationDurationIndeterminate;
			var radius = getSize(scope.mdDiameter) / 2;

		// Spares us at least a little bit of string concatenation.
		radius = ' ' + radius + ', ' + radius;

		// This animates the indeterminate rotation. This can be achieved much easier
		// with CSS keyframes, however IE11 seems to have problems centering the rotation
		// which causes a wobble in the indeterminate animation.
		requestAnimationFrame(function animation(now) {
			//var timestamp = now || mdUtilnow();
			var timestamp = mdUtilnow();
			var currentTime = timestamp - startTime;
			var rotation = mdProgressCircular.easingPresets.linearEase(currentTime, 0, 360, animationDuration);

			path.attr('transform', 'rotate(' + rotation + radius + ')');

			if (interval) {
				requestAnimationFrame(animation);
			} else {
				path.removeAttr('transform');
			}

			// Reset the animation
			if (currentTime >= animationDuration) {
				startTime = timestamp;
			}
		});

		interval = setInterval(function(){
			animateIndeterminate();
		},mdProgressCircular.durationIndeterminate + 50);

		animateIndeterminate();
		//element.removeAttr('aria-valuenow');
		}
	}
	

	function cleanupIndeterminateAnimation() {
		if (interval) {
			clearTimeout(interval);
			interval = null;
		}
	}
	
	function destroy(){
		cleanupIndeterminateAnimation();
	}
	
	progressLink.destroy = destroy;
	
} // END ProgressLink



function getSvgArc(current, diameter, pathDiameter, rotation) {
	// The angle can't be exactly 360, because the arc becomes hidden.
	var maximumAngle = 359.99 / 100;
	var startPoint = rotation || 0;
	var radius = diameter / 2;
	var pathRadius = pathDiameter / 2;

	var startAngle = startPoint * maximumAngle;
	var endAngle = current * maximumAngle;
	var start = polarToCartesian(radius, pathRadius, startAngle);
	var end = polarToCartesian(radius, pathRadius, endAngle + startAngle);
	var arcSweep = endAngle < 0 ? 0 : 1;
	var largeArcFlag;

	if (endAngle < 0) {
		largeArcFlag = endAngle >= -180 ? 0 : 1;
	} else {
		largeArcFlag = endAngle <= 180 ? 0 : 1;
	}

	return 'M' + start + 'A' + pathRadius + ',' + pathRadius +
	' 0 ' + largeArcFlag + ',' + arcSweep + ' ' + end;
}

/**
* Converts Polar coordinates to Cartesian.
*
* @param {number} radius Radius of the container.
* @param {number} pathRadius Radius of the path element
* @param {number} angleInDegress Angle at which to place the point.
*
* @returns {string} Cartesian coordinates in the format of `x,y`.
*/
function polarToCartesian(radius, pathRadius, angleInDegrees) {
	var DEGREE_IN_RADIANS = Math.PI / 180;
	var angleInRadians = (angleInDegrees - 90) * DEGREE_IN_RADIANS;

	return (radius + (pathRadius * Math.cos(angleInRadians))) +
	',' + (radius + (pathRadius * Math.sin(angleInRadians)));
}
/**
* Limits a value between 0 and 100.
*/
function clamp(value) {
	return window.Math.max(0, window.Math.min(value || 0, 100));
}

/**
* Determines the size of a progress circle, based on the provided
* value in the following formats: `X`, `Ypx`, `Z%`.
*/
function getSize(value) {
	var defaultValue = mdProgressCircular.progressSize;
	return defaultValue;
}

/**
* Determines the circle's stroke width, based on
* the provided diameter.
*/
function getStroke(diameter) {
	return mdProgressCircular.strokeWidth / 100 * diameter;
}

function linearEase(t, b, c, d) {
	return c * t / d + b;
}

function materialEase(t, b, c, d) {
	// via http://www.timotheegroleau.com/Flash/experiments/easing_function_generator.htm
	// with settings of [0, 0, 1, 1]
	var ts = (t /= d) * t;
	var tc = ts * t;
	return b + c * (6 * tc * ts + -15 * ts * ts + 10 * tc);
}  

// http://paulirish.com/2011/requestanimationframe-for-smart-animating/
// http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

// requestAnimationFrame polyfill by Erik Möller
// fixes from Paul Irish and Tino Zijdel

(function() {
	var lastTime = 0;
	var vendors = ['ms', 'moz', 'webkit', 'o'];
	for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
		window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
		window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame']
		|| window[vendors[x]+'CancelRequestAnimationFrame'];
	}

	if (!window.requestAnimationFrame) {
		window.requestAnimationFrame = function(callback, element) {
			var currTime = new Date().getTime();
			var timeToCall = Math.max(0, 16 - (currTime - lastTime));
			var id = window.setTimeout(function() { callback(currTime + timeToCall); },
				timeToCall);
			lastTime = currTime + timeToCall;
			return id;
		};		
	}
	if (!window.cancelAnimationFrame) {
		window.cancelAnimationFrame = function(id) {
			clearTimeout(id);
		};		
	}
}());