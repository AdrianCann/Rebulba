Rebulba.Models.Comment = Backbone.Model.extend({
	urlRoot: "/api/comments",
	
	parse: function(jsonComment) {
		
		// this.user = new Rebulba.Models.User(jsonComment.comment_sender)
// 		delete jsonComment.comment_sender
		this.setUser(jsonComment)
		return jsonComment
	},
	
	setUser: function(json) {
		
		var user = this.user;
		if (user) {
			return user;
		}
		var commentUser = Rebulba.users.get({id: this.get("user_id")})
		if (commentUser) {			
			this.user = commentUser;
			return commentUser;
		} else {
			var newUser = new Rebulba.Models.User(dataJSON.user);
			Rebulba.users.add(newUser);
			this.user = newUser;
			return this.user;
		}
		
		
		
	}
});
