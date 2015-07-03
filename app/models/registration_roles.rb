class RegistrationRoles
  attr_accessor :roles

  def initialize(roles)
    @roles = roles
  end
end

<% @registrations.each do |registration| %>
<%= registration.course.title %>

<%= f.label :role, "Lead" %>
<%= f.check_box("role_ids", :value => "Lead") %>


<br><br>
Checkbox to send object
<% end %>
