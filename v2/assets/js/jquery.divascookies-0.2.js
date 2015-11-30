/*!
 * Title: Divas Cookies jQuery plugin - jquery.divascookies-0.2.js
 * Author: Federica Sibella (@musingspuntoit) and Michela Chiucini (@webislove) - Coding Divas (@CodingDivas)
 * Author URI: http://www.musings.it - http://www.colazionedamichy.it - http://www.codingdivas.net/divascookies
 * Version: 0.2.dev
 * Date: 2014.10.27
 * 
 * Changelog:
 * 2014.10.02: minor changes to default options (no image and acceptButtontext)
 * 2014.09.15: minor debug + code check and optimization
 * 2014.09.12 added open effects, easing options, third party policy widget (iubenda only), debug mode and save user preferences option
 * 2014.09.11 initial development
 */

;(function($) {
    $.DivasCookies = function(options) {
    	var defaults = {
					bannerText				: "This website uses cookies.",		// text for the Divas Cookies banner
					cookiePolicyLink		: "",								// link to the extended cookie policy
					cookiePolicyLinkText	: "Read our cookie policy.",		// text for the link to the extended cookie policy
					thirdPartyPolicyWidget	: "",								// if set to "iubenda" tries to use the Iubenda widget
					acceptButtonText		: "Ok",								// text for the accept/close button
					acceptButtonSrc			: "",								// source for the accept/close button image
					declineButtonText		: "No cookies, please",				// text for the decline/close button (to be used in future releases)
					declineButtonSrc		: "",								// source for the decline/close button image (to be used in future releases)
					openEffect				: "",								// opening effect for Divas Cookies banner ["fade", "slideUp", "slideDown", "slideLeft", "slideRight"]
					openEffectDuration		: 600,								// duration of the opening effect (msec)
					openEffectEasing		: "swing",							// easing for the opening effect
					closeEffect				: "",								// closing effect for Divas Cookies banner ["fade", "slideUp", "slideDown", "slideLeft", "slideRight"]
					closeEffectDuration		: 600,								// duration of the closing effect (msec)
					closeEffectEasing		: "swing",							// easing for the closing effect
					debugMode				: false,							// if true, the options are checked and warnings are shown
					saveUserPreferences		: true								// if true, sets a cookie after the Divas Cookies is closed the first time and never shows it again
				},
		settings = $.extend({}, defaults, options),
		// internal variables
		$divascookies		= $(),
		$bannerContainer	= $(),
		cookiePolicyLink	= "",
		$bannerText			= $(),
		$acceptButton		= $(),
		$acceptButtonContent	= $(),
		cookieName			= "DisplayDivasCookiesBanner";
		
		// create Divas Cookies container & data
		$divascookies = $("<div class='divascookies'></div>");
		$divascookies.data("divascookies", {
			cookieName : cookieName
		});
		
		// checking input values if debugMode is true
		if(settings.debugMode === true) {
			// bannerText check
			if(settings.bannerText === "")
				alert("Divas Cookies plugin warning!\nNo text for the banner: please check bannerText value");
			// cookiePolicyLink check
			if(settings.cookiePolicyLink === "")
				alert("Divas Cookies plugin warning!\nNo link to the extended cookie policy: please check cookiePolicyLink value");
			// cookiePolicyLinkText check
			if(settings.cookiePolicyLinkText === "")
				alert("Divas Cookies plugin warning!\nNo text for extended cookie policy link: please check cookiePolicyLinkText value");
			// acceptButtonText check
			if(settings.acceptButtonText === "")
				alert("Divas Cookies plugin warning!\nNo text for accept button: please check acceptButtonText value");
			// acceptButtonSrc check
			if(settings.acceptButtonSrc === "")
				alert("Divas Cookies plugin warning!\nNo source for accept button image: please check acceptButtonSrc value");	
		}
		
		// create banner container
		$bannerContainer = $("<div class='divascookies-banner-container'></div>");
		// create extended policy link
		cookiePolicyLink = "<span class='divascookies-policy-link'><a href='" + settings.cookiePolicyLink + "' >" + settings.cookiePolicyLinkText + "</a></span>";
		// iubenda?
		if(settings.thirdPartyPolicyWidget === "iubenda")
		{
			cookiePolicyLink = "<span class='divascookies-policy-link'><a href='" + settings.cookiePolicyLink + "' class='iubenda-white iubenda-embed'>" + settings.cookiePolicyLinkText + "</a></span>";
		}
		
		// create banner text
		$bannerText = $("<p class='divascookies-banner-text'>" + settings.bannerText + " " + cookiePolicyLink + "</p>");
		// create close button container
		$acceptButton = $("<div class='divascookies-accept-button-container'></div>");
		
		// if there is an image for the accept/close button use it
		if(settings.acceptButtonSrc !== "") {
			$acceptButtonContent = $("<img class='divascookies-accept-button-img' src='" + settings.acceptButtonSrc + "' alt='" + settings.acceptButtonText + "' title='" + settings.acceptButtonText + "' />");
		}
		else { // else use the text
			$acceptButtonContent = $("<p class='divascookies-accept-button-text'>" + settings.acceptButtonText + "</p>");	
		}
		
		// build Divas Cookies banner with all its elements
		$divascookies.append($bannerContainer);
		$bannerContainer.append($bannerText);
		$bannerContainer.append($acceptButton);
		$acceptButton.append($acceptButtonContent);
		
		// if we don't have to save cookies or the preference cookie has not been set yet: show the banner
		if(!settings.saveUserPreferences || _checkCookie(cookieName)) {
			$("body").append($divascookies);
			
			// switching open effects
			switch(settings.openEffect) {
				case "fade":
					$divascookies.fadeIn(settings.openEffectDuration, settings.openEffectEasing);
					break;
				case "slideUp":
					$divascookies.css({"bottom": "-100%", "top": "auto"}).show(function() {
						$divascookies.animate({"bottom": 0}, settings.openEffectDuration, settings.openEffectEasing);
					});
					break;
				case "slideDown":
					$divascookies.css({"top": "-100%", "bottom": "auto"}).show(function() {
						$divascookies.animate({"top": 0}, settings.openEffectDuration, settings.openEffectEasing);
					});
					break;	
				case "slideLeft":
					$divascookies.css({"left": "-100%", "right": "auto"}).show(function() {
						$divascookies.animate({"left": 0}, settings.openEffectDuration, settings.openEffectEasing);
					});
					break;
				case "slideRight":
					$divascookies.css({"left": "100%", "right": "auto"}).show(function() {
						$divascookies.animate({"left": 0}, settings.openEffectDuration, settings.openEffectEasing);
					});		
					break;
				default:
					$divascookies.show();
					break;	
			}
		}
		
		// add click action to the accept/close button
		$acceptButton.on("click", function() {
			
			// set cookie to remember user preferences if we have to save them
			if(settings.saveUserPreferences)
				_setCookie(cookieName);
			
			// switch close effects
			switch(settings.closeEffect) {
				case "fade":
					$divascookies.fadeOut(settings.closeEffectDuration, settings.closeEffectEasing);
					break;
				case "slideUp":
					$divascookies.animate({"top": "-100%"}, settings.closeEffectDuration, settings.closeEffectEasing, function() {
						$divascookies.hide();
					});
					break;
				case "slideDown":
					$divascookies.animate({"bottom": "-100%"}, settings.closeEffectDuration, settings.closeEffectEasing, function() {
						$divascookies.hide();
					});
					break;	
				case "slideLeft":
					$divascookies.animate({"left": "-100%"}, settings.closeEffectDuration, settings.closeEffectEasing, function() {
						$divascookies.hide();
					});
					break;
				case "slideRight":
					$divascookies.animate({"left": "100%"}, settings.closeEffectDuration, settings.closeEffectEasing, function() {
						$divascookies.hide();
					});		
					break;
				default:
					$divascookies.hide();
					break;	
			}	
		}); 
		
		return $divascookies;
		
		/*----------------------------------------
		 * Divas Cookies service functions 
		 -----------------------------------------*/
		
		/**
		 * function to set a cookie after the accept/close
		 * button is clicked (not to show the banner again)
		 * expires in 1 year (from Google cookiechoices)
		 */
		function _setCookie(cookieName) {
	      // Set the cookie expiry to one year after today.
	      var expiryDate = new Date();
	      expiryDate.setFullYear(expiryDate.getFullYear() + 1);
	      document.cookie = cookieName + '=yes; expires=' + expiryDate.toGMTString();
	    }
		
		/**
		 * function that checks if the banner has already been shown
		 * (from Google cookiechoices)
		 */
	    function _checkCookie(cookieName) {
	      // Display the header only if the cookie has not been set.
	      return !document.cookie.match(new RegExp(cookieName + '=([^;]+)'));
	    }
		
		/**
		 * function that deletes the cookies based on their names
		 * (if we want to add a function that resets cookies)
		 */
		function _deleteCookie(cookieName) {
			if(!_checkCookie(cookieName)) {
				document.cookie = cookieName + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
			}
		}
    };
}(jQuery));