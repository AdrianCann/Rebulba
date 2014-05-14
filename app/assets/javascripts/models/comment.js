Rebulba.Models.Comment = Backbone.Model.extend({
	urlRoot: "/api/comments",
	
	parse: function(jsonComment) {
		
		// this.user = new Rebulba.Models.User(jsonComment.comment_sender)
// 		delete jsonComment.comment_sender
		this.setUser(jsonComment);
		this.like(jsonComment);
		// Rebulba.comments.add(this)
		
		return jsonComment
	},
	
	setUser: function(json) {
		
		var user = this.user;
		if (user) {
			return user;
		}
		var user_id = Rebulba.current_user.get("id")
		var user = Rebulba.users.get(user_id)
		
		this.user = user
		
		
		return this.user

	},
	
	like: function(jsonComment) {
		var isNew = (!!jsonComment.likes)
		this.likes = new Rebulba.Collections.Likes(jsonComment.likes, {parse: isNew})
		console.log("end of like func")
	}
});
