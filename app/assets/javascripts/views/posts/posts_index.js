Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
    "click .post-option-toggle": "toggle",
	"click .delete-post": "delete",
	"click .edit-post": "edit",
	"click .like-post": "like",
	"click .post-content": "edit"
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
  	var post = this.collection.get($target.attr("data-id"));
	post.destroy();
  },
  
  edit: function(event) {
	  var $target = $(event.target);
	  var $scope = $target.parent("div")
	  // works for clicking on body
	  console.log($scope.attr("data-id"))
	  var post = this.collection.get($scope.attr("data-id"));
	  // modal time
  	
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
  },
  
  add: function(event) {
	  console.log(event)
  }

});
