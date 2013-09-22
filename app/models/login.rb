class Login
  def initialize(username, password)
    @username = username
    @password = password
  end

  def self.find_by_username(username)
    user = User.find_by_username(username)

    if user
      Login.new(user.username, user.password)
    else
      nil
    end
  end

  def verify_password(password)
    @password == password
  end
end
