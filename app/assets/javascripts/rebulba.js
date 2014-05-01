window.Rebulba = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	Rebulba.posts = new Rebulba.Collections.Posts();
	// Rebulba.feedposts = new Rebulba.Collections.Posts();
    Rebulba.posts.fetch({
      success: function () {
        new Rebulba.Routers.PostsRouter({
          $rootEl: $("#feed"),
          posts: Rebulba.posts
		  
        });
        Backbone.history.start();
      },
	  
	  error: function() {
		  console.log("oh no")
	  }
    });
  }
};

