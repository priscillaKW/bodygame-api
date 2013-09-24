# BodyGame Api [![Build Status](https://travis-ci.org/priscillaKW/bodygame-api.png)](https://travis-ci.org/priscillaKW/bodygame-api)

## Resources

### Create a user

    POST http://bodygame-api/users

    {
      "username": "someusername",
      "password": "strongpassword"
    }

    =>

    201

    {
      "id":         "523f5e8fb59c44ddfd000001",
      "username":   "someusername",
      "password":   "strongpassword",
      "created_at": "2013-09-22T21:18:18.112Z",
      "updated_at": "2013-09-22T21:18:18.112Z"
    }

### Show a user

    GET http://bodygame-api/users/:id

    =>

    200
    {
      "id":         "523f5e8fb59c44ddfd000001",
      "username":   "someusername",
      "password":   "strongpassword",
      "created_at": "2013-09-22T21:18:18.112Z",
      "updated_at": "2013-09-22T21:18:18.112Z"
    }

### Login

    POST http://bodygame-api/login

    {
      "username": "someusername",
      "password": "strongpassword"
    }

    =>

    200

    {
      "id":         "523f5e8fb59c44ddfd000001",
      "username":   "someusername",
      "password":   "strongpassword",
      "created_at": "2013-09-22T21:18:18.112Z",
      "updated_at": "2013-09-22T21:18:18.112Z"
    }


