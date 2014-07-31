module ApplicationHelper
#    def show_user_bg
#     if current_user?
#     "background: url(current_user.profile.background_image)"
#   else
#     "background: url(http://i.huffpost.com/gen/1718418/thumbs/o-CHELSEA-ADIDAS-KIT-facebook.jpg)"
#   end
# end

def welcome
  if current_user
   current_user.first_name
 end
end

def has_profile?
  if current_user
    if current_user.profile
      return true
    end
  end
  false
end
end
