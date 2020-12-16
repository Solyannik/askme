class UsersController < ApplicationController
  before_action :load_user, except: %i[index create new]
  before_action :authorize_user, except: %i[index new create show]

  def index
    @users = User.sorted
  end

  def new
    redirect_to root_path, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def create
    redirect_to root_path, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены!'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
    @number_of_questions = @questions.count
    @questions_with_answer = @questions.where.not(answer: nil).count
    @questions_without_answer = @number_of_questions - @questions_with_answer
  end

  def destroy
    @user.destroy
    flash[:success] = "Пользователь удалён!"
    redirect_to root_path
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url, :profile_color)
  end
end
