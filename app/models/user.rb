class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def self.find_by_username(username)
    self.find_by(username: username)
  end
end
