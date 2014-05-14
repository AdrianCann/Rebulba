Rebulba.Views.CommentsIndex = Backbone.View.extend({
	
	initialize: function(options) {
		this.post = options.post;
		this.collection = this.post.comments;
	},
	
	tagName: "div",
  template: JST['comments/comments'],
	
	events: {
		
		
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




