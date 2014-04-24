module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
    name="authenticity_token"
    value="#{form_authenticity_token}">
    HTML
  end

  def user_form(submit_value)
    <<-HTML.html_safe

    <div class="input">
      <label for="user-username">Username</label>
      <input type="text" id="user-username" name="user[username]" value="">
    </div>

    <div class="input">
      <label for="user-email">Email</label>
      <input type="email" id="user-email" name="user[email]" value="">
    </div>

    <div class="input">
      <label for="user-password">Password</label>
      <input type="password" id="user-password" name="user[password]" value="">
    </div>

    <div class="submit">
      <input type="submit" value="#{submit_value}">
    </div>
    HTML
  end

  def post_form(submit_value)
    <<-HTML.html_safe
      <label for="post-title">Post Title </label>
      <input type="text" id="post-title" name="post[title]" value="">


      <label for="post-body">Post Body</label>
      <input type="text_area" id="post-body" name="post[body]" value="">


      <input type="submit" value="#{submit_value}">
    HTML
  end



end
