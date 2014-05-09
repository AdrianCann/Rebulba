Rebulba.Models.Comment = Backbone.Model.extend({
	urlRoot: "/api/comments",
	
	parse: function(jsonComment) {
		
		this.user = new Rebulba.Models.User(jsonComment.comment_sender)
		delete jsonComment.comment_sender
		return jsonComment
	},
	
	setUser: function(json) {
		
		var user = this._user;
		if (user) {
			return user;
		}
		var postUser = Rebulba.users.get({id: this.get("user_id")})
		if (postUser) {
			this._user = postUser
			return postUser;
		} else {
			
			var newUser = new Rebulba.Models.User(json["user"])
			Rebulba.users.add(newUser)
			
		}
		this._user = newUser
		
		return this._user
	}
});
