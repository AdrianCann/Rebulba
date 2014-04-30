Rebulba.Routers.PostsRouter = Backbone.Router.extend({
	
    initialize: function (options) {
      this.posts = options.posts;
      this.$rootEl = options.$rootEl;
    },
	
    routes: {
      '': 'index',
      'posts/new': 'new',
      'posts/:id': 'show',
      'posts/:id/edit': 'edit'
    },
	

    edit: function (id) {
      var that = this;
      this._getPost(id, function (post) {
        var formView = new Rebulba.Views.PostForm({
          collection: that.posts,
          model: post
        });

        that._swapView(formView);
      });
    },

    index: function () {
      var indexView = new Rebulba.Views.PostsIndex({
        collection: this.posts
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
        collection: this.posts
      });
      this._swapView(indexView);
    },

    _swapView: function (view) {
      this._currentView && this._currentView.remove();
      this._currentView = view;
      this.$rootEl.html(view.render().$el);
    }

});
