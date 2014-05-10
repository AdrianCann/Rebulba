window.Rebulba = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		
		dataJSON = JSON.parse($("#bootstrapped_user_json").html());
	 	Rebulba.ownPage = dataJSON["ownPage"]
		Rebulba.users = new Rebulba.Collections.Users();
	 	Rebulba.comments = new Rebulba.Collections.Comments();
	 	Rebulba.likes = new Rebulba.Collections.Likes();
	 	Rebulba.current_user = new Rebulba.Models.User(dataJSON.current_user)
	 	Rebulba.users.add(Rebulba.current_user);
	  
		
		var coll = new Rebulba.Collections.Posts(dataJSON["user-posts"], {parse: true});
		Rebulba.posts = coll;
	
		Rebulba.feed = new Rebulba.Collections.Posts(dataJSON["feed-posts"], {parse: true});
		
		
	
	
    new Rebulba.Routers.PostsRouter({
      $rootEl: $("#feed"),
      posts: Rebulba.posts,
			feed: Rebulba.feed,
	  	users: Rebulba.users,
			comments: Rebulba.comments
    });
    Backbone.history.start();
	
  }
};

