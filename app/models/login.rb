class Login
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def self.find_by_username(username)
    user = User.find_by_username(username)

    if user
      Login.new(user)
    else
      nil
    end
  end

  def verify_password(password)
    @user.password == password
  end
end
