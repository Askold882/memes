module UsersHelper
  def avatar_for(user)
    if user.avatar?
      image_tag user.avatar.url(:thumb)
    else
      image_tag "default-avatar.jpg"
    end
  end
end