module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, slon, slona, slonov)
    remainder_100 = number % 100
    return "#{number} #{slonov}" if remainder_100.between?(11, 14)
    remainder = number % 10
    return "#{number} #{slon}" if remainder == 1
    return "#{number} #{slona}" if remainder.between?(2, 4)
    "#{number} #{slonov}" if remainder.between?(5, 9)
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
