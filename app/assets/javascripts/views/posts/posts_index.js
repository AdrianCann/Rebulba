Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
	  "click .post-option-toggle": "toggle",
		"click .delete-post": "delete",
		"click .edit-post": "edit",
		"click .update-post": "updatePost",
		"click .like-post": "like",
		// "click .post-content": "edit",
		"click #new-post-button": "newpost",
		"click .toggle-feed": "toggleFeed"
  },

  initialize: function (options) {
		this.postsCollection = options.postsCollection;
		this.feedsCollection = options.feedsCollection;
    this.listenTo(this.postsCollection, "add change remove reset", this.render);
	// $("html").on("click") try sams thing of clicking elsewhere to hide menu
  },
  
  newpost: function (event) {
		
    var that = this;
    event.preventDefault();
		var postData = $("#new-post-form").serializeJSON();
		postData["post"]["user_id"] = dataJSON.user.id + "";
		var user = dataJSON["user"];
		postData["user"] = user;		
		
	// var data = JSON.parse($("#bootstrapped_user_json").html());
	// model.user_id = data.user.id dont need cuz controller does it
	
		this.postsCollection.create(postData, {
			parse: true,
			success: function(model) {
				console.log("here")
				// debugger	
				// model.collection = that.postsCollection;
				
				Backbone.history.navigate("", { trigger: true });
			},
			error: function() { 
				console.log("error: didnt create post for collection")
			}
		});
  },

  toggle: function (event) {
    var $target = $(event.target);
    
	$scope = $target.parent().parent().next("div")
	
	if ($scope.is(".is-visible")) {
		$scope.removeClass("is-visible")
		
	} else {
		$scope.addClass("is-visible")
	}

  },
  
  delete: function(event) {
	var $target = $(event.target);
  	var post = this.postsCollection.get($target.attr("data-id"));
	post.destroy();
  },
  
  like: function(event) {
	  
  	
  },
  
  edit: function(event) {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
	  console.log(id)
  	Backbone.history.navigate('posts/' + id + '/edit', { trigger: true });
  },
  
  updatePost: function(event) {
	var that = this;
	var $target = $(event.target);
	var post = this.collection.get($target.attr("data-id"));
	var formData = $("#update-post-form").serializeJSON();
	post.save(formData, {patch: true, success: function(){
        that.collection.add(post);
        Backbone.history.navigate("", { trigger: true });
		}
	});
	// post.save({})
  },
	
	toggleFeed: function() {
		
	},

  render: function () {
    var renderedContent = this.template({
      posts: this.postsCollection,
			feed: this.feedsCollection,
	  	post: this.model
    });
    this.$el.html(renderedContent);
		// debugger
		this.$el.find('.timeago').timeago();
    return this;
  },
  
  add: function(event) {
	  
  }

});
