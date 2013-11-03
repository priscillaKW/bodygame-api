FactoryGirl.define do
  factory :game_score, class: GameScore do
    score     99.99
    game_type "HangmanGame"
    user
    organ
  end
end
