window.Rebulba = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	 Rebulba.users = new Rebulba.Collections.Users();
	  
		dataJSON = JSON.parse($("#bootstrapped_user_json").html());
		
		console.log(dataJSON)
	
		var coll = new Rebulba.Collections.Posts(dataJSON["user-posts"], {parse: true});
		Rebulba.posts = coll;
	
		var feed = new Rebulba.Collections.Posts(dataJSON["feed-posts"], {parse: true});	
		Rebulba.feed = feed;
		
		var likes = new Rebulba.Collections.Likes()
	
	
    new Rebulba.Routers.PostsRouter({
      $rootEl: $("#feed"),
      posts: Rebulba.posts,
			feed: Rebulba.feed,
	  	users: Rebulba.users
    	  
    });
    Backbone.history.start();
	
  }
};

