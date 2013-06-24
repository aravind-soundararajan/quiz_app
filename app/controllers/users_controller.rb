class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index,:update]
	before_filter :correct_user, :only => [:edit, :update]

  def index
  	@title = "USERS"
  	@users = User.all
  end
  def new
  	@title="Sign Up"
  	@user = User.new

  end
  def show
  	if current_user.nil? 
  		redirect_to '/'
  		flash[:error]="You need to be signed in!"
   	end
  	@user = User.find(params[:id])
  	@questions = @user.questions
  	@title=@user.name
    @score=Score.find_by_user_id(@user.id).mark
  end
  def create
		@user = User.new(params[:user])
		if @user.save
      @score=Score.new(:user_id=>@user.id,:mark=>0)
      if @score .save
			 sign_in @user
			 flash[:success]="Welcome to Quiz App"
			 redirect_to @user
      end
		else
			@title = "Sign up"
			render 'new'
		end
  end
  def edit
		@user = User.find(params[:id])
		@title = "Edit user"
  end
  def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
  end	
  
  private
		def authenticate
			deny_access unless signed_in?
		end
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
end
