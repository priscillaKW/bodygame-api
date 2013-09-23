namespace :bootstrap do
  task :organs => :environment do
    BodygameApi.bootstrap["organs"].each do |o|
      organ = Organ.new(name: o["name"], image_file_name: o["image_file_name"])

      o["studies"].each do |s|
        organ.studies << Study.new(s)
      end

      o["hangman_games"].each do |g|
        organ.games << HangmanGame.new(g)
      end

      o["quiz_games"].each do |g|
        organ.games << QuizGame.new(g)
      end

      o["word_searches_games"].each do |g|
        organ.games << WordSearchesGame.new(g)
      end

      o["association_games"].each do |g|
        organ.games << AssociationGame.new(g)
      end

      organ.save!
    end
  end
end
