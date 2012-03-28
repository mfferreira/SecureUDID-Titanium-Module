if (Ti.Platform.name !== "android") {
	var secureudid = require('cc.rco.secureudid'),
		udid = '';
	
	exports.config = function(args) {
		/*
		 * argument 'vars' must be in the format:
		 * { domain: "com.example.myapp", salt: "superSecretCodeHere!@##%#$#%$^" }
		 */
		
		secureudid.config(args);
		udid = secureudid.getUDID();
	};
	
	exports.getUDID = function() {
		return udid;
	};
}
else {
	Ti.API.warning('SecureUDID module is only available for iOS at the moment.')
}
