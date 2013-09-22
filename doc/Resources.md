POST /users
  {
    "username": "login",
    "password": "something"
  }
  =>
  201

GET /users/:id
  200
  {
    "id":         1,
    "username":   "login",
    "created_at": "2013-12-25T12:00:00",
    "updated_at": "2013-12-25T12:00:00"
  }

POST /login
  {
    "username": "login",
    "password": "something"
  }
  =>
  200
  {
    "id":         1,
    "username":   "login",
    "created_at": "2013-12-25T12:00:00",
    "updated_at": "2013-12-25T12:00:00"
  }

GET /users/:user_id/games
  [
    {
      "id":       1,
      "organ_id": 2,
      "tip_game_done": true,
    }
  ]

POST /users/:user_id/games/done/:game_id
  200

GET /games/tip/:id
  {
    "id": 1,
    ...
  }

GET /games/word/:id
  {
    "id": 1,
    ...
  }

GET /organs/:id
  200

GET /organs/:id/studies
  [
    {
      "id": 1,
      "organ_id": 123,
      "content": "..."
    },
    {
      "id": 2,
      "organ_id": 123,
      "content": "..."
    }
  ]
