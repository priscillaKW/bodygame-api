BodygameApi::Application.routes.draw do
  post 'login' => 'logins#create'

  post 'users'     => 'users#create'
  get  'users/:id' => 'users#show',   as: 'user'

  post 'users/:user_id/character' => 'characters#create'
  put  'users/:user_id/character' => 'characters#update'

  get 'organs'     => 'organs#index', as: 'organs'
  get 'organs/:id' => 'organs#show',  as: 'organ'

  get 'studies/:id'              => 'studies#show',  as: 'study'
  get 'organs/:organ_id/studies' => 'studies#index', as: 'studies'

  get 'games/:id'              => 'games#show',  as: 'game'
  get 'organs/:organ_id/games' => 'games#index', as: 'games'

  get 'game_scores/:id'             => 'game_scores#show',  as: 'game_score'
  get  'users/:user_id/game_scores' => 'game_scores#index', as: 'game_scores'
  post 'users/:user_id/game_scores' => 'game_scores#create'
end
