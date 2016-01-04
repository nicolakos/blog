class Admin::UsersController < Admin::ApplicationController
  def new
    @page_title = 'Add User'
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'user Created'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'User Updated'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.update(user_params)
      flash[:notice] = 'user Deleted'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end


end
