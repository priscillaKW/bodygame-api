class QuizGame < Game
  field :question, type: String
  field :option_a, type: String
  field :option_b, type: String
  field :option_c, type: String
  field :option_d, type: String
  field :answer,   type: String
end
