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

		var user = Rebulba.users.get({id: json.comment_sender.id})
		
		if (user) {
			// console.log(json.user_id, "we had it in collection")
			// this._user = postUser
			
			
		} else {
			
			// console.log(json.user_id, "need to make it")
			
			var user = new Rebulba.Models.User(json.comment_sender)
			
			Rebulba.users.add(user)
			this.user = user
			
		}
		this.user = user
		return this.user

	},
	
	like: function(jsonComment) {
		
		var isNew = (!!jsonComment.likes)
		this.likes = new Rebulba.Collections.Likes(jsonComment.likes, {parse: isNew})
		console.log("end of like func")
	}
});
