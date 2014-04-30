Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
    "click .post-option-toggle": "toggle",
	"click .delete-post": "delete",
	"click .edit-post": "edit",
	"click .like-post": "like"
  },

  initialize: function () {
    this.listenTo(this.collection, "add change:title remove reset", this.render);
	// $("html").on("click") try sams thing of clicking elsewhere to hide menu
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
  
  delete: function(event) {
	var $target = $(event.target);
  	post = this.collection.get($target.attr("data-id"));
	console.log(post.escape("title"))
	console.log(post)
	post.destroy();
	// I just destroyed my user
  },
  
  edit: function(event) {
	  
  	
  },
  
  like: function(event) {
  	
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
