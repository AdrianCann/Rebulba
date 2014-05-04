Rebulba.Models.Post = Backbone.Model.extend({
	initialize: function() {

	},
	
	parse: function(json) {
		this.user(json)
		delete json["user"]
		this.like(json)
		delete json["like"]
		return json;
	},
	
	urlRoot: "/api/posts",
	
	user: function(json) {
		var user = this._user;
		if (user) {
			return user;
		}
		var postUser = Rebulba.users.get({id: this.get("user_id")})
		if (postUser) {
			// this._user = postUser
			return postUser;
		} else {
			
			var newUser = new Rebulba.Models.User(json["user"])
			Rebulba.users.add(newUser)
			
		}
		this._user = newUser
		
		return this._user

	},
	
	like: function(json) {
		
	}
	
});
