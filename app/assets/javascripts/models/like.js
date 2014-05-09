Rebulba.Models.Like = Backbone.Model.extend({
	urlRoot: "/api/likes",
	
  initialize: function() {
    this.user = this.user || Rebulba.currentUser;
  },

  parse: function(json) {
    if (json.user) {
      this.user = new Rebulba.Models.User(json.user);
      delete json.user;
    } else {
			
      this.user = Rebulba.currentUser;
    }
    return json;
  }
});

//wastefully adds a new user each time... do the set user method instead