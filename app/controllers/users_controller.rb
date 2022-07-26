class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!
    @user.email.strip!

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'You have successfully signed up!'
    else
      redirect_to '/signup', notice: @user.errors.full_messages.first
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email, 
      :password, 
      :password_confirmation)
  end

end
