module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, one, few, many)
<<<<<<< HEAD
    return "" if number.nil? || number == 0
    remainder_100 = number % 100
    return many if remainder_100.between?(11, 14)
    remainder = number % 10
    return one if remainder == 1
    return few if remainder.between?(2, 4)
    return many
=======
    return "0 #{many}" if (number.nil? || number == 0)
    remainder_100 = number % 100
    return many if remainder_100.between?(11, 14)
    remainder = number % 10
    return "#{number} #{one}" if remainder == 1
    return "#{number} #{few}" if remainder.between?(2, 4)
    "#{number} #{many}"
>>>>>>> 4b743a11dbedd6818b0cd5518806e42a25c7ec87
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
