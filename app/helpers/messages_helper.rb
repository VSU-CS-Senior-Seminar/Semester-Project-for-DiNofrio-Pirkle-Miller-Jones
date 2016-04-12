module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      if (user != current_user) && (current_user.zipcode == user.zipcode) && (!user.role.eql?"business") && (!user.role.eql?"agency")
        s << "<option value='#{user.id}'>#{user.name}</option>"
      end
    end
    s.html_safe
  end
end