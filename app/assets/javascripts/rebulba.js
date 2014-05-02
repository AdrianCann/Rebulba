window.Rebulba = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	 Rebulba.users = new Rebulba.Collections.Users();
	  
	dataJSON = JSON.parse($("#bootstrapped_user_json").html());
	
	var coll = new Rebulba.Collections.Posts(dataJSON["user-posts"], {parse: true});
	var feed = new Rebulba.Collections.Posts(dataJSON["feed-posts"], {parse: true});
	
	Rebulba.feed = feed
	
	Rebulba.posts = coll;
	
	// console.log(dataJSON)
	
	// console.log(data["user-posts"])
	
	// Rebul
	// Rebulba.feedposts = new Rebulba.Collections.Posts();
	
	
    new Rebulba.Routers.PostsRouter({
      $rootEl: $("#feed"),
      posts: Rebulba.posts,
			feed: Rebulba.feed,
	  	users: Rebulba.users
    	  
    });
    Backbone.history.start();
	
  }
};

