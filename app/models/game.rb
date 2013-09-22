class Game
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :organ
end
