Rebulba.Routers.PostsRouter = Backbone.Router.extend({
	
    initialize: function (options) {
      this.posts = options.posts;
      this.$rootEl = options.$rootEl;
			this.feed = options.feed;
			this.comments = options.comments;
	  
    },
	
    routes: {
      '': 'index',
      'posts/new': 'new',
      'posts/:id': 'show',
      'posts/:id/edit': 'edit'
    },
	

    edit: function(id) {
      var that = this;
			
      this._getPost(id, function (post) {
        var formView = new Rebulba.Views.PostForm({
          collection: that.posts,
          post: post
        });
				
        that._swapView(formView);
      });
    },

    index: function () {
	var newPost = new Rebulba.Models.Post();
      var indexView = new Rebulba.Views.PostsIndex({
        postsCollection: this.posts,
				feedsCollection: this.feed,
				model: newPost
      });
      this._swapView(indexView);
    },

    new: function () {
      var that = this;
      var newPost = new Rebulba.Models.Post();
      var formView = new Rebulba.Views.PostForm({
        collection: this.posts,
        model: newPost
      });

      that._swapView(formView);
    },

    show: function (id) {
      var that = this;
      this._getPost(id, function (post) {
        var formView = new Rebulba.Views.PostShow({
          model: post
        });
        that._swapView(formView);
      });
    },

    index: function () {
      var indexView = new Rebulba.Views.PostsIndex({
        postsCollection: this.posts,
				feedsCollection: this.feed,
				commentsCollection: this.comments
      });
      this._swapView(indexView);
    },
	
    _getPost: function (id, callback) {
      var that = this;
      var post = Rebulba.posts.get(id);
      if (!post) {
        post = new Rebulba.Models.Post({
          id: id
        });
        post.collection = this.posts;
        post.fetch({
          success: function () {
            that.posts.add(post);
            callback(post);
          }
        });
      } else {
        callback(post);
      }
    },

    _swapView: function (view) {
      this._currentView && this._currentView.remove();
      this._currentView = view;
      this.$rootEl.html(view.render().$el);
    }

});
