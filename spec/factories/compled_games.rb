FactoryGirl.define do
  factory :completed_game, class: CompletedGame do
    user
    game
  end
end
