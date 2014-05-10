Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
	  "click .post-option-toggle": "toggle",
		"click .delete-post": "deletePost",
		"click .edit-post": "edit",
		"click .update-post": "updatePost",
		"click .like-post": "like",
		// "click .post-content": "edit",
		"click #new-post-button": "newpost",
		"click .show-feed-button": "renderFeed",
		"click .show-wall-button": "renderWall",
		"click .view-comments": "viewComments",
		"click .submit-comment-button": "submitComment",
		"click .delete-comment": "deleteComment"
  },

  initialize: function (options) {
		var that = this;
		this.postsCollection = options.postsCollection;
		this.feedsCollection = options.feedsCollection;
		this.commentsCollection = Rebulba.comments;
    this.listenTo(this.postsCollection, "add change remove reset", this.render);
		this.listenTo(Rebulba.comments, "add change remove reset", this.render);
		this.listenTo(Rebulba.likes, "add remove reset", function() {
			that.render
			that.renderFeed
		}) //will render wall... not feed.
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
				Rebulba.comments.add(comment);
				Backbone.history.navigate("", { trigger: true });
			},
			error: function() {
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
  
  deletePost: function(event) {
	var $target = $(event.target);
  var post = this.postsCollection.get($target.attr("data-id"));
	post.destroy();
  },
  
  like: function(event) {
		
		var that = this;
	  var $target = $(event.target);
	  var postId = $target.attr("data-id")
  	var post = this.feedsCollection.get(postId);
		var like = {likeable_type: "Post", likeable_id: postId, user_id: Rebulba.current_user.id}
		
		post.likes.create(like, {
			success: function() {
				
				post.likes_count += 1
				debugger
				post.save()
				that.render();
				that.renderFeed();
			},
			error: function() {
				
			}
		});
		
		
		
		
  },
  
  edit: function(event) {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
  	Backbone.history.navigate('posts/' + id + '/edit', { trigger: true });
  },
	
	deleteComment: function(event) {
		var $target = $(event.target);
		var post_id = $target.closest("article.post").find("div.post-content").attr("data-id")
		
		var post = this.postsCollection.get(post_id);
		if (!post) {
			post = this.feedsCollection.get(post_id)
		};
		
		//FIND THE COMMENT FROM WHATEVER COLLECTION (maybe the posts collection of comments...?)
  	var comment = post.comments.get($target.attr("data-id"));
		
		comment.destroy();
		this.render();
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
