class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Olga',
      username: 'S.Olya',
      avatar_url: 'https://yandex.ru/search/?text=%D1%81%D0%BE%D0%BB%D1%8F%D0%BD%D0%BD%D0%B8%D0%BA%20%D0%BE%D0%BB%D1%8C%D0%B3%D0%B0&lr=22&clid=2186621&src=suggest_T'
    )
  end
end
