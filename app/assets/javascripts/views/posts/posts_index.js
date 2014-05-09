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
		"click .show-feed-button": "renderFeed",
		"click .show-wall-button": "renderWall",
		"click .view-comments": "viewComments",
		"click .submit-comment-button": "submitComment"
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
	
		this.postsCollection.create(postData, {
			parse: true,
			success: function(model) {
				console.log("here")				
				Backbone.history.navigate("", { trigger: true });
			},
			error: function() { 
				console.log("error: didnt create post for collection")
			}
		});
  },
	
	submitComment: function(event) {
		event.preventDefault();
		var $form = $(event.target).closest("form")
		var commentData = $form.serializeJSON();
		
		var id = $(event.target).attr("data-id")
		
		var post = this.postsCollection.get(id)
		if (!post) {
			post = this.feedsCollection.get(id)
		};
		post.comments.create(commentData, {
			parse: true,
			success: function(comment) {
				console.log("success with comment create")
			},
			error: function() {
				console.log("oh no fail")
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
		var that = this;
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
		
  	var post = this.feedsCollection.get(id);
		var likeTotal = post.likes_count + 1
		
  },
  
  edit: function(event) {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
  	Backbone.history.navigate('posts/' + id + '/edit', { trigger: true });
  },
  
  updatePost: function(event) {
	var that = this;
	var $target = $(event.target);
	var post = this.collection.get($target.attr("data-id"));
	var formData = $("#update-post-form").serializeJSON();
	post.save(formData, {
		patch: true,
		success: function() {
        that.postsCollection.add(post);
        Backbone.history.navigate("", { trigger: true });
		}
	});
	// post.save({})
  },
	
	renderWall: function() {
		$(".feed-wrap").removeClass("visible")
		$(".wall-wrap").addClass("visible")
		$(".wall-button-wrap").removeClass("visible")
		$(".feed-button-wrap").addClass("visible")
	},
	
	renderFeed: function() {
		$(".feed-wrap").addClass("visible")
		$(".wall-wrap").removeClass("visible")
		$(".wall-button-wrap").addClass("visible")
		$(".feed-button-wrap").removeClass("visible")
	},
	
	viewComments: function() {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
	},

  render: function () {
    var renderedContent = this.template({
      userPosts: this.postsCollection,
			feedPosts: this.feedsCollection,
	  	post: this.model
    });
    this.$el.html(renderedContent);
		this.$el.find('.timeago').timeago();
    return this;
  }

});
