Rebulba.Models.Like = Backbone.Model.extend({
	urlRoot: "/api/likes",
	
  initialize: function() {
    this.user = this.user || Rebulba.current_user;
		this.user_id = this.user_id || Rebulba.current_user.id
  },

  parse: function(json) {
		
		
    if (json.user) {
      this.user = new Rebulba.Models.User(json.user);
      delete json.user;
    } else {
			
      this.user = Rebulba.current_user;
    }
    return json;
  }
});

//wastefully adds a new user each time... do the set user method instead