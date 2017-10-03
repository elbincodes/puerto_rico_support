<%= form_for @post, url: {action: "comments/new", :controller=>"comments"}, html: {class: "comment_form"} do |f| %>
  <%= f.text_area :content, size: "60x12" %>
  <%= f.submit "Create Comment" %>
<% end %>

<form class="" action="comments/new" method="post">
  <link rel="stylesheet" href="/css/master.css">
  <input type="text" name="comment" value="text">
  <input type="hidden" name="crazy" value="#{<%= @post.id %>}">
  <input type="submit" name="create comment" value="submit">
</form>




<%= form_for @post, url: {action: "posts/comments/new", :controller=>"comments"}, html: {class: "comment_form"} do |f| %>
  <%= f.text_area :content, size: "60x12" %>
  <%= f.submit "Create Comment" %>
<% end %>
