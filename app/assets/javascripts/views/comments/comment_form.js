Rebulba.Views.CommentForm = Backbone.View.extend({
  tagName: 'article',
  template: JST['comments/form'],
	
	initialize: function(options){
		this.post = options.post;
		this.comment = options.comment;
		this.collection = this.post.comments;
	},
  events: {
    'click .submit': 'submit'
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

  submit: function (event) {
		
    var that = this;
    event.preventDefault();
    var commentData = $("#update-comment-form").serializeJSON();
		
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