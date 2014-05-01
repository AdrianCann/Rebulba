Rebulba.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],
  
  events: {
    "click .post-option-toggle": "toggle",
	"click .delete-post": "delete",
	"click .edit-post": "edit",
	"click .update-post": "updatePost",
	"click .like-post": "like",
	// "click .post-content": "edit",
	"click #new-post-button": "newpost"
  },

  initialize: function () {
    this.listenTo(this.collection, "add change remove reset", this.render);
	// $("html").on("click") try sams thing of clicking elsewhere to hide menu
  },
  
  newpost: function (event) {
    var that = this;
    event.preventDefault();
	var postData = $("#new-post-form").serializeJSON();
	postData["post"]["user_id"] = dataJSON.user.id + ""
	
	
	// var data = JSON.parse($("#bootstrapped_user_json").html());
	// model.user_id = data.user.id dont need cuz controller does it
	
	this.collection.create(postData, {
		parse: true,
		success: function(model) {		
			model.collection = that.collection
			Backbone.history.navigate("", { trigger: true });
		}
	});
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
  
  like: function(event) {
	  
  	
  },
  
  edit: function(event) {
	  var $target = $(event.target);
	  var id = $target.attr("data-id")
	  console.log(id)
  	Backbone.history.navigate('posts/' + id + '/edit', { trigger: true });
  },
  
  updatePost: function(event) {
	var that = this;
	var $target = $(event.target);
	var post = this.collection.get($target.attr("data-id"));
	var formData = $("#update-post-form").serializeJSON();
	post.save(formData, {patch: true, success: function(){
        that.collection.add(post);
        Backbone.history.navigate("", { trigger: true });
		}
	});
	// post.save({})
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection,
	  post: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },
  
  add: function(event) {
	  
  }

});
