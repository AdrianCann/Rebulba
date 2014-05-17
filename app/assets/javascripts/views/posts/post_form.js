Rebulba.Views.PostForm = Backbone.View.extend({
  tagName: 'form',
  template: JST['posts/form'],
	
	initialize: function(options){
		this.model = options.post;
		this.collection = options.collection
	},
  events: {
    'click .submit': 'submit'
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model
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
    var attrs = this.$el.serializeJSON();
	console.log(attrs)
    this.model.collection = this.collection;
    this.model.save(attrs, {
      success: function (post) {
		  console.log("success")
        that.collection.add(post);
        Backbone.history.navigate("", { trigger: true });
      },
	  error: function() {
		  alert("error")
	  }
    });
  }
});