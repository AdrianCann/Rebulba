Rebulba.Models.Post = Backbone.Model.extend({
	initialize: function() {

	},
	
	parse: function(json) {
		this.user(json);
		delete json["user"];
		this.like(json);
		delete json["likes"];
		this.comments = new Rebulba.Collections.Comments(json["comments"], {parse: true})
		delete json["comments"]
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
		
		this.likes = new Rebulba.Collections.Likes(json.likes, {parse: true})
		this.likes_count = json.likes_count
		
	}
	
	// comment: function(json) {
	// 	debugger
	// 	(json["comments"]).each(function(comment){
	// 		console.log(comment)
	// 		var model = new Rebulba.Models.Comment(comment)
	// 		Rebulba.comments.add(model)
	// 	})
	// 	
	// },
	
	
});
