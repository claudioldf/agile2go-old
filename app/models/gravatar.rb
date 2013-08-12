class Gravatar
  attr_reader :email

  def initialize(email)
    @email = email
  end
    
  def hash
    Digest::MD5.hexdigest(email.to_s.strip.downcase)
  end

  def url
    "http://www.gravatar.com/avatar/#{hash}?s=50"
  end
end
