class CompletedGame
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer

  belongs_to :user
  belongs_to :game
end
