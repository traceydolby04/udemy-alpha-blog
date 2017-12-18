module ApplicationHelper
  # gravatar is a free online tool to display an image for a given user's email address
  # the algorithm in Ruby to add MD5 using the hex digest is below
  def gravatar_for(user, options = { size: 80})
    gravatar_id =Digest::MD5::hexdigest(user.email.downcase)
    size = options [:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
