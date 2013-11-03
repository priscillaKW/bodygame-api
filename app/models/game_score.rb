class GameScore
  include Mongoid::Document
  include Mongoid::Timestamps

  GAME_TYPES = %w(HangmanGame AssociationGame QuizGame WordSearchesGame)

  field :score, type: Float
  field :game_type

  belongs_to :user
  belongs_to :organ

  validates :score,     presence: true
  validates :user,      presence: true
  validates :organ,     presence: true
  validates :game_type, presence: true, inclusion: { in: GAME_TYPES }
end
