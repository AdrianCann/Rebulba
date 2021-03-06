Rebulba.Models.Like = Backbone.Model.extend({
	urlRoot: "/api/likes",
	
  initialize: function() {
		
		
  },

  parse: function(json) {
		this.setUser(json)
		return json

  },
	
	setUser: function(json) {
		
		
		var user = this.user;
		if (user) {
			return user;
		}

		var user = Rebulba.users.get({id: json.user_id})
		
		if (!user) {
						
			var user = new Rebulba.Models.User(json.user)
			
			Rebulba.users.add(user)			
		}
		this.user = user
		return this.user
	}
});

