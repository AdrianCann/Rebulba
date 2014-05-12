# Rebulba
### Summary

* Rebulba is a Tumblr clone with a Ruby on Rails backend and a Backbone.js front end.
*	It can be seen live at www.rebulba.com
* Rebulba was built as a capstone project for App Academy in NY.

### Features
* Users sign up with an email and upload a picture for their profile
	- Email must be verified
* Users can:
	- post or comment on other posts
	- like posts or comments that are not their own
	- follow other users and see their posts in their news feed
	- log in with Facebook (TK)
	- update  their own posts
	- delete a post or comment they authored. They may also delete comments on their posts.
	- receive notifications when they have new followers, comments, and likes. Comments made on a post generates notifications for the post author and all users that have commented on that post. (TK)
	
### Technical Details
* The Rails backend includes a polymorphic association likes (one can like a comment or a post).
* The user authentication system is custom built with the help of BCrypt to store an encrypted form of a user's password.
* The Backbone.js front end speeds posting, commenting, editing, and liking.
* Bootstraps jbuilder formated JSON user data (posts, comment, likes) to minimize AJAX requests
* uses Facebook omni-auth (TK)
* Unit and Integration tests with RSpec (TK)


