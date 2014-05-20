Rebulba.Views.CommentForm = Backbone.View.extend({
  tagName: 'div',
  template: JST['comments/form'],
	
	initialize: function(options){
		this.post = options.post;
		this.comment = options.comment;
		this.collection = this.post.comments;
	},
  events: {
    'click .update-comment-button': 'updateComment'
  },

  render: function () {
    var renderedContent = this.template({
      post: this.post,
			comment: this.comment
    });
    this.$el.html(renderedContent);
    return this;
  },
  
	//   updatePost: function(event) {
	// var that = this;
	// var $target = $(event.target);
	// var post = this.collection.get($target.attr("data-id"));
	// var formData = $("#update-post-form").serializeJSON();
	// post.save(formData, {patch: true, success: function(){
	//         that.collection.add(post);
	//         Backbone.history.navigate("", { trigger: true });
	// 	}
	// });
	// // post.save({})
	//   },

  updateComment: function (event) {
		
    var that = this;
    event.preventDefault();
    var commentData = $("#update-comment-form").serializeJSON();
		
		
		if (commentData.comment.body === this.comment.escape("body")){
			$target = $(event.target)
			$target.parentsUntil("p").parent().html(commentData.comment.body)
		}
		
    this.comment.save(commentData.comment, {
      success: function (){
		  	console.log("success")
				
        // that.collection.add(post);
        // Backbone.history.navigate("", { trigger: true });
      },
	  error: function() {
		  alert("error")
	  }
    });
  }
});