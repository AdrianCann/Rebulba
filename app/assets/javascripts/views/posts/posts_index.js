Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
    "click .post-option-toggle": "toggle"
  },

  initialize: function () {
    this.listenTo(this.collection, "add change:title remove reset", this.render);
  },

  toggle: function (event) {
    var $target = $(event.target);
    // var post = this.collection.get($target.attr("data-id"));
    
	$scope = $target.parent().parent().next("div")
	
	if ($scope.is(".is-visible")) {
		$scope.removeClass("is-visible")
		
	} else {
		$scope.addClass("is-visible")
	}

  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection,
	  user: this.user
    });
    this.$el.html(renderedContent);
    return this;
  }

});
