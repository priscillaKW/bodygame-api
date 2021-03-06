task :bootstrap => :environment do
  bootstrap = BodygameApi.bootstrap

  bootstrap["organs"].each do |o|
    organ = Organ.new(name: o["name"], image_file_name: o["image_file_name"], stage: o["stage"])

    Array(o["studies"]).each do |s|
      organ.studies << Study.new(s)
    end

    Array(o["hangman_games"]).each do |g|
      organ.games << HangmanGame.new(g)
    end

    Array(o["quiz_games"]).each do |g|
      organ.games << QuizGame.new(g)
    end

    Array(o["word_searches_games"]).each do |g|
      organ.games << WordSearchesGame.new(g)
    end

    Array(o["association_games"]).each do |g|
      organ.games << AssociationGame.new(g)
    end

    organ.save!
  end
end
