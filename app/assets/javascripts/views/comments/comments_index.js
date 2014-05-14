Rebulba.Views.CommentsIndex = Backbone.View.extend({
	
	initialize: function(options) {
		this.post = options.post;
		this.collection = this.post.comments;
		this.listenTo(this.collection, "add remove reset", this.render)
	},
	
	tagName: "div",
  template: JST['comments/comments'],
	
	events: {
		"click .submit-comment-button": "submitComment",
		"click .delete-comment": "deleteComment",
		"click .like-comment": "likeComment",
		"click .unlike-comment": "unlikeComment"
		
	},
	
	deleteComment: function(event) {
		var $target = $(event.target);
		
		
		//FIND THE COMMENT FROM WHATEVER COLLECTION (maybe the posts collection of comments...?)
  	var comment = this.collection.get($target.attr("data-id"));
		
		comment.destroy({
			success: function() {
				console.log("works")
			}
		});
		// this.render();
	},
	
	likeComment: function(event) {
		var that = this;
	  var $target = $(event.target);
	  var commentId = $target.attr("data-id");

		var like = {likeable_type: "Comment", likeable_id: commentId, user_id: Rebulba.current_user.id}
		comment.likes.create(like, {
			success: function() {
	
			}
		});
		
	},
	
	unlikeComment: function(event) {
		var that = this;
	  var $target = $(event.target);
	  var commentId = $target.attr("data-id")
		var postId = $target.closest("article.post").find("div.post-content").attr("data-id");
		
		var post = this.postsCollection.get(postId);
		if (!post) {
			post = this.feedsCollection.get(postId)
		};
		var comment = post.comments.get($target.attr("data-id"));
		
		var like = comment.likes.findWhere({user_id: Rebulba.current_user.id})
		like.destroy({
			success: function() {
				
			}
		})
	},
	
	submitComment: function(event) {
		event.preventDefault();
		var $form = $(event.target).closest("form")
		var commentData = $form.serializeJSON();
		
		
		
		this.collection.create(commentData.comment, {
			parse: true,
			success: function() {
				console.log("yay")
				// Rebulba.comments.add(comment);
				// Backbone.history.navigate("", { trigger: true });
			},
			error: function() {
				console.log("couldnt submit")
			}
		});
		
		
	},
	
	render: function() {
	  var renderedContent = this.template({
			post: this.post,
			comments: this.collection
	  });
		this.$el.html(renderedContent);
		this.$el.find('.timeago').timeago();
	  return this;
	}
	
	

});




