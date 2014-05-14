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
		var postUser = Rebulba.users.get({id: json.user_id})
		
		if (postUser) {
			// console.log(json.user_id, "we had it in collection")
			// this._user = postUser
			this._user = postUser
			return postUser;
		} else {
			
			// console.log(json.user_id, "need to make it")
			
			var postUser = new Rebulba.Models.User(json["user"])
			
			Rebulba.users.add(postUser)
			
		}
		this._user = postUser
		
		
		return this._user

	},
	
	like: function(json) {
		
		this.likes = new Rebulba.Collections.Likes(json.likes, {parse: true})
		this.likes_count = json.likes_count
		
	}

	
});
