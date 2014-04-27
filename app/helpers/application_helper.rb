module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
    name="authenticity_token"
    value="#{form_authenticity_token}">
    HTML
  end

  def user_form(submit_value, username = "", useremail = "")
    <<-HTML.html_safe

    <div class="input">
      <label for="user-username">Username</label>
      <input type="text" id="user-username" name="user[username]" value="#{username}">
    </div>

    <div class="input">
      <label for="user-email">Email</label>
      <input type="email" id="user-email" name="user[email]" value="#{useremail}">
    </div>

    <div class="input">
      <label for="user-password">Password</label>
      <input type="password" id="user-password" name="user[password]" value="">
    </div>

    <div class="file-input">
      <label for="profile-picture">Profile Picture</label>
      <input type="file" id="profile-picture" name="user[avatar]">
    </div>
    
    <div class="submit">
      <input type="submit" value="#{submit_value}">
    </div>
    HTML
  end

  def post_form(submit_value, title = "", body="")
    <<-HTML.html_safe
    
    <div class="post-form-input">
      <label for="post-title">Post Title </label>
      <input type="text" id="post-title" name="post[title]" value="#{title}">


      <label for="post-body">Post Body</label>
      <input type="text_area" id="post-body" name="post[body]" value="#{body}">
    </div>
    
    <div class="submit">
      <input type="submit" value="#{submit_value}">
    </div>
    HTML
  end

  def comment_form(submit_value, value = "")
    <<-HTML.html_safe
      <div class="input">
        <label for="comment-body" name>Comment</label>
        <input type="textarea" id="comment-body" name=comment[body] value="#{value}">
      </div>

      <div class="submit">
        <input type="submit" value="#{submit_value}">
      </div>
    HTML
  end



end
