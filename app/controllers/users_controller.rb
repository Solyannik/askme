class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Olya',
        username: 'S.Olya',
        avatar_url: 'avatar.jpg'
      ),
      User.new(
        id: 2,
        name: 'Kolya',
        username: 'leon'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Olya',
      username: 'S.Olya',
      avatar_url: 'avatar.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.11.2020')),
      Question.new(
        text: 'В чем смысл жизни?', created_at: Date.parse('27.11.2020')
      )
    ]

    @new_question = Question.new
  end
end
