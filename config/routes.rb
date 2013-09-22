BodygameApi::Application.routes.draw do
  post 'login' => 'logins#create'

  post 'users'     => 'users#create'
  get  'users/:id' => 'users#show',   as: 'user'

  get 'organs'     => 'organs#index', as: 'organs'
  get 'organs/:id' => 'organs#show',  as: 'organ'

  get 'studies/:id'              => 'studies#show',  as: 'study'
  get 'organs/:organ_id/studies' => 'studies#index', as: 'studies'

  get 'games/:id'              => 'games#show',  as: 'game'
  get 'organs/:organ_id/games' => 'games#index', as: 'games'

  get  'users/:user_id/completed_games' => 'completed_games#index', as: 'completed_games'
  post 'users/:user_id/completed_games' => 'completed_games#create'
end
