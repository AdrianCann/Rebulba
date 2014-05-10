Rebulba.Models.Comment = Backbone.Model.extend({
	urlRoot: "/api/comments",
	
	parse: function(jsonComment) {
		
		// this.user = new Rebulba.Models.User(jsonComment.comment_sender)
// 		delete jsonComment.comment_sender
		this.setUser(jsonComment)
		this.like(jsonComment)
		Rebulba.comments.add(this)
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
			
			var userData = json["comment_sender"]
			if (!userData) {
				userData = dataJSON["current_user"]
			}
			var newUser = new Rebulba.Models.User(userData);
			Rebulba.users.add(newUser);
			this.user = newUser;
			return this.user;
		}
	},
	
	like: function(jsonComment) {
		
		
		this.likes = new Rebulba.Collections.Likes(jsonComment.likes, {parse: true})
		
	}
});
