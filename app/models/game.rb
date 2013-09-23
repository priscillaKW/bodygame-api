class Game
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer

  belongs_to :organ
end
