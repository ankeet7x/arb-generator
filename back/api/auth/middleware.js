const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
	try{
		var username = req.body.username;
		var password = req.body.password; 
		if (username == "korean" && password == "dating"){
			console.log("user authenticated");
			next();
		}else{
			res.status(401).json({
				message: "Authentication Failed",
				error: e
			})
		}
	}catch(e){
		res.status(401).json({
			message: 'authFailed',
			error: e
		});
	}
};