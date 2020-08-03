class UsersController < ApplicationController

  skip_before_action :login_check_user, only: [:new, :create, :show]
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :set_current_user, only: [:show, :destroy, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "アカウント作成しました"
    else
      render :new if @user.invalid?
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集しました"
    else
      render :edit if @user.invalid?
    end
  end

  def confirm
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "アカウント削除しました"
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :icon, :icon_cache,
                                 :remove_icon, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    if current_user.id == @user.id
    else
      redirect_to user_path(current_user.id), notice: "権限がありません" 
    end

  end

end
