Rebulba.Views.PostForm = Backbone.View.extend({
  tagName: 'form',
  template: JST['posts/form'],
  events: {
    'click button': 'submit'
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    var that = this;
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    this.model.collection = this.collection;
    this.model.save(attrs, {
      success: function (post) {
        that.collection.add(post);
        Backbone.history.navigate("", { trigger: true });
      },
	  error: function() {
		  alert("error")
	  }
    });
  }
});