Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
		"click .view-new-post-option": "viewNewPostForm",
		"click .delete-post": "deletePost",
		"click .edit-post": "edit",
		"click .like-post": "likePost",
		"click #new-post-button": "newpost",
		"click .show-feed-button": "renderFeed",
		"click .show-wall-button": "renderWall",
		"click .view-comments": "viewComments",
		"click .hide-comments": "hideComments",
		"click .unlike-post": "unlikePost"

  },

  initialize: function (options) {
		var that = this;
		this.postsCollection = options.postsCollection;
		this.feedsCollection = options.feedsCollection;
		this.commentsCollection = Rebulba.comments;
    this.listenTo(this.postsCollection, "add change remove reset", this.render);
		// this.listenTo(Rebulba.comments, "add change remove reset", this.render);
		this.listenTo(Rebulba.likes, "add remove reset", function() {
			that.render
			that.renderFeed
		}) //will render wall... not feed.
	// $("html").on("click") try sams thing of clicking elsewhere to hide menu
  },
	
	viewNewPostForm: function(){
		
	},
  
  newpost: function (event) {
		
    var that = this;
    event.preventDefault();
		var postData = $("#new-post-form").serializeJSON();
		postData["post"]["user_id"] = dataJSON.user.id + "";
		var post = postData.post
		
		// validity check
		if (post.title === "" || post.body === ""){
			return
		};
	
		this.postsCollection.create(post, {
			parse: true,
			success: function(model) {
				
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
  
  deletePost: function(event) {
	var $target = $(event.target);
  var post = this.postsCollection.get($target.attr("data-id"));
	post.destroy();
  },
  
  likePost: function(event) {
		
		var that = this;
	  var $target = $(event.target);
	  var postId = $target.attr("data-id")
  	var post = this.feedsCollection.get(postId);
		if (!post) {
			post = this.postsCollection.get(postId);
		};
		var like = {likeable_type: "Post", likeable_id: postId, user_id: Rebulba.current_user.id}
		
		post.likes.create(like, {
			success: function() {
				that.render();
				if (Rebulba.ownPage) {
					that.renderFeed();
				};	
			},
			error: function() {
				
			}
		});
	},
		
	unlikePost: function(event) {
		var that = this;
	  var $target = $(event.target);
	  var postId = $target.attr("data-id")
  	var post = this.feedsCollection.get(postId);
		if (!post) {
			post = this.postsCollection.get(postId);
		};
		var like = post.likes.findWhere({user_id: Rebulba.current_user.id})
		like.destroy({
			success: function() {
				that.render();
				if (Rebulba.ownPage) {
					that.renderFeed();
				};
			},
		})
		
		
	},
		

  
  
  edit: function(event) {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
		var post = this.postsCollection.get(id)
		
		var view = new Rebulba.Views.PostForm({
			post: post,
			collection: this.postsCollection
		})
		var $tag = $target.closest("div")
		
		$tag.html(view.render().$el)
  	// Backbone.history.navigate('posts/' + id + '/edit', { trigger: true });
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
	
	viewComments: function(event) {
	  var $target = $(event.target);
		

		
	  var id = $target.attr("data-id")
  	var post = this.feedsCollection.get(id);
		if (!post) {
			post = this.postsCollection.get(id);
		};
		
		// var $tag = $target.closest("div").parent("div").parent().children("div.comment").children();
		var $tag = $target.parent().parent().next().next().children();
		if ($tag.length === 0){
			$tag = $target.parent().parent().next().children()
		}
		
		if ($target.hasClass("visible")){
			$tag.html("")
			$target.removeClass("visible")
			
		} else {
			var commentView = new Rebulba.Views.CommentsIndex({
				post: post
			})
		
			$tag.html(commentView.render().$el)
			$target.addClass("visible");
			
		}
		

	},
	
	// hideComments: function() {
	// 	var $target = $(event.target);
	// 	var $tag = $target.parent().parent().next().next().children();
	// 	if ($tag.length === 0){
	// 		$tag = $target.parent().parent().next().children()
	// 	};
	// 	console.log($tag)
	// 	$tag.html("<h1>NOTHING HERE NOW</h1>")
	// },

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
