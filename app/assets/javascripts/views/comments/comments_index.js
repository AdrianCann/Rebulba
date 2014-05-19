Rebulba.Views.CommentsIndex = Backbone.View.extend({
	
	initialize: function(options) {
		this.post = options.post;
		this.collection = this.post.comments;
		this.listenTo(this.collection, "add change remove reset", this.render)
	},
	
	tagName: "div",
  template: JST['comments/comments'],
	
	events: {
		"click .submit-comment-button": "submitComment",
		"click .delete-comment": "deleteComment",
		"click .like-comment": "likeComment",
		"click .unlike-comment": "unlikeComment",
		"click p": "editComment"
		
	},
	
	deleteComment: function(event) {
		var $target = $(event.target);
		
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
		
		var comment = this.post.comments.get(commentId)

		var like = {likeable_type: "Comment", likeable_id: commentId, user_id: Rebulba.current_user.id}
		
		comment.likes.create(like, {
			
			success: function() {
				console.log("great")
				that.render();
			}
		});
		
	},
	
	unlikeComment: function(event) {
		var that = this;
	  var $target = $(event.target);
	  var commentId = $target.attr("data-id")
		
		
		var comment = this.post.comments.get(commentId)
		
		var like = comment.likes.findWhere({user_id: Rebulba.current_user.id})
		
		
		like.destroy({
			success: function() {
				that.render();
			}
		})
	},
	
	submitComment: function(event) {
		that = this;
		event.preventDefault();
		var $form = $(event.target).closest("form")
		var commentData = $form.serializeJSON();
		var comment = commentData.comment
		
		if (comment.body === ""){
			return
		};
		
		comment.comment_sender = {id: Rebulba.current_user.id}
		
		//increase comment number
		
		this.collection.create(comment, {
			parse: true,
			success: function() {
				
			},
			error: function() {
			}
		});
			
	},
	
	editComment: function(event) {
	
		var $target = $(event.target);
		var comment = this.collection.get($target.attr("data-id"));
		if (comment.user.id !== Rebulba.current_user.id) {
			return;
		}
		
		var view = new Rebulba.Views.CommentForm({
			post: this.post,
			comment: comment
		})
		// this.listenTo(view, "cancel", this.render)
		
		var $tag = $target.parent("article")
		$tag = $target
		$tag.html(view.render().$el)
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




