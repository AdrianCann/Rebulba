Rebulba.Collections.Posts = Backbone.Collection.extend({
	url: "/api/posts",
  model: Rebulba.Models.Post,
  comparator: function(post1, post2) {
	  if (post1.isNew()) {
		  return -1
	  } else if (post2.isNew()) {
		  return 1
	  }
	  
	  if (post1.get("created_at") < post2.get("created_at")) {
		  return -1
	  } else {
		  return 1
	  }
  }

});
