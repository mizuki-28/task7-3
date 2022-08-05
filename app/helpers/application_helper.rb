module ApplicationHelper

  def user_image_url(user)

    if user.user_image.attached?
      url_for(user.user_image)
      elsif user.user_image?
        user.user_image
      else
        ActionController::Base.helpers.asset_path('default_icon.jpg')
    end

  end

  def room_cover(room)
    if room.room_image.attached?
      url_for(room.room_image[0])
    else
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end
     
end