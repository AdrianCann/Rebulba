Rebulba.Views.SideNav = Backbone.View.extend({
  tagName: 'nav',
  template: JST['posts/form'],
  events: {
    'click button': 'render'
  },

  render: function () {
    var renderedContent = this.template({
      
    });
    this.$el.html(renderedContent);
    return this;
  },


});