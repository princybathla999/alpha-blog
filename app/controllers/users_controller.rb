class UsersController < ApplicationController
  before_action :set_user,only: [:edit, :update, :show  ]
  before_action :require_same_user, only: [:edit,:update]
  def index
    @users= User.paginate(page: params[:page],per_page: 2 )
  #  @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end
  def edit
  end

  def update
   if @user.update_attributes(user_params)
   flash[:success]= "User Updated Successfully"
    redirect_to articles_path
   else
     render 'edit'
   end
  end

  def show
  @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end
  def destroy

  end
  private
  def set_user
    @user = User.find(params[:id] )
  end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
 def require_same_user
   if current_user != @user
     flash[:danger]= "You can edit only your account."
     redirect_to root_path
   end
 end
end